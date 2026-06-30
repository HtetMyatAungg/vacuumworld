import subprocess

models = ["gemini-3.1-flash-lite","claude-sonnet-4.6", "gemini-2.5-flash", "deepseek-2.5-flash",  "gemma3-4b", "gemma-4-31b"]

with open("UROP/pipeline/results/results.txt", "w") as f:
    for model in models:
        header = f"\n=== {model} ===\n"
        print(header, end="")
        f.write(header)
        for n in range(1, 6):
            sample_header = f"\n--- sample {n} ---\n"
            print(sample_header, end="")
            f.write(sample_header)

            r1 = subprocess.run(["swipl", "-l", f"UROP/pipeline/prolog/result/{model}/zero_shot_sample_{n}.pl", "-l", "UROP/pipeline/prolog/constraint_eval.pl", "-g", "check_all", "-t", "halt"], capture_output=True, text=True)
            f.write(r1.stdout)
            f.write(r1.stderr)

            r2 = subprocess.run(["swipl", "-l", "UROP/pipeline/prolog/f1_N.pl", "-l", f"UROP/pipeline/prolog/result/{model}/zero_shot_sample_{n}.pl", "-g", "wall_f1_sweep([3,4,5,6,7,8,9,10,11,12,13])", "-t", "halt"], capture_output=True, text=True)
            f.write(r2.stdout)
            f.write(r2.stderr)