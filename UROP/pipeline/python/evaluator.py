import subprocess

models = ["claude-sonnet-4.6", "gemini-2.5-flash"]

for model in models:
    print(f"\n=== {model} ===")
    for n in range(1, 6):
        print(f"\n--- sample {n} ---")
        subprocess.run(["swipl", "-l", f"UROP/pipeline/prolog/result/{model}/zero_shot_sample_{n}.pl", "-l", "UROP/pipeline/prolog/constraint_eval.pl", "-g", "check_all", "-t", "halt"])
        subprocess.run(["swipl", "-l", "UROP/pipeline/prolog/f1_N.pl", "-l", f"UROP/pipeline/prolog/result/{model}/zero_shot_sample_{n}.pl", "-g", "wall_f1_sweep([3,4,5,6,7,8,9,10,11,12,13])", "-t", "halt"])