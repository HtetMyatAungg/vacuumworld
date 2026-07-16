import json
import sys

# Per-size input percept log and output world-model / oracle paths. The 8x8
# entry keeps the legacy unsuffixed filenames.
SIZES = {
    "5x5":   {"event": "event_percepts5x5.json",   "world": "World_Model_percepts5x5.json",   "oracle": "f1_eval5x5.pl",   "label": "5x5"},
    "8x8":   {"event": "event_percepts.json",       "world": "World_Model_percepts.json",       "oracle": "f1_eval.pl",       "label": "8x8"},
    "11x11": {"event": "event_percepts11x11.json", "world": "World_Model_percepts11x11.json", "oracle": "f1_eval11x11.pl", "label": "11x11"},
}

PERCEPTS = "UROP/pipeline/Percepts"
PROLOG = "UROP/pipeline/prolog"


def build(size):
    cfg = SIZES[size]
    o = json.loads(open(f"{PERCEPTS}/{cfg['event']}").read())

    seen = dict()
    for item in o:
        for direction, cell in item['grid'].items():
            if cell is None:
                continue
            coord = tuple(cell['coord'])
            if coord in seen and set(seen[coord]['walls']) != set(cell['walls']):
                print("conflict at", coord, seen[coord]['walls'], "vs", cell['walls'])
            agent = cell['agent'] if cell['agent'] else None
            seen[coord] = {'coord': list(coord), 'walls': cell['walls'], 'dirt': cell['dirt'], 'agent': agent}

    result = list(seen.values())
    with open(f"{PERCEPTS}/{cfg['world']}", "w") as f:
        json.dump(result, f, indent=2)

    # Grid side length is derived from the swept coordinates, not hardcoded.
    # The agent visits every cell of a square N x N grid, so N = max coord + 1.
    n = max(max(x, y) for (x, y) in seen) + 1

    with open(f"{PROLOG}/{cfg['oracle']}", "w") as f:
        f.write(f"% ground truth/oracle: {cfg['label']} sweep\n")
        f.write(":- discontiguous oracle_dirt/3.\n" + ":- discontiguous oracle_agent/4.\n" + ":- discontiguous oracle_empty/2.\n" + ":- discontiguous wall/3.\n")
        f.write(f"grid_size({n}).\n")
        for coord, data in seen.items():
            x, y = coord
            f.write(f"grid({x}, {y})." + "\n")

        for coord, data in seen.items():
            x, y = coord
            direction = data['walls']
            for dirc in direction:
                f.write(f"wall({x}, {y}, {dirc})." + "\n")
        for coord, data in seen.items():
            x, y = coord
            dirt = data['dirt']
            if dirt != None:
                f.write(f"oracle_dirt({x}, {y}, {dirt})." + "\n")
        for coord, data in seen.items():
            x, y = coord
            agent = data['agent']
            if agent != None:
                f.write(f"oracle_agent('{agent['id']}', {x}, {y}, {agent['colour']})." + "\n")
        for coord, data in seen.items():
            x, y = coord
            agent = data['agent']
            dirt = data['dirt']
            if agent == None and dirt == None:
                f.write(f"oracle_empty({x}, {y})." + "\n")


if __name__ == "__main__":
    # Usage: python world_model.py [size ...]   (default: all sizes)
    sizes = [s for s in sys.argv[1:] if s in SIZES] or list(SIZES)
    for size in sizes:
        build(size)
        print(f"built world model + oracle for {size}")
