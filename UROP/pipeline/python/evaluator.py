import subprocess

large_models = ["claude-sonnet-4.6", "gemini-2.5-flash", "gemini-3.1-flash-lite", "deepseek-2.5-flash", "gemma-4-31b"]

small_models = ["gemma3-4b", "qwen2.5-3b"]

def run_swipl(cmd, timeout=10):
    try:
        return subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        return subprocess.CompletedProcess(cmd, -1, stdout="", stderr=f"TIMEOUT: killed after {timeout}s (likely non-terminating generated Prolog)\n")

PROMPT_TYPES = {
    "zero-shot":    "zero_shot",
    "schema-based": "schema_based",
    "one-shot":     "one_shot",
}

for prompt_type, prefix in PROMPT_TYPES.items():
    with open(f"UROP/pipeline/results/large_llm_results/{prompt_type}-results.txt", "w") as f:
        f.write(f"--- {prompt_type} ---\n")
        for model in large_models:
            header = f"\n=== {model} ===\n"
            print(header, end="")
            f.write(header)
            for n in range(1, 6):
                sample_header = f"\n--- sample {n} ---\n"
                print(sample_header, end="")
                f.write(sample_header)

                pl_file = f"UROP/pipeline/prolog/result/{model}/{prompt_type}/{prefix}_sample_{n}.pl"

                r1 = run_swipl(["swipl", "-l", pl_file, "-l", "UROP/pipeline/prolog/constraint_eval.pl", "-g", "check_all", "-t", "halt"])
                f.write(r1.stdout)
                f.write(r1.stderr)

                r2 = run_swipl(["swipl", "-l", "UROP/pipeline/prolog/f1_N.pl", "-l", pl_file, "-g", "wall_f1_sweep([3,4,5,6,7,8,9,10,11,12,13])", "-t", "halt"])
                f.write(r2.stdout)
                f.write(r2.stderr)

for prompt_type, prefix in PROMPT_TYPES.items():
    with open(f"UROP/pipeline/results/small_llm_results/{prompt_type}-results.txt", "w") as f:
        f.write(f"--- {prompt_type} ---\n")
        for model in small_models:
            header = f"\n=== {model} ===\n"
            print(header, end="")
            f.write(header)
            for n in range(1, 21):
                sample_header = f"\n--- sample {n} ---\n"
                print(sample_header, end="")
                f.write(sample_header)

                pl_file = f"UROP/pipeline/prolog/result/{model}/{prompt_type}/{prefix}_sample_{n}.pl"

                r1 = run_swipl(["swipl", "-l", pl_file, "-l", "UROP/pipeline/prolog/constraint_eval.pl", "-g", "check_all", "-t", "halt"])
                f.write(r1.stdout)
                f.write(r1.stderr)

                r2 = run_swipl(["swipl", "-l", "UROP/pipeline/prolog/f1_N.pl", "-l", pl_file, "-g", "wall_f1_sweep([3,4,5,6,7,8,9,10,11,12,13])", "-t", "halt"])
                f.write(r2.stdout)
                f.write(r2.stderr)

