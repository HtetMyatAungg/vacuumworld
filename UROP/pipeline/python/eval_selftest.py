"""Golden self-test for the Prolog evaluators.

Every bug this pipeline has had failed *silently*: wrong inputs scored 0
instead of erroring, geometrically impossible walls passed the constraint
checks, and unscored categories looked like model failures. This gate makes
the failure modes loud. It is run by to_csv.py before any scoring; it can
also be run standalone:  python3 UROP/pipeline/python/eval_selftest.py

Fixtures are generated at runtime from the oracles themselves so they cannot
drift:

  identity   - the oracle's own content renamed to the schema predicates.
               Expect: every content F1 = 1.0, every constraint check pass,
               wall F1 = 1.0 at the true grid size.
  cell3      - the same content nested as cell(X,Y,dirt(C)/empty/agent(Id,C)).
  cell4      - deepseek's shape: cell(X,Y,Payload,WallAtom) with the payload
               third and the agent's colour FIRST: agent(C,Id).
  location   - cell3 under the predicate name location/3 (gemini zero-shot).
  kv         - deepseek's Key:Value shape:
               cell(X,Y, walls:[...], dirt:'orange'/none, agent:agent(Id,C)/none).
  wrapper    - deepseek's wrapper shape:
               cell(X,Y, agent(agent(Id,C)/null, dirt(C)/dirt(null), walls([...]))).
               Expect: content F1 = 1.0 for every category the shape can
               express (kv and wrapper leave emptiness implicit, so their
               empty check is skipped by design).
  rotated    - identity walls rotated 180 degrees (north<->south, east<->west).
               Expect: the wall_placement check FAILS.
  parsefail  - an agent fact with an unquoted uuid (syntax error). Expect:
               agent F1 = 0 with dirt/empty still scored -- the deliberate
               parse-failure boundary holds.
"""

import csv
import os
import re
import subprocess
import sys
import tempfile

PROLOG = "UROP/pipeline/prolog"

ORACLES = {
    5:  "f1_eval5x5.pl",
    8:  "f1_eval.pl",
    11: "f1_eval11x11.pl",
}

FACT = re.compile(r"^(oracle_dirt|oracle_agent|oracle_empty|grid|grid_size|wall)\((.*)\)\.\s*$")


def oracle_facts(path):
    facts = {"oracle_dirt": [], "oracle_agent": [], "oracle_empty": [],
             "grid": [], "grid_size": [], "wall": []}
    with open(path) as f:
        for line in f:
            m = FACT.match(line.strip())
            if m:
                facts[m.group(1)].append([a.strip() for a in split_args(m.group(2))])
    return facts


def split_args(s):
    """Split a fact's argument list on top-level commas (uuids are quoted)."""
    args, depth, cur, quote = [], 0, "", False
    for ch in s:
        if ch == "'" :
            quote = not quote
        if not quote:
            if ch in "([":
                depth += 1
            elif ch in ")]":
                depth -= 1
            elif ch == "," and depth == 0:
                args.append(cur)
                cur = ""
                continue
        cur += ch
    args.append(cur)
    return args


def write_identity(facts, out, rotate_walls=False):
    rot = {"north": "south", "south": "north", "east": "west", "west": "east"}
    with open(out, "w") as f:
        for (n,) in facts["grid_size"]:
            f.write(f"grid_size({n}).\n")
        for x, y in facts["grid"]:
            f.write(f"grid({x},{y}).\n")
        for x, y, d in facts["wall"]:
            d2 = rot[d] if rotate_walls else d
            f.write(f"wall({x},{y},{d2}).\n")
        for x, y, c in facts["oracle_dirt"]:
            f.write(f"dirt({x},{y},{c}).\n")
        for i, x, y, c in facts["oracle_agent"]:
            f.write(f"agent({i},{x},{y},{c}).\n")
        for x, y in facts["oracle_empty"]:
            f.write(f"empty({x},{y}).\n")


def write_cells(facts, out, shape):
    """shape 'cell3': cell(X,Y,Payload). 'cell4': cell(X,Y,Payload,none) with
    the agent's colour first, matching deepseek zero-shot output. 'location':
    cell3 under the name location/3. 'kv': cell(X,Y,walls:[],dirt:_,agent:_).
    'wrapper': cell(X,Y,agent(AgentOrNull,dirt(ColourOrNull),walls([])))."""
    dirt = {(x, y): c for x, y, c in facts["oracle_dirt"]}
    agent = {(x, y): (i, c) for i, x, y, c in facts["oracle_agent"]}
    with open(out, "w") as f:
        for x, y in facts["grid"]:
            if shape == "kv":
                d = f"'{dirt[(x, y)]}'" if (x, y) in dirt else "none"
                a = "agent({},{})".format(*agent[(x, y)]) if (x, y) in agent else "none"
                f.write(f"cell({x},{y},walls:[],dirt:{d},agent:{a}).\n")
                continue
            if shape == "wrapper":
                d = f"dirt({dirt[(x, y)]})" if (x, y) in dirt else "dirt(null)"
                a = "agent({},{})".format(*agent[(x, y)]) if (x, y) in agent else "null"
                f.write(f"cell({x},{y},agent({a},{d},walls([]))).\n")
                continue
            if (x, y) in dirt:
                payload = f"dirt({dirt[(x, y)]})"
            elif (x, y) in agent:
                i, c = agent[(x, y)]
                payload = f"agent({i},{c})" if shape != "cell4" else f"agent({c},{i})"
            else:
                payload = "empty"
            if shape == "cell4":
                f.write(f"cell({x},{y},{payload},none).\n")
            elif shape == "location":
                f.write(f"location({x},{y},{payload}).\n")
            else:
                f.write(f"cell({x},{y},{payload}).\n")


