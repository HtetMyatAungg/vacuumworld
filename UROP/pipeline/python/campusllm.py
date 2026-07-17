import requests
from dotenv import load_dotenv
import os
import subprocess
import json

load_dotenv()

with open("UROP/pipeline/Percepts/World_Model_percepts.json", "r") as json:
    percepts = json.read()



zero_shot_prompt = f"""
You are translating observations from a square grid environment into Prolog.

Below is a deduplicated percept log from an agent that swept every cell of an N×N grid.
Each entry records a coordinate, whether dirt or an agent was present.

Coordinate system:
- (X, Y) where X = column (east increases), Y = row (south increases)
- (0, 0) is the north-west corner

Percept log:
{percepts}

Produce ONLY valid SWI-Prolog that encodes the grid structure, its contents (dirt, agents, empty location), and boundary wall rules. Retain any location along with the type of content observed there, whenever that content is non-empty.
No markdown, no comments, no explanation.
"""

zero_shot_instruction_prompt = f"""
You are translating observations from a square grid environment into Prolog.

Below is a deduplicated percept log from an agent that swept every cell of an N×N grid.
Each entry records a coordinate, whether dirt or an agent was present.

Coordinate system:
- (X, Y) where X = column (east increases), Y = row (south increases)
- (0, 0) is the north-west corner

Percept log:
{percepts}

(Boundary wall rules are not shown — you must derive them yourself for the percept log above, generalised to work for any grid size.), do not hardcode, design predicates for all entities from the percepts including all relevant argument.
Produce ONLY valid SWI-Prolog that encodes the grid structure, its contents (dirt, agents, empty location), and boundary wall rules. Retain any location along with the type of content observed there, whenever that content is non-empty.
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
    "zero-shot-instruction": "zero-shot-instruction",
    "schema-based": "schema_based",
    "one-shot":     "one_shot",
}

_repair_logs_started = set()

def write_repair_log(model, prompt_type, n, attempt, status):
    repair_path = f"UROP/pipeline/results/repair/{model}_{prompt_type}_repair.txt"
    os.makedirs(os.path.dirname(repair_path), exist_ok=True)
    mode = "a" if repair_path in _repair_logs_started else "w"
    _repair_logs_started.add(repair_path)
    repair= f"{model} [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {status}\n"
    with open(repair_path, mode) as f:
        f.write(repair)

def LLM(n, prompt_type, prompt, model="qwen3:32b"):
    url = "https://llm-gateway.cim.rhul.ac.uk/api/chat"

    headers = {
        "Authorization": os.getenv("BEARER_TOKEN")
    }
    messages = [{"role": "user", "content": prompt}]

    prefix = PROMPT_TYPES[prompt_type]
    file_path = f"UROP/pipeline/prolog/resultcampus/{model}/{prompt_type}/{prefix}_sample_{n}.pl"
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
    if os.path.exists(file_path):
        print(f"{model} [{prompt_type}] sample {n}: file already exists, skipping")
        return
    for attempt in range(5):
        payload = {
            "model": model,
            "temperature": 1.0,
            "messages": messages,
            "stream": False
        } 
        code = requests.post(url, headers=headers, json=payload)
        response = json.dumps(code)
        with open(file_path, "w") as f:
            f.write(response)
        result = subprocess.run(["swipl", "--on-error=halt", "-l", file_path, "-g", "halt"], capture_output=True, text=True)
        if result.returncode == 0:
            write_repair_log(model, prompt_type, n, attempt, "SUCCESS")
            break
        write_repair_log(model, prompt_type, n, attempt, "FAIL")
        messages.append({"role": "assistant", "content": response})
        messages.append({"role": "user", "content": f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation."})
        print(f"{model} [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")

for n in range(1,20):
    LLM(n, "zero-shot", zero_shot_prompt)