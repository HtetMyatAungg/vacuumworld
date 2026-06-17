#!/usr/bin/env python3
"""
Phase 2 (lifted): the LLM induces GENERAL transition rules from a batch of
observed transitions, instead of formatting one grounded fact per cycle.

Architecture change from your current file:
  EC.pl  ->  ec_core.pl    frame axioms: holdsAt, brokenAt, bump, wallAt, find
                           (shared, unchanged from Phase 1)
             physics.pl    the 8 move(D) initiatesAt/terminatesAt clauses
                           = YOUR hand-coded baseline (the oracle)
             physics_llm.pl  = what the LLM writes (the candidate)

Flow:
  1. collect_transitions()  run a normal exploring agent, log (px,py,D,nx,ny)
  2. generate_rules(...)     one LLM call -> physics_llm.pl
  3. syntactic_gate(...)     does it load in SWI at all?
  4. score(...)              run held-out probes through ec_core + each physics
                             file, compare next-state -> behavioural equivalence

Sign convention note: the example below assumes north = +Y, east = +X. If your
grid uses the opposite, flip the +1/-1 in the oracle and in PROBES' expected
values. The LLM only ever sees observed transitions, so it infers the sign on
its own -- whether it gets it right from the data is part of the result.
"""

import janus_swi as janus


# ---------------------------------------------------------------------------
# 1. PROMPT
# ---------------------------------------------------------------------------

LIFT_PROMPT = """You are inducing the transition rules of a grid world in Event Calculus Prolog.

Vocabulary (use ONLY these):
  event:   move(D)   where D is one of n,s,e,w
  fluent:  at(X,Y)
  context: wallAt(X,Y,D)   % a wall is adjacent to (X,Y) in direction D
  you may read state in a rule body with holdsAt(F,T).

Write GENERAL rules with variables (X,Y,T) -- NEVER specific coordinates.
Each rule must cover every transition of its kind. Movement is blocked by a wall.

Worked example (one observation -> the rule that explains it):
  observed: at(3,4) at T, move(n), result at(3,5)
  rules:
    initiatesAt(move(n), at(X,Y1), T) :- holdsAt(at(X,Y),T), Y1 is Y+1, \\+ wallAt(X,Y,n).
    terminatesAt(move(n), at(X,Y), T) :- holdsAt(at(X,Y),T), \\+ wallAt(X,Y,n).

Observed transitions:
{transitions}

Output the complete rule set, one clause per line, Prolog only, no markdown, no prose."""


def build_prompt(transitions):
    """transitions: list of (px, py, D, nx, ny). A bump is px,py == nx,ny."""
    lines = "\n".join(
        f"  at({px},{py}) at T, move({d}), result at({nx},{ny})"
        + ("  [blocked by wall]" if (px, py) == (nx, ny) else "")
        for (px, py, d, nx, ny) in transitions
    )
    return LIFT_PROMPT.format(transitions=lines)


# ---------------------------------------------------------------------------
# 2. GENERATE  (one LLM call for the whole theory)
# ---------------------------------------------------------------------------

def generate_rules(transitions, mind, out_path="UROP/physics_llm.pl"):
    """mind is your VWLLMActorMindSurrogate instance (reuse provide_context)."""
    response, error = mind.provide_context(context=build_prompt(transitions))
    if error.is_present():
        raise RuntimeError(error.or_else_raise())

    rules = response.or_else_raise().text.strip()
    rules = rules.replace("```prolog", "").replace("```", "").strip()

    with open(out_path, "w") as f:
        f.write(":- dynamic wallAt/3.\n")
        f.write(rules + "\n")
    return rules


# ---------------------------------------------------------------------------
# 3. SYNTACTIC GATE
# ---------------------------------------------------------------------------

def syntactic_gate(physics_path):
    """True if the candidate file loads without a Prolog syntax/consult error."""
    try:
        janus.query_once("consult('ec_core.pl')")
        janus.query_once(f"consult('{physics_path}')")
        return True
    except Exception as e:
        print(f"[gate] {physics_path} failed to load: {e}")
        return False


# ---------------------------------------------------------------------------
# 4. SCORING  (behavioural equivalence vs the oracle)
# ---------------------------------------------------------------------------

def _reset_state():
    janus.query_once("retractall(happensAt(_,_))")
    janus.query_once("retractall(initially(_,_))")
    janus.query_once("retractall(wallAt(_,_,_))")
    janus.query_once("retractall(initial(_))")


def predict_next(px, py, d, wall):
    """Use whichever physics is currently loaded to predict the next position."""
    _reset_state()
    janus.query_once("assertz(initial(0))")
    janus.query_once(f"assertz(initially(at({px},{py}),0))")
    if wall:
        janus.query_once(f"assertz(wallAt({px},{py},{d}))")
    janus.query_once(f"assertz(happensAt(move({d}),0))")
    r = janus.query_once("holdsAt(at(NX,NY),1)")   # frame axiom carries it forward
    return (r["NX"], r["NY"]) if r else None


def run_probes(physics_path, probes):
    """Load ec_core + one physics file, return {probe: predicted_next}."""
    janus.query_once("unload_file('physics.pl')")        # ignore if not loaded
    janus.query_once("unload_file('physics_llm.pl')")
    janus.consult("ec_core.pl")
    janus.consult(physics_path)
    out = {}
    for (px, py, d, wall) in probes:
        out[(px, py, d, wall)] = predict_next(px, py, d, wall)
    return out


def score(probes, oracle="physics.pl", candidate="physics_llm.pl"):
    expected = run_probes(oracle, probes)
    predicted = run_probes(candidate, probes)
    matches = sum(expected[p] == predicted[p] for p in probes)
    acc = matches / len(probes)
    print(f"behavioural equivalence: {matches}/{len(probes)} = {acc:.1%}")
    for p in probes:
        if expected[p] != predicted[p]:
            print(f"  MISS {p}: oracle={expected[p]} llm={predicted[p]}")
    return acc


# Held-out probes: span all four directions, several cells, bump + non-bump,
# and the edges/corners. Keep these DISJOINT from the transitions you trained on.
PROBES = [
    (3, 4, "n", False), (3, 4, "n", True),
    (1, 1, "e", False), (1, 1, "e", True),
    (5, 5, "s", False), (5, 5, "s", True),
    (2, 7, "w", False), (2, 7, "w", True),
    (8, 1, "n", False), (1, 8, "s", True),
]


if __name__ == "__main__":
    # Pseudo-driver. Wire collect_transitions() into a normal exploration run,
    # then:
    #   rules = generate_rules(transitions, mind)
    #   assert syntactic_gate("physics_llm.pl")
    #   score(PROBES)
    pass
