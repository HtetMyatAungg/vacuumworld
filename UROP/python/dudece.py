#!/usr/bin/env python3
"""Step 1: collapse a VacuumWorld sweep log into a deduplicated world model.

Input  : JSON list of cycles, each {pose, grid:{slot:{coord,walls,dirt}}}.
         Coords and wall labels are ABSOLUTE (cardinal) already.
Outputs: Section-A facts (.pl), ground-truth wall set, and a validation report.
"""
import json, sys
from collections import defaultdict

SLOTS = ["forwardleft", "forward", "forwardright", "left", "center", "right"]

def load(path):
    with open(path) as f:
        return json.load(f)

def dedup(cycles):
    walls = {}          # (x,y) -> frozenset of wall dirs
    dirt  = {}          # (x,y) -> colour
    seen_count = defaultdict(int)
    conflicts = []
    for c in cycles:
        for slot in SLOTS:
            cell = c["grid"].get(slot)
            if not cell:                      # missing slot (edge/corner)
                continue
            x, y = cell["coord"]
            key = (x, y)
            seen_count[key] += 1
            w = frozenset(cell.get("walls") or [])
            d = cell.get("dirt")
            # consistency: every sighting of a cell must agree on walls & dirt
            if key in walls and walls[key] != w:
                conflicts.append(("walls", key, set(walls[key]), set(w)))
            if key in dirt and dirt[key] != d:
                conflicts.append(("dirt", key, dirt[key], d))
            walls[key] = w
            dirt[key]  = d
    return walls, dirt, seen_count, conflicts

def infer_n(walls):
    xs = [x for (x, _) in walls]; ys = [y for (_, y) in walls]
    return max(max(xs), max(ys)) + 1   # 0-based square grid

def report(walls, dirt, seen_count, conflicts):
    n = infer_n(walls)
    cells = set(walls)
    full = {(x, y) for x in range(n) for y in range(n)}
    missing = sorted(full - cells)
    total_obs = sum(seen_count.values())
    wall_facts = sum(len(w) for w in walls.values())
    dirty = {k: v for k, v in dirt.items() if v}
    print(f"grid size inferred:      N = {n}  ({n}x{n})")
    print(f"cells observed:          {len(cells)} / {n*n}")
    print(f"missing cells:           {missing if missing else 'none (full coverage)'}")
    print(f"raw cell-observations:   {total_obs}  ->  {len(cells)} unique"
          f"  ({total_obs/len(cells):.1f}x redundancy)")
    print(f"wall/3 facts (boundary): {wall_facts}")
    print(f"dirt cells:              {len(dirty)}  {dirty if dirty else ''}")
    print(f"consistency conflicts:   {len(conflicts)}")
    for kind, key, a, b in conflicts[:10]:
        print(f"   CONFLICT {kind} at {key}: {a} vs {b}")
    return n, missing, conflicts

def emit_section_a(walls, dirt, n, path):
    lines = [f"grid_size({n}).", ""]
    for (x, y) in sorted(walls):
        lines.append(f"location({x}, {y}).")
    lines.append("")
    for (x, y), col in sorted(dirt.items()):
        if col:
            lines.append(f"dirt({x}, {y}, {col}).")
        else:
            lines.append(f"empty_location({x}, {y}).")
    with open(path, "w") as f:
        f.write("\n".join(lines) + "\n")

def emit_truth_walls(walls, path):
    lines = []
    for (x, y) in sorted(walls):
        for d in sorted(walls[(x, y)]):
            lines.append(f"wall({x}, {y}, {d}).")
    with open(path, "w") as f:
        f.write("\n".join(lines) + "\n")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <sweep.json> [output.pl]", file=sys.stderr)
        sys.exit(1)
    cycles = load(sys.argv[1])
    walls, dirt, seen_count, conflicts = dedup(cycles)
    n, missing, conflicts = report(walls, dirt, seen_count, conflicts)
    if len(sys.argv) > 2:
        emit_section_a(walls, dirt, n, sys.argv[2])
        emit_truth_walls(walls, sys.argv[2].replace(".pl", "_truth_walls.pl"))
        print(f"\nwrote {sys.argv[2]} and *_truth_walls.pl")