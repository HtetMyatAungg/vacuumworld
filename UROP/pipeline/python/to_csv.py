import subprocess
import os
import re
import sys


large_models = ["claude-sonnet-4.6", "gpt-5.1", "gemini-2.5-flash", "gemini-3.1-flash-lite", "deepseek-V3", "gemma-4-31b"]

small_models = ["gemma2-9b", "qwen2.5-7b", "gemma3-4b", "qwen2.5-3b"]

# Keys are the directory name (hyphens); values are the FILENAME prefix, which
# uses underscores: prolog/result/<model>/schema-based/schema_based_sample_1.pl
PROMPT_TYPES = {
    "zero-shot":    "zero_shot",
    "schema-based": "schema_based",
    "one-shot":     "one_shot",
}

# The instruction arm is a paired A/B: the same models, prompted to generalise
# without being handed a schema, against their own unprompted zero-shot.
INSTRUCTION_PROMPT_TYPES = {
    "zero-shot":             "zero_shot",
    "zero-shot-instruction": "zero_shot_instruction",
}

PROLOG = "UROP/pipeline/prolog"

# Grid sizes N to sweep wall_f1 over. Spans the demonstrated size so a rule that
# generalises and a rule that hardcodes separate on the N != true_N columns.
SWEEP = "[3,4,5,6,7,8,9,10,11,12,13]"

# Each tree pairs generated Prolog with the oracle for the grid size it was
# generated at. Scoring a tree against the wrong oracle is silent and total: a
# flawless 5x5 sample scores dirt-F1 0.0 against the 8x8 oracle rather than
# erroring, which is exactly how the previous results5x5/results11x11 CSVs were
# wrong. The pairing lives here so it cannot drift apart from the run.
#
# 5x5/11x11 have no small-model inputs -- those were removed as phantom zeros --
# so their small_models list is empty rather than scoring absent files as 0.
TREES = {
    "8x8": {
        "prolog": "result8x8", "oracle": "f1_eval.pl", "out": "results",
        "prompts": PROMPT_TYPES, "large": large_models, "small": small_models,
    },
    "5x5": {
        "prolog": "result5x5", "oracle": "f1_eval5x5.pl", "out": "results5x5",
        "prompts": PROMPT_TYPES, "large": large_models, "small": [],
    },
    "11x11": {
        "prolog": "result11x11", "oracle": "f1_eval11x11.pl", "out": "results11x11",
        "prompts": PROMPT_TYPES, "large": large_models, "small": [],
    },
    # Generated from the 11x11 world (every sample declares grid_size 11 and
    # reproduces f1_eval11x11.pl's dirt sweep), so scored against the 11x11
    # oracle. This entry previously claimed the samples came from the 8x8
    # world and scored them against f1_eval.pl -- dirt/agent F1 came out 0.0
    # for all 240 samples, the exact wrong-oracle phantom-zero failure the
    # comment above TREES warns about.
    "instruction": {
        "prolog": "result", "oracle": "f1_eval11x11.pl",
        "out": "results_instruction_test",
        "prompts": INSTRUCTION_PROMPT_TYPES, "large": large_models, "small": [],
    },
}


# A clause whose body is textually identical to its head has no base case and
# can never terminate -- e.g. `agent(X,Y,Id,C) :- agent(X,Y,Id,C).`, which
# claude zero-shot samples 6/13 emit. Detecting it up front turns a mute 10s
# TIMEOUT into a named cause and skips the 10s wait. Only DIRECT calls are
# modelled; indirect recursion still falls through to the timeout guard.
TAUTOLOGY = re.compile(r"^([a-z_][A-Za-z0-9_]*)\(([^)]*)\)\s*:-\s*\1\(\2\)\s*\.", re.M)

# Predicates each goal resolves against directly. A tautology on anything else
# (e.g. an unused row/1) is harmless, so those samples still run normally.
# content_f1 discovers accessors by NAME (any predicate mentioning dirt /
# agent / empty / cell, e.g. has_dirt/3 or cell_agent/4), so the content
# match must be by substring too -- a tautological has_dirt/3 hangs it just
# as a tautological dirt/3 does.
CONTENT_PREDS = {"dirt", "agent", "empty", "cell"}
CHECK_PREDS = {"grid", "grid_size", "dirt", "agent", "empty", "wall"}
F1_PREDS = {"grid", "grid_size"}  # plus any *wall*-named accessor f1_N discovers


def make_failures_log(csv_dir):
    os.makedirs(csv_dir, exist_ok=True)
    failures_path = f"{csv_dir}/failures.txt"
    open(failures_path, "w").close()
    return failures_path


def tautological_clauses(pl_file):
    """Map functor -> clause text for clauses whose body repeats their head."""
    try:
        with open(pl_file, errors="ignore") as f:
            src = f.read()
    except OSError:
        return {}
    return {m.group(1): " ".join(m.group(0).split()) for m in TAUTOLOGY.finditer(src)}


def blocking_clause(clauses, goal_kind):
    """The tautological clause that would make `goal_kind` spin, if any."""
    for functor, clause in clauses.items():
        if goal_kind == "content_f1" and any(k in functor for k in CONTENT_PREDS):
            return clause
        if goal_kind == "checks" and functor in CHECK_PREDS:
            return clause
        if goal_kind == "f1" and (functor in F1_PREDS or "wall" in functor):
            return clause
    return None


