import dotenv
import subprocess
from openai import OpenAI
import os

dotenv.load_dotenv()

with open("UROP/pipeline/prolog/schema.pl", "r") as prolog:
    schema = prolog.read()

with open("UROP/pipeline/Percepts/World_Model_percepts.json", "r") as json:
    percepts = json.read()


zero_shot_prompt = f"""
You are translating observations from a square grid environment into Prolog.

Below is a deduplicated percept log from an agent that swept every cell of an N×N grid.
Each entry records a coordinate, any walls detected, and whether dirt or an agent was present.

Coordinate system:
- (X, Y) where X = column (east increases), Y = row (south increases)
- (0, 0) is the north-west corner

Percept log:
{percepts}

Produce ONLY valid SWI-Prolog that encodes the grid structure, its contents, and boundary wall rules. Retain any location along with the type of content observed there, whenever that content is non-empty.
No markdown, no comments, no explanation.
"""

schema_prompt = f"""
You are translating observations from a square grid environment into Prolog.

Below is a deduplicated percept log from an agent that swept every cell of an N×N grid. Each entry records a coordinate, any walls detected at that cell, and whether dirt or another agent was present.

Coordinate system:
- (X, Y) where X = column (east increases), Y = row (south increases)
- (0, 0) is the north-west corner

Percept log:
{percepts}

Produce ONLY valid Prolog — no markdown, no comments, no explanation.

Section A — Translation facts:
Assert the following ground facts from the percept log:
- grid_size(N) where N is the side length of the grid.
- grid(X,Y) are facts with the entire grid coordinates.
- dirt(X,Y, Colour) for each cell containing dirt.
- agent(Id, X,Y, Colour) for each cell containing an agent.
- empty(X,Y) for each cell that has neither dirt nor an agent.

Section B — Wall rules:
Define wall(X,Y, Dir) rules for boundary walls.
Your rules must generalise — they should work for any grid size, not just the one observed.
Do not enumerate wall(X,Y, Dir) as facts.
Output the Prolog code only. Do not include any explanation, comments, or markdown.
Start your response with the first Prolog fact and end with the last.

"""

one_shot_prompt = f"""
You are translating observations from a square grid environment into Prolog.

Below is a deduplicated percept log from an agent that swept every cell of an N×N grid. Each entry records a coordinate, any walls detected at that cell, and whether dirt or another agent was present.

Coordinate system:
- (X, Y) where X = column (east increases), Y = row (south increases)
- (0, 0) is the north-west corner

Here is an example.

Example percept log:
[
  {{"coord": [0,0], "walls": ["north","west"], "dirt": null,    "agent": null}},
  {{"coord": [1,0], "walls": ["north"],        "dirt": null,    "agent": null}},
  {{"coord": [2,0], "walls": ["north","east"], "dirt": null,    "agent": {{"id": "agent-1", "colour": "white"}}}},
  {{"coord": [0,1], "walls": ["west"],         "dirt": null,    "agent": null}},
  {{"coord": [1,1], "walls": [],               "dirt": "green", "agent": null}},
  {{"coord": [2,1], "walls": ["east"],         "dirt": null,    "agent": null}},
  {{"coord": [0,2], "walls": ["south","west"], "dirt": null,    "agent": null}},
  {{"coord": [1,2], "walls": ["south"],        "dirt": null,    "agent": null}},
  {{"coord": [2,2], "walls": ["south","east"], "dirt": null,    "agent": null}}
]

Example Prolog output:
grid_size(3).

grid(0,0).
grid(1,0).
grid(2,0).
grid(0,1).
grid(1,1).
grid(2,1).
grid(0,2).
grid(1,2).
grid(2,2).

dirt(1,1, green).
agent('agent-1', 2,0, white).

empty(0,0).
empty(1,0).
empty(0,1).
empty(2,1).
empty(0,2).
empty(1,2).
empty(2,2).

(The example stops here. Boundary wall rules are not shown — you must derive
them yourself for the percept log below, generalised to work for any grid size.)

Now translate this percept log:
{percepts}

Produce ONLY valid Prolog — no markdown, no comments, no explanation.

Section A — Translation facts:
Assert the following ground facts from the percept log:
- grid_size(N) where N is the side length of the grid.
- grid(X,Y) are facts with the entire grid coordinates.
- dirt(X,Y, Colour) for each cell containing dirt.
- agent(Id, X,Y, Colour) for each cell containing an agent.
- empty(X,Y) for each cell that has neither dirt nor an agent.

Section B — Wall rules:
Define wall(X,Y, Dir) rules for boundary walls.
Your rules must generalise — they should work for any grid size, not just the one observed.
Do not enumerate wall(X,Y, Dir) as facts.
Output the Prolog code only. Do not include any explanation, comments, or markdown.
Start your response with the first Prolog fact and end with the last.

"""

PROMPT_TYPES = {
    "zero-shot":    "zero_shot",
    "schema-based": "schema_based",
    "one-shot":     "one_shot",
}

def strip_markdown(text):
    if not text:
        return ""
    lines = text.splitlines()
    start = 1 if lines and lines[0].startswith("```") else 0
    end = len(lines)
    for i in range(start, len(lines)):
        if lines[i].strip() == "```":
            end = i
            break
    return "\n".join(lines[start:end])


# Repair logs used to be opened in append mode, so entries from successive runs
# accumulated in one file and figure_generation's last-write-wins could take a
# sample's attempt count from a different experiment. Truncate each log the
# first time THIS run writes to it, then append within the run.
_repair_logs_started = set()


def write_repair_log(model, prompt_type, n, attempt, status):
    repair_path = f"UROP/pipeline/results/repair/{model}_{prompt_type}_repair.txt"
    os.makedirs(os.path.dirname(repair_path), exist_ok=True)
    mode = "a" if repair_path in _repair_logs_started else "w"
    _repair_logs_started.add(repair_path)
    with open(repair_path, mode) as f:
        f.write(f"{model} [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {status}\n")


def validate_prolog(file_path):
    return subprocess.run(["swipl", "--on-error=halt", "-l", file_path, "-g", "halt"], capture_output=True, text=True)


def prolog_error_message(result):
    output = result.stderr or result.stdout or "SWI-Prolog validation failed without output."
    lines = [line for line in output.splitlines() if not line.startswith("Warning:")]
    return "\n".join(lines).strip() or output.strip()


def build_repair_prompt(prompt, code, error_message):
    return f"""Original task:
{prompt}

The previous Prolog failed SWI-Prolog validation.

Validation output:
{error_message}

Previous output:
{code}

Return the complete corrected Prolog only. No markdown, no explanation."""

def call_qwen(prompt, n, prompt_type="zero-shot", model="qwen2.5:3b"):
    client = OpenAI(
        api_key="ollama",
        base_url="http://localhost:11434/v1"
    )
    messages = [{"role": "user", "content": prompt}]
    prefix = PROMPT_TYPES[prompt_type]
    model_dir = model.replace(":", "-")
    file_path = f"UROP/pipeline/prolog/result/{model_dir}/{prompt_type}/{prefix}_sample_{n}.pl"
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
    if os.path.exists(file_path):
        print(f"{model} [{prompt_type}] sample {n}: file already exists, skipping")
        return
    result = None
    for attempt in range(5):
        response = client.chat.completions.create(
            model=model,
            max_tokens=4096,
            temperature=1.0,
            messages=messages,
            extra_body={"options": {"num_ctx": 32768}}
        )
        code = strip_markdown(response.choices[0].message.content)
        with open(file_path, "w") as f:
            f.write(code)
        result = validate_prolog(file_path)
        if result.returncode == 0:
            break
        error_message = prolog_error_message(result)
        messages = [{"role": "user", "content": build_repair_prompt(prompt, code, error_message)}]
    status = "PASS" if result and result.returncode == 0 else "FAIL"
    write_repair_log(model, prompt_type, n, attempt, status)
    print(f"{model} [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {status}")
    if not result or result.returncode != 0:
        raise RuntimeError(f"{model} [{prompt_type}] sample {n} failed Prolog validation:\n{prolog_error_message(result)}")

def call_gemma(prompt, n, prompt_type="zero-shot", model="gemma3:4b"):
    client = OpenAI(
        api_key="ollama",
        base_url="http://localhost:11434/v1"
    )
    messages = [{"role": "user", "content": prompt}]
    prefix = PROMPT_TYPES[prompt_type]
    model_dir = model.replace(":", "-")
    file_path = f"UROP/pipeline/prolog/result/{model_dir}/{prompt_type}/{prefix}_sample_{n}.pl"
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
    if os.path.exists(file_path):
        print(f"{model} [{prompt_type}] sample {n}: file already exists, skipping")
        return
    result = None
    for attempt in range(5):
        response = client.chat.completions.create(
            model=model,
            max_tokens=4096,
            temperature=1.0,
            messages=messages,
            extra_body={"options": {"num_ctx": 16384}}
        )
        code = strip_markdown(response.choices[0].message.content)
        with open(file_path, "w") as f:
            f.write(code)
        result = validate_prolog(file_path)
        if result.returncode == 0:
            break
        error_message = prolog_error_message(result)
        messages = [{"role": "user", "content": build_repair_prompt(prompt, code, error_message)}]
    status = "PASS" if result and result.returncode == 0 else "FAIL"
    write_repair_log(model, prompt_type, n, attempt, status)
    print(f"{model} [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {status}")
    if not result or result.returncode != 0:
        raise RuntimeError(f"{model} [{prompt_type}] sample {n} failed Prolog validation:\n{prolog_error_message(result)}")

prompts = [
    ("zero-shot",    zero_shot_prompt),
    ("schema-based", schema_prompt),
    ("one-shot",     one_shot_prompt),
]


def local_models():
    result = subprocess.run(["ollama", "list"], capture_output=True, text=True)
    return {line.split()[0] for line in result.stdout.splitlines()[1:] if line.strip()}


def run_model(call_fn, model, available):
    if model not in available:
        print(f"{model}: not pulled on this machine, skipping")
        return
    for prompt_type, prompt in prompts:
        for n in range(1, 21):
            try:
                call_fn(prompt, n, prompt_type, model=model)
            except Exception as e:
                print(f"Error occurred while processing sample {n}: {e}")


available = local_models()
run_model(call_gemma, "gemma3:4b", available)
run_model(call_qwen, "qwen2.5:3b", available)