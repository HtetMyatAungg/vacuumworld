import subprocess
import os


large_models = ["claude-sonnet-4.6", "gemini-2.5-flash", "gemini-3.1-flash-lite", "deepseek-V3", "gemma-4-31b"]

small_models = ["gemma2-9b", "qwen2.5-7b"]

PROMPT_TYPES = {
    "zero-shot":    "zero_shot",
    "schema-based": "schema_based",
    "one-shot":     "one_shot",
}


def make_failures_log(csv_dir):
    os.makedirs(csv_dir, exist_ok=True)
    failures_path = f"{csv_dir}/failures.txt"
    open(failures_path, "w").close()
    return failures_path


def run_swipl_goal(pl_file, load_file, goal, sample_desc, failures_path, timeout=10):
    try:
        result = subprocess.run(
            ["swipl", "-l", load_file, "-l", pl_file, "-g", goal, "-t", "halt"],
            capture_output=True, text=True, timeout=timeout
        )
    except subprocess.TimeoutExpired:
        with open(failures_path, "a") as f:
            f.write(f"{sample_desc}: TIMEOUT: killed after {timeout}s (likely non-terminating generated Prolog)\n")
        print(f"FAILED (timeout): {sample_desc}")
        return
    if result.returncode != 0:
        with open(failures_path, "a") as f:
            f.write(f"{sample_desc}: {result.stderr.strip()}\n")
        print(f"FAILED: {sample_desc}")


def export_all(models, sample_range, csv_dir):
    f1_dir = f"{csv_dir}/f1_N"
    checks_dir = f"{csv_dir}/checks"
    content_f1_dir = f"{csv_dir}/content_f1"
    os.makedirs(f1_dir, exist_ok=True)
    os.makedirs(checks_dir, exist_ok=True)
    os.makedirs(content_f1_dir, exist_ok=True)
    failures_path = make_failures_log(csv_dir)

    for prompt_type, prefix in PROMPT_TYPES.items():
        for model in models:
            for n in sample_range:
                pl_file = f"UROP/pipeline/prolog/result/{model}/{prompt_type}/{prefix}_sample_{n}.pl"

                f1_csv = f"{f1_dir}/{prompt_type}-{model}-sample_{n}.csv"
                run_swipl_goal(
                    pl_file, "UROP/pipeline/prolog/f1_N.pl",
                    f"wall_f1_to_csv([3,4,5,6,7,8,9,10,11,12,13], '{f1_csv}')",
                    f"f1 {prompt_type} {model} sample {n}", failures_path
                )

                checks_csv = f"{checks_dir}/{prompt_type}-{model}-sample_{n}.csv"
                run_swipl_goal(
                    pl_file, "UROP/pipeline/prolog/constraint_eval.pl",
                    f"check_all_to_csv('{checks_csv}')",
                    f"checks {prompt_type} {model} sample {n}", failures_path
                )

                content_f1_csv = f"{content_f1_dir}/{prompt_type}-{model}-sample_{n}.csv"
                run_swipl_goal(
                    pl_file, "UROP/pipeline/prolog/content_f1.pl",
                    f"content_f1_to_csv('{content_f1_csv}')",
                    f"content_f1 {prompt_type} {model} sample {n}", failures_path
                )


# export_all(large_models, range(1, 6), "UROP/pipeline/results/large_llm_results/csv")
export_all(small_models, range(1, 21), "UROP/pipeline/results/small_llm_results/csv")
