import dotenv
import anthropic
from google import genai
from google.genai import types
import subprocess
from transformers import AutoProcessor, AutoModelForMultimodalLM




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

"""

one_shot_prompt = f""" 

"""
def call_anthropic(prompt, n):
    client = anthropic.Anthropic()
    messages = [{"role": "user", "content": prompt}]
    for attempt in range(5):
        response = client.messages.create(
            model="claude-sonnet-4-6",
            max_tokens=4096,
            temperature=1,
            messages=messages
        )

        code = response.content[0].text
        with open(f"UROP/pipeline/prolog/result/claude-sonnet-4.6/zero_shot_sample_{n}.pl", "w") as f:
            f.write(code)
        # write and check syntax
        result = subprocess.run(["swipl", "-l", f"UROP/pipeline/prolog/result/claude-sonnet-4.6/zero_shot_sample_{n}.pl", "-g", "halt"], capture_output=True, text=True)
        
        if result.returncode == 0:
            break  # clean load, done

        # feed error back as a multi-turn conversation
        messages.append({"role": "assistant", "content": code})
        messages.append({"role": "user", "content": f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation."})
    print(f"claude-sonnet-4.6 sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")

    # messages_opus = [{"role": "user", "content": prompt}]
    # for attempt in range(5):
    #     response = client.messages.create(
    #         model="claude-opus-4-8",
    #         max_tokens=4096,
    #         temperature=1,
    #         messages=messages_opus
    #     )
    #
    #     code = response.content[0].text
    #     with open(f"UROP/pipeline/prolog/result/claude-opus-4.8/zero_shot_sample_{n}.pl", "w") as f:
    #         f.write(code)
    #     # write and check syntax
    #     result = subprocess.run(["swipl", "-l", f"UROP/pipeline/prolog/result/claude-opus-4.8/zero_shot_sample_{n}.pl", "-g", "halt"], capture_output=True, text=True)
    #
    #     if result.returncode == 0:
    #         break  # clean load, done
    #
    #     # feed error back as a multi-turn conversation
    #     messages_opus.append({"role": "assistant", "content": code})
    #     messages_opus.append({"role": "user", "content": f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation."})
    # print(f"claude-opus-4.8 sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")

def call_gemini(prompt, n):
    client = genai.Client()
    contents = [types.Content(role="user", parts=[types.Part.from_text(text=prompt)])]
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
        file_path = f"UROP/pipeline/prolog/result/gemini-2.5-flash/zero_shot_sample_{n}.pl"
        with open(file_path, "w") as f:
            f.write(code)
        # write and check syntax
        result = subprocess.run(["swipl", "-l", file_path, "-g", "halt"], capture_output=True, text=True)

        if result.returncode == 0:
            break  # clean load, done

        # feed error back as a multi-turn conversation
        contents.append(types.Content(role="model", parts=[types.Part.from_text(text=code)]))
        contents.append(types.Content(role="user", parts=[types.Part.from_text(text=f"This Prolog has a syntax error:\n{result.stderr}\nFix it and return the complete corrected Prolog. No markdown, no explanation.")]))
    print(f"gemini-2.5-flash sample {n}: {attempt + 1} attempt(s), {'PASS' if result.returncode == 0 else 'FAIL'}")

def call_gemma(zero_prompt,n):
    from google import genai

    client = genai.Client()

    response = client.models.generate_content(
    model="gemma-4-26b-a4b-it",
    contents=zero_prompt
    )
    file_path = f"UROP/pipeline/prolog/result/gemma_open_weight/zero_shot_sample_{n}.pl"
    with open(file_path, "w") as f:
        f.write(response.text)


#for n in range(1,6):
    #call_anthropic(zero_shot_prompt,n)
    #call_gemini(zero_shot_prompt,n)

call_gemma(zero_shot_prompt,1)