import dotenv
import anthropic

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
- wall(loc(X,Y), Dir) facts are all the coordinates X, Y with a wall at direction Dir in the percepts

Section B — Wall rules:
Define wall(loc(X,Y), Dir) rules for boundary walls.
Your rules must generalise — they should work for any grid size, not just the one observed.

"""


def call_anthropic(prompt):
    client = anthropic.Anthropic()
    message = client.messages.create(
        model="claude-sonnet-4-6",
        max_tokens=4096,
        temperature=1,
        messages=[
            {"role": "user", "content": prompt}
        ]
    )
    result = message.content[0].text
    with open("UROP/pipeline/prolog/claude_zero_shot.pl", "w") as f:
        f.write(result)

call_anthropic(zero_shot_prompt)


