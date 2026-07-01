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

def write_repair_log(model, prompt_type, n, attempt, status):
    repair_path = f"UROP/pipeline/results/repair/{model}_{prompt_type}_repair.txt"
    repair= f"{model} [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {status}\n"
    with open(repair_path, "a") as f:
        f.write(repair)

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


def call_anthropic(prompt, n, prompt_type="zero-shot"):
    client = anthropic.Anthropic()
    messages = [{"role": "user", "content": prompt}]
    prefix = PROMPT_TYPES[prompt_type]
    file_path = f"UROP/pipeline/prolog/result/claude-sonnet-4.6/{prompt_type}/{prefix}_sample_{n}.pl"
    for attempt in range(5):
        response = client.messages.create(
            model="claude-sonnet-4-6",
            max_tokens=4096,
            temperature=1,
            messages=messages
        )
        code = response.content[0].text
        with open(file_path, "w") as f:
            f.write(code)
        result = subprocess.run(["swipl", "--on-error=halt", "-l", file_path, "-g", "halt"], capture_output=True, text=True)
        if result.returncode == 0:
            write_repair_log("claude-sonnet-4.6", prompt_type, n, attempt, "SUCCESS")
            break
        write_repair_log("claude-sonnet-4.6", prompt_type, n, attempt, "FAIL")
        messages.append({"role": "assistant", "content": code})
        messages.append({"role": "user", "content": f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation."})
    print(f"claude-sonnet-4.6 [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")


def call_gemini(prompt, n, prompt_type="zero-shot"):
    client = genai.Client()
    contents = [types.Content(role="user", parts=[types.Part.from_text(text=prompt)])]
    prefix = PROMPT_TYPES[prompt_type]
    file_path = f"UROP/pipeline/prolog/result/gemini-2.5-flash/{prompt_type}/{prefix}_sample_{n}.pl"
    for attempt in range(5):
        response = client.models.generate_content(
            model="gemini-2.5-flash",
            contents=contents,
            config=types.GenerateContentConfig(
                temperature=1.0,
                top_p=0.95,
                thinking_config=types.ThinkingConfig(thinking_budget=8000),
            ),
        )
        code = response.text
        with open(file_path, "w") as f:
            f.write(code)
        result = subprocess.run(["swipl", "--on-error=halt", "-l", file_path, "-g", "halt"], capture_output=True, text=True)
        if result.returncode == 0:
            write_repair_log("gemini-2.5-flash", prompt_type, n, attempt, "SUCCESS")
            break
        write_repair_log("gemini-2.5-flash", prompt_type, n, attempt, "FAIL")
        contents.append(types.Content(role="model", parts=[types.Part.from_text(text=code)]))
        contents.append(types.Content(role="user", parts=[types.Part.from_text(text=f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation.")]))
    print(f"gemini-2.5-flash [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")


def call_gemini_small(prompt, n, prompt_type="zero-shot"):
    client = genai.Client()
    contents = [types.Content(role="user", parts=[types.Part.from_text(text=prompt)])]
    prefix = PROMPT_TYPES[prompt_type]
    file_path = f"UROP/pipeline/prolog/result/gemini-3.1-flash-lite/{prompt_type}/{prefix}_sample_{n}.pl"
    for attempt in range(5):
        response = client.models.generate_content(
            model="gemini-3.1-flash-lite",
            contents=contents,
            config=types.GenerateContentConfig(
                temperature=1.0,
                top_p=0.95,
            ),
        )
        code = response.text
        with open(file_path, "w") as f:
            f.write(code)
        result = subprocess.run(["swipl", "--on-error=halt", "-l", file_path, "-g", "halt"], capture_output=True, text=True)
        if result.returncode == 0:
            write_repair_log("gemini-3.1-flash-lite", prompt_type, n, attempt, "SUCCESS")
            break
        write_repair_log("gemini-3.1-flash-lite", prompt_type, n, attempt, "FAIL")
        contents.append(types.Content(role="model", parts=[types.Part.from_text(text=code)]))
        contents.append(types.Content(role="user", parts=[types.Part.from_text(text=f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation.")]))
    print(f"gemini-3.1-flash-lite [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")


def call_cerebras(prompt, n, prompt_type="zero-shot", model="gemma-4-31b"):
    client = OpenAI(
        api_key=os.environ.get('CEREBRAS_API_KEY'),
        base_url="https://api.cerebras.ai/v1"
    )
    messages = [{"role": "user", "content": prompt}]
    prefix = PROMPT_TYPES[prompt_type]
    file_path = f"UROP/pipeline/prolog/result/{model}/{prompt_type}/{prefix}_sample_{n}.pl"
    for attempt in range(5):
        response = client.chat.completions.create(
            model=model,
            max_tokens=4096,
            messages=messages
        )
        code = strip_markdown(response.choices[0].message.content)
        with open(file_path, "w") as f:
            f.write(code)
        result = subprocess.run(["swipl", "--on-error=halt", "-l", file_path, "-g", "halt"], capture_output=True, text=True)
        if result.returncode == 0:
            write_repair_log(model, prompt_type, n, attempt, "SUCCESS")
            break
        write_repair_log(model, prompt_type, n, attempt, "FAIL")
        messages.append({"role": "assistant", "content": code})
        messages.append({"role": "user", "content": f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation."})
    print(f"{model} [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")


def call_deepseek(prompt, n, prompt_type="zero-shot"):
    client = OpenAI(
        api_key=os.environ.get('DEEPSEEK_API_KEY'),
        base_url="https://api.deepseek.com"
    )
    messages = [{"role": "user", "content": prompt}]
    prefix = PROMPT_TYPES[prompt_type]
    file_path = f"UROP/pipeline/prolog/result/deepseek-2.5-flash/{prompt_type}/{prefix}_sample_{n}.pl"
    for attempt in range(5):
        response = client.chat.completions.create(
            temperature=1.0,
            model="deepseek-chat",
            max_tokens=4096,
            messages=messages
        )
        code = response.choices[0].message.content
        with open(file_path, "w") as f:
            f.write(code)
        result = subprocess.run(["swipl", "--on-error=halt", "-l", file_path, "-g", "halt"], capture_output=True, text=True)
        if result.returncode == 0:
            write_repair_log("deepseek-chat", prompt_type, n, attempt, "SUCCESS")
            break
        write_repair_log("deepseek-chat", prompt_type, n, attempt, "FAIL")
        messages.append({"role": "assistant", "content": code})
        messages.append({"role": "user", "content": f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation."})
    print(f"deepseek-chat [{prompt_type}] sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")


prompts = [
    ("zero-shot",    zero_shot_prompt),
    ("schema-based", schema_prompt),
    ("one-shot",     one_shot_prompt),
]

for prompt_type, prompt in prompts:
    for n in range(1, 6):
        try:
            call_anthropic(prompt, n, prompt_type)
        except Exception as e:
            print(f"Error occurred while calling Anthropic for sample {n}: {e}")
        try:
            call_gemini(prompt, n, prompt_type)
        except Exception as e:
            print(f"Error occurred while calling Gemini for sample {n}: {e}")
        try:
            call_gemini_small(prompt, n, prompt_type)
        except Exception as e:
            print(f"Error occurred while calling Gemini Small for sample {n}: {e}")
        try:
            call_deepseek(prompt, n, prompt_type)
        except Exception as e:
            print(f"Error occurred while calling DeepSeek for sample {n}: {e}")
        try:
            call_cerebras(prompt, n, prompt_type)
        except Exception as e:
            print(f"Error occurred while calling Cerebras for sample {n}: {e}")