def write_parsefail(facts, out):
    x, y, c = facts["oracle_dirt"][0]
    with open(out, "w") as f:
        f.write(f"dirt({x},{y},{c}).\n")
        # unquoted uuid: a syntax error that SWI drops at load time
        f.write("agent(9af04778-1a2b-4c3d-8e9f-000000000000,1,0,orange).\n")


def run_content(oracle, pl_file, csv_out):
    return subprocess.run(
        ["swipl", "-l", f"{PROLOG}/{oracle}", "-l", f"{PROLOG}/content_f1.pl",
         "-l", pl_file, "-g", f"content_f1_to_csv('{csv_out}')", "-t", "halt"],
        capture_output=True, text=True, timeout=60)


def run_checks(pl_file, csv_out):
    return subprocess.run(
        ["swipl", "-l", f"{PROLOG}/constraint_eval.pl", "-l", pl_file,
         "-g", f"check_all_to_csv('{csv_out}')", "-t", "halt"],
        capture_output=True, text=True, timeout=60)


def run_wall_f1(pl_file, n, csv_out):
    return subprocess.run(
        ["swipl", "-l", f"{PROLOG}/f1_N.pl", "-l", pl_file,
         "-g", f"wall_f1_to_csv([{n}], '{csv_out}')", "-t", "halt"],
        capture_output=True, text=True, timeout=60)


def read_rows(path, key):
    with open(path, newline="") as f:
        return {row[key]: row for row in csv.DictReader(f)}


def main():
    failures = []

    def expect(cond, label):
        print(("  ok   " if cond else "  FAIL ") + label)
        if not cond:
            failures.append(label)

    with tempfile.TemporaryDirectory() as tmp:
        for n, oracle in ORACLES.items():
            facts = oracle_facts(f"{PROLOG}/{oracle}")
            print(f"-- {n}x{n} ({oracle})")

            ident = f"{tmp}/identity_{n}.pl"
            write_identity(facts, ident)
            c = f"{tmp}/ident_content_{n}.csv"
            run_content(oracle, ident, c)
            rows = read_rows(c, "category")
            for cat in ("dirt", "agent", "empty"):
                expect(rows[cat]["F1"] == "1.0000",
                       f"identity {n}: {cat} F1=1.0 (got {rows[cat]['F1']})")

            k = f"{tmp}/ident_checks_{n}.csv"
            run_checks(ident, k)
            checks = read_rows(k, "check")
            bad = [name for name, row in checks.items() if row["result"] != "pass"]
            expect(len(checks) == 9 and not bad,
                   f"identity {n}: all 9 constraint checks pass (failed: {bad})")

            w = f"{tmp}/ident_wall_{n}.csv"
            run_wall_f1(ident, n, w)
            wrows = read_rows(w, "N")
            expect(wrows[str(n)]["F1"] == "1.0000",
                   f"identity {n}: wall F1=1.0 at N={n} (got {wrows[str(n)]['F1']})")

            # kv and wrapper express emptiness only implicitly (placeholders),
            # which the evaluator deliberately does not infer -- skip empty.
            for shape, cats in (("cell3", ("dirt", "agent", "empty")),
                                ("cell4", ("dirt", "agent", "empty")),
                                ("location", ("dirt", "agent", "empty")),
                                ("kv", ("dirt", "agent")),
                                ("wrapper", ("dirt", "agent"))):
                cf = f"{tmp}/{shape}_{n}.pl"
                write_cells(facts, cf, shape)
                cc = f"{tmp}/{shape}_content_{n}.csv"
                run_content(oracle, cf, cc)
                rows = read_rows(cc, "category")
                for cat in cats:
                    expect(rows[cat]["F1"] == "1.0000",
                           f"{shape} {n}: {cat} F1=1.0 (got {rows[cat]['F1']})")

            rot = f"{tmp}/rotated_{n}.pl"
            write_identity(facts, rot, rotate_walls=True)
            rk = f"{tmp}/rot_checks_{n}.csv"
            run_checks(rot, rk)
            checks = read_rows(rk, "check")
            expect(checks["wall_placement"]["result"] == "fail",
                   f"rotated {n}: wall_placement FAILS on 180-degree rotated walls")

        pf = f"{tmp}/parsefail.pl"
        write_parsefail(oracle_facts(f"{PROLOG}/{ORACLES[8]}"), pf)
        pc = f"{tmp}/parsefail_content.csv"
        run_content(ORACLES[8], pf, pc)
        rows = read_rows(pc, "category")
        print("-- parse-failure boundary")
        expect(rows["agent"]["TP"] == "0",
               f"parsefail: unquoted-uuid agent stays TP=0 (got {rows['agent']['TP']})")
        expect(rows["dirt"]["TP"] == "1",
               f"parsefail: dirt in the same file still scores (got TP={rows['dirt']['TP']})")

    if failures:
        print(f"\nSELF-TEST FAILED: {len(failures)} expectation(s) violated")
        return 1
    print("\nSELF-TEST PASSED: evaluators credit correct content, reject impossible walls,"
          "\nand preserve the parse-failure boundary.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