def log_failure(failures_path, sample_desc, message):
    with open(failures_path, "a") as f:
        f.write(f"{sample_desc}: {message}\n")
    print(f"FAILED ({message.split(':')[0].lower()}): {sample_desc}")


def run_or_skip(goal_kind, clauses, pl_file, load_files, goal, csv_path, sample_desc, failures_path):
    if not os.path.exists(pl_file):
        # swipl -l <missing> only warns and exits 0, which would write a
        # zero-filled CSV. Record the absence instead of scoring it as 0.
        discard_stale(csv_path)
        log_failure(failures_path, sample_desc, f"MISSING INPUT: {pl_file}")
        return
    blocked = blocking_clause(clauses, goal_kind)
    if blocked:
        discard_stale(csv_path)
        log_failure(failures_path, sample_desc,
                    f"NON-TERMINATING: tautological recursion `{blocked}`")
        return
    run_swipl_goal(pl_file, load_files, goal, csv_path, sample_desc, failures_path)


def discard_stale(csv_path):
    """Remove any CSV left over for a sample we are NOT scoring this run.

    This script only ever overwrites files it successfully writes, so a skipped
    / timed-out / failed goal used to leave the previous run's file in place --
    potentially scored against a different grid size and oracle -- and the
    figures then plotted it as current data. Deleting it makes absent data
    absent rather than silently stale.
    """
    try:
        os.remove(csv_path)
    except FileNotFoundError:
        pass


def run_swipl_goal(pl_file, load_files, goal, csv_path, sample_desc, failures_path, timeout=10):
    cmd = ["swipl"]
    for lf in load_files:
        cmd += ["-l", lf]
    cmd += ["-l", pl_file, "-g", goal, "-t", "halt"]
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        discard_stale(csv_path)  # a killed swipl may also leave a partial file
        log_failure(failures_path, sample_desc,
                    f"TIMEOUT: killed after {timeout}s (likely non-terminating generated Prolog)")
        return
    if result.returncode != 0:
        discard_stale(csv_path)
        log_failure(failures_path, sample_desc, result.stderr.strip())


def export_all(models, sample_range, csv_dir, prolog_dir, oracle, prompt_types):
    f1_dir = f"{csv_dir}/f1_N"
    checks_dir = f"{csv_dir}/checks"
    content_f1_dir = f"{csv_dir}/content_f1"
    os.makedirs(f1_dir, exist_ok=True)
    os.makedirs(checks_dir, exist_ok=True)
    os.makedirs(content_f1_dir, exist_ok=True)
    failures_path = make_failures_log(csv_dir)

    oracle_path = f"{PROLOG}/{oracle}"

    for prompt_type, prefix in prompt_types.items():
        for model in models:
            for n in sample_range:
                pl_file = f"{PROLOG}/{prolog_dir}/{model}/{prompt_type}/{prefix}_sample_{n}.pl"
                clauses = tautological_clauses(pl_file)

                f1_csv = f"{f1_dir}/{prompt_type}-{model}-sample_{n}.csv"
                run_or_skip(
                    "f1", clauses,
                    pl_file, [f"{PROLOG}/f1_N.pl"],
                    f"wall_f1_to_csv({SWEEP}, '{f1_csv}')",
                    f1_csv,
                    f"f1 {prompt_type} {model} sample {n}", failures_path
                )

                # No oracle here on purpose: constraint_eval checks the output's
                # internal consistency, and loading the oracle would inject its
                # grid/2 facts, letting a model that emitted none pass vacuously.
                checks_csv = f"{checks_dir}/{prompt_type}-{model}-sample_{n}.csv"
                run_or_skip(
                    "checks", clauses,
                    pl_file, [f"{PROLOG}/constraint_eval.pl"],
                    f"check_all_to_csv('{checks_csv}')",
                    checks_csv,
                    f"checks {prompt_type} {model} sample {n}", failures_path
                )

                content_f1_csv = f"{content_f1_dir}/{prompt_type}-{model}-sample_{n}.csv"
                run_or_skip(
                    "content_f1", clauses,
                    pl_file, [oracle_path, f"{PROLOG}/content_f1.pl"],
                    f"content_f1_to_csv('{content_f1_csv}')",
                    content_f1_csv,
                    f"content_f1 {prompt_type} {model} sample {n}", failures_path
                )


def run_tree(name):
    t = TREES[name]
    print(f"\n===== tree {name}: {t['prolog']} -> {t['out']} (oracle {t['oracle']}) =====")
    if t["large"]:
        export_all(t["large"], range(1, 21), f"UROP/pipeline/{t['out']}/large_llm_results/csv",
                   t["prolog"], t["oracle"], t["prompts"])
    if t["small"]:
        export_all(t["small"], range(1, 21), f"UROP/pipeline/{t['out']}/small_llm_results/csv",
                   t["prolog"], t["oracle"], t["prompts"])


if __name__ == "__main__":
    requested = sys.argv[1:] or list(TREES)
    unknown = [r for r in requested if r not in TREES]
    if unknown:
        sys.exit(f"unknown tree(s): {', '.join(unknown)}; choose from {', '.join(TREES)}")
    # Gate on the evaluator self-test: every historical scoring bug here
    # failed silently, so refuse to write CSVs with evaluators that cannot
    # reproduce the oracle at 1.0 or that accept impossible walls.
    import eval_selftest
    if eval_selftest.main() != 0:
        sys.exit("evaluator self-test failed; not scoring")
    for name in requested:
        run_tree(name)
