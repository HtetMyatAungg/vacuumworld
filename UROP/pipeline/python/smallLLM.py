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

def call_qwen(prompt, n, model="qwen2.5:3b"):
    client = OpenAI(
        api_key="ollama",
        base_url="http://localhost:11434/v1"
    )
    messages = [{"role": "user", "content": prompt}]
    for attempt in range(5):
        response = client.chat.completions.create(
            model=model,
            max_tokens=4096,
            temperature=1.0,
            messages=messages
        )
        code = strip_markdown(response.choices[0].message.content)
        file_path = f"UROP/pipeline/prolog/result/qwen2.5-3b/zero_shot_sample_{n}.pl"
        with open(file_path, "w") as f:
            f.write(code)
        result = subprocess.run(["swipl", "-l", file_path, "-g", "halt"], capture_output=True, text=True)
        if result.returncode == 0:
            break
        messages.append({"role": "assistant", "content": code})
        messages.append({"role": "user", "content": f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation."})
    print(f"{model} sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")

def call_gemma(prompt, n, model="gemma3:4b"):
    client = OpenAI(
        api_key="ollama",
        base_url="http://localhost:11434/v1"
    )
    messages = [{"role": "user", "content": prompt}]
    for attempt in range(5):
        response = client.chat.completions.create(
            model=model,
            max_tokens=4096,
            temperature=1.0,
            messages=messages
        )
        code = strip_markdown(response.choices[0].message.content)
        file_path = f"UROP/pipeline/prolog/result/gemma3-4b/zero_shot_sample_{n}.pl"
        with open(file_path, "w") as f:
            f.write(code)
        result = subprocess.run(["swipl", "-l", file_path, "-g", "halt"], capture_output=True, text=True)
        if result.returncode == 0:
            break
        messages.append({"role": "assistant", "content": code})
        messages.append({"role": "user", "content": f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation."})
    print(f"{model} sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")

for n in range(5):
    call_qwen(zero_shot_prompt,n+1)
    call_gemma(zero_shot_prompt,n+1)
