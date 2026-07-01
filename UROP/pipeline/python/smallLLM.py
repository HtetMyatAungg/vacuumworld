import dotenv
import anthropic
from google import genai
from google.genai import types
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

Produce ONLY valid SWI-Prolog that encodes the grid structure, its contents, and boundary wall rules.
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
- grid(loc(X,Y)) are facts with the entire grid coordinates.
- seen(dirt(loc(X,Y), Colour)) for each cell containing dirt.
- seen(agent(Id, loc(X,Y), Colour)) for each cell containing an agent.
- empty_location(loc(X,Y)) for each cell that has neither dirt nor an agent.

Section B — Wall rules:
Define wall(loc(X,Y), Dir) rules for boundary walls.
Your rules must generalise — they should work for any grid size, not just the one observed.
Do not enumerate wall(loc(X,Y), Dir) as facts.
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

grid(loc(0,0)).
grid(loc(1,0)).
grid(loc(2,0)).
grid(loc(0,1)).
grid(loc(1,1)).
grid(loc(2,1)).
grid(loc(0,2)).
grid(loc(1,2)).
grid(loc(2,2)).

seen(dirt(loc(1,1), green)).
seen(agent('agent-1', loc(2,0), white)).

empty_location(loc(0,0)).
empty_location(loc(1,0)).
empty_location(loc(0,1)).
empty_location(loc(2,1)).
empty_location(loc(0,2)).
empty_location(loc(1,2)).
empty_location(loc(2,2)).

(The example stops here. Boundary wall rules are not shown — you must derive
them yourself for the percept log below, generalised to work for any grid size.)

Now translate this percept log:
{percepts}

Produce ONLY valid Prolog — no markdown, no comments, no explanation.

Section A — Translation facts:
Assert the following ground facts from the percept log:
- grid_size(N) where N is the side length of the grid.
- grid(loc(X,Y)) are facts with the entire grid coordinates.
- seen(dirt(loc(X,Y), Colour)) for each cell containing dirt.
- seen(agent(Id, loc(X,Y), Colour)) for each cell containing an agent.
- empty_location(loc(X,Y)) for each cell that has neither dirt nor an agent.

Section B — Wall rules:
Define wall(loc(X,Y), Dir) rules for boundary walls.
Your rules must generalise — they should work for any grid size, not just the one observed.
Do not enumerate wall(loc(X,Y), Dir) as facts.
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
    file_path = f"UROP/pipeline/prolog/result/qwen2.5-3b/{prompt_type}/{prefix}_sample_{n}.pl"
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
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
    repair_path = f"UROP/pipeline/results/repair/{model}_{prompt_type}_repair.txt"
    repair= f"{model} [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {status}\n"
    with open(repair_path, "a") as f:
            f.write(repair)
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
    file_path = f"UROP/pipeline/prolog/result/gemma3-4b/{prompt_type}/{prefix}_sample_{n}.pl"
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
    result = None
    for attempt in range(5):
        response = client.chat.completions.create(
            model=model,
            max_tokens=4096,
            temperature=1.0,
            messages=messages,
            extra_body={"options": {"num_ctx": 131072}}
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
    repair_path = f"UROP/pipeline/results/repair/{model}_{prompt_type}_repair.txt"
    repair= f"{model} [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {status}\n"
    with open(repair_path, "a") as f:
        f.write(repair)
    print(f"{model} [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {status}")
    if not result or result.returncode != 0:
        raise RuntimeError(f"{model} [{prompt_type}] sample {n} failed Prolog validation:\n{prolog_error_message(result)}")

prompts = [
    ("zero-shot",    zero_shot_prompt),
    ("schema-based", schema_prompt),
    ("one-shot",     one_shot_prompt),
]

#for prompt_type, prompt in prompts:
for n in range(1, 21):
    try:
        call_gemma(one_shot_prompt,n,"one-shot")
    except Exception as e:
        print(f"Error occurred while processing sample {n}: {e}")
    try:
        call_qwen(one_shot_prompt,n,"one-shot")
    except Exception as e:
        print(f"Error occurred while processing sample {n}: {e}")