import subprocess

models = ["claude-sonnet-4.6", "gemini-2.5-flash", "gemini-3.1-flash-lite", "deepseek-2.5-flash", "gemma-4-31b"]

PROMPT_TYPES = {
    "zero-shot":    "zero_shot",
    "schema-based": "schema_based",
    "one-shot":     "one_shot",
}

for prompt_type, prefix in PROMPT_TYPES.items():
    with open(f"UROP/pipeline/results/{prompt_type}-results.txt", "w") as f:
        for model in models:
            header = f"\n=== {model} ===\n"
            print(header, end="")
            f.write(header)
            for n in range(1, 6):
                sample_header = f"\n--- sample {n} ---\n"
                print(sample_header, end="")
                f.write(sample_header)

                pl_file = f"UROP/pipeline/prolog/result/{model}/{prompt_type}/{prefix}_sample_{n}.pl"

                r1 = subprocess.run(
                    ["swipl", "-l", pl_file, "-l", "UROP/pipeline/prolog/constraint_eval.pl", "-g", "check_all", "-t", "halt"],
                    capture_output=True, text=True
                )
                f.write(r1.stdout)
                f.write(r1.stderr)

                r2 = subprocess.run(
                    ["swipl", "-l", "UROP/pipeline/prolog/f1_N.pl", "-l", pl_file, "-g", "wall_f1_sweep([3,4,5,6,7,8,9,10,11,12,13])", "-t", "halt"],
                    capture_output=True, text=True
                )
                f.write(r2.stdout)
                f.write(r2.stderr)
