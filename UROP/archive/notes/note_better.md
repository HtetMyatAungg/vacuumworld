## Day 1: Setup & Perception Exploration

### Setup
- Got VacuumWorld running with the GUI (`gui=True`). Note: `gui=False` runs a terminal grid instead.
- Used `load="files/guiless.json"` to load a saved state.

---

### What the agent perceives

The agent always sees up to 6 cells: **center, forward, left, right, forward-left, forward-right**.

For each cell it receives:
- **Coordinates** (x, y)
- **Wall flags** — whether a wall is on each side (north/south/east/west)
- **Actor info** (if an actor is present) — id, progressive_id, colour, orientation
- **Dirt info** (if dirt is present)

Example observation at (3,3) facing north:

```
center:        (3,3) — white agent, facing north
forward:       (3,2)
left:          (2,3)
right:         (4,3)
forward-left:  (2,2)
forward-right: (4,2)
```

---

### Observations from testing

| Scenario | Result |
|----------|--------|
| Idle | Observation shows current position and all 6 visible cells |
| Turn | Orientation in observation updates correctly |
| Move forward | Coordinates update correctly; all neighbour coordinates shift too |
| Move into wall | Agent stops; wall flags correctly show `true` on blocked side |

---

### Key facts about IDs

- `get_own_id()` reads from the **center cell of the perception** — the mind doesn't store its own ID separately, it pulls it from the observation each cycle
- If another agent is in a visible cell, **their ID is also in the perception** — no need to send them a message to ask
- Access a neighbour's ID via `get_forward().or_else_raise().get_actor_appearance().or_else_raise().get_id()`

## Day 2: Event Calculus core, tested in isolation

Wrote a Prolog file using physics as axioms. Chose the `happensAt(E, F, T)` convention (Event, Fluent, Time) for readability.

### Initial state

Encoded as facts:
```prolog
initially(at(3,4), 0).   % agent starts at (3,4) at time 0
initially(orien(n), 0).  % agent's orientation is north at time 0
```

### `holdsAt/2`

Two clauses cover when a fluent holds at a given time:

**1. Initial case** — for fluents that hold from the start:
```prolog
holdsAt(F, T) :-
    initial(0),
    initially(F, 0),
    0 =< T,
    \+ brokenAt(F, 0, T).
```
Fluent `F` holds at time `T` if it held at the initial state (time 0), `T` is non-negative, and it has not been broken between time 0 and `T`.

**2. Event case** — for fluents initiated by an event:
```prolog
holdsAt(F, T) :-
    happensAt(E, Ti),
    Ti =< T,
    initiatesAt(E, F, Ti),
    \+ brokenAt(F, Ti, T).
```
Fluent `F` holds at time `T` if some event `E` happened at time `Ti ≤ T`, that event initiated `F` at `Ti`, and `F` has not been broken between `Ti` and `T`.

## Day 3: Wall discovery and grid-size inference

### Bump detection

A bump is inferred from the Event Calculus state — no special percept needed. If `move(D)` happened at time `T` but the agent's position is the same at `T-1` and `T`, the move failed, meaning there is a wall.

```prolog
bump(D, X, Y, T) :-
    happensAt(move(D), T),
    Tprev is T - 1,
    holdsAt(at(X,Y), Tprev),
    holdsAt(at(X,Y), T),
    \+ wallAt(X,Y,D),
    assertz(wallAt(X, Y, D)).
```

`wallAt(X, Y, D)` means: "there is a wall adjacent to cell `(X,Y)` on side `D`." The guard `\+ wallAt(X,Y,D)` prevents duplicate assertions — once a wall is known, it stays known. This is **monotonic belief expansion**: the knowledge base only grows.

---

### Grid-size inference

Because VacuumWorld is always a square grid with coordinates starting at `(1,1)`, the grid size `N` can be read off from discovered wall positions:

| Predicate | Logic |
|-----------|-------|
| `findbyWidth(N)` | Find a west wall at `(Xmin, Y)` and an east wall at `(Xmax, Y)` on the same row; `N = Xmax - Xmin + 1` |
| `findbyHeight(N)` | Find a north wall at `(X, Ymin)` and a south wall at `(X, Ymax)` on the same column; `N = Ymax - Ymin + 1` |
| `find(N)` | Both agree on the same `N` — valid because the grid is square |

```prolog
find(N) :-
    findbyWidth(N),
    findbyHeight(N).
```

---

## Day 4: Python–Prolog bridge via janus_swi

### Setup

Connected the VacuumWorld Python agent to EC.pl using `janus_swi`. At module load time, call `janus.consult("UROP/EC.pl")` to load the Prolog knowledge base. From that point on, any Python code can call `janus.query_once("...")` to run Prolog queries and `assertz(...)` inside those queries to add new facts.

**Installation issues encountered:**

| Problem | Fix |
|---------|-----|
| `libswipl.so.10: cannot open shared object file` — `janus_swi` installed but SWI-Prolog too old (9.0.4) | Added PPA: `sudo add-apt-repository ppa:swi-prolog/stable && sudo apt install swi-prolog` |
| Upgrade failed: `swi-prolog-nox` conflicted with `swi-prolog-core 9.0.4` | `sudo dpkg -i --force-overwrite <deb file> && sudo apt --fix-broken install` |
| `libswipl.so.10` installed to `/usr/lib/swi-prolog/lib/x86_64-linux/` but not in linker path | `echo "/usr/lib/swi-prolog/lib/x86_64-linux" \| sudo tee /etc/ld.so.conf.d/swi-prolog.conf && sudo ldconfig` |

---

### How janus_swi works

- `janus.consult("file.pl")` — loads a Prolog file into the runtime
- `janus.query_once("goal.")` — runs a Prolog goal, returns a dict of variable bindings or `{'truth': False}` if it fails
- Variables in query strings must be **uppercase** (Prolog convention)
- Use f-strings to interpolate Python values into queries: `f"assertz(wallAt({x}, {y}, {d}))"`

---

### Feeding percepts into Prolog

Each cycle, Python reads the percept and asserts facts into Prolog:

- **Initial state** (time 0 only): `assertz(initially(at(X,Y), 0))` and `assertz(initially(orient(D), 0))`
- **Moves**: `assertz(happensAt(move(D), T))` — called in `decide()` for the current cycle
- **Position tracking**: `assertz(initiatesAt(move(D), at(X,Y), T-1))` — records the new position as initiated by the previous move. Also asserts `terminatesAt` for the old position so `holdsAt` correctly reflects the current location.

---

### Bump detection architecture

The Prolog `bump/4` rule fires when `holdsAt` returns the same position at `T-1` and `T` despite a move event. Python queries it after asserting the current move, then compares `wallAt` before and after to detect a newly discovered wall:

```python
before = janus.query_once(f"wallAt({x}, {y}, {orien})")
self.prologMove(orien, time)        # assertz happensAt
self.bump(orien, coordinate, time)  # calls Prolog bump rule (checks time-1)
after = janus.query_once(f"wallAt({x}, {y}, {orien})")
if not before['truth'] and after['truth']:
    print(f"New wall at ({x},{y}) facing {orien}")
```

`bump()` internally uses `time - 1` so it checks the previous cycle's move (whose `happensAt` was already asserted last cycle), not the current one.

---

### Bugs fixed

| Bug | Fix |
|-----|-----|
| `prologMove` missing `self` parameter | Added `self` as first parameter |
| `get_own_orientation()` / `get_effort()` called without `()` | Added parentheses |
| `if self.bump:` always `True` | `self.bump` is a method reference (always truthy) — must capture and check the return value |
| Bump checking `time` instead of `time-1` | Inside `bump()`, subtract 1 from time before the Prolog query |
| `prologMove` called in `revise()` before decision was made | Moved to `decide()`, called before bump check |
| Cycle-0 position asserted via `initiatesAt` | Guarded `prologPos` with `if time > 0` so initial position comes only from `initially` |
| Module-level Prolog query ran before simulation started | Moved all Prolog queries inside `revise()`/`decide()` |
| EC.pl: `:- dynamic initially/2` missing trailing period | Added `.` — without it, `assertz(initially(...))` silently failed and `holdsAt` never had an initial position |
| `prologMove` was querying instead of asserting | Was `janus.query_once(f"happensAt(...)")` — should be `assertz(happensAt(...))`. Without this, `happensAt` was never added to the KB and bump always failed |
| `janus_swi` errors on compound Prolog terms in query variables | `query_once("initially(F, 0)")` fails if `F` binds to `at(4,0)` — janus_swi can't return compound terms. Use unpacked variables: `initially(at(X,Y), 0)` |
| `terminatesAt` asserted during bumps | When position didn't change (bump), `prev_pos == pos` but `terminatesAt` was still asserted for the current position, breaking `holdsAt` for future bump detection. Fix: skip `terminatesAt` when `prev_pos == pos` |
| `time - 1` wrong for effort-based time | `get_effort()` returns total effort, not cycle count. `VWMoveAction` costs 3 effort, so values jump 0→3→6→9. Subtracting 1 looks for `happensAt` at T=2 which was never asserted. Fix: maintain `self.cycle` counter (incremented each `decide()`) and use that as the discrete time index |

---

## Day 5: Fixing bump detection timing and `findbyHeight`

### Root cause of bump never firing

The Prolog `bump/4` rule needs `holdsAt(at(P), T)` and `holdsAt(at(P), T-1)` to both be true, where `T = self.cycle`. `holdsAt` resolves via `initiatesAt(move, at(P), Ti)` with `Ti ≤ T`. But `prologPos` — which asserts the `initiatesAt` — was called **after** `bump` in `decide()`. So the `initiatesAt` for the current cycle didn't exist yet when Prolog ran the bump check, and `holdsAt` always failed.

**Fix:** reorder `decide()` so `prologPos` runs before `bump`.

### `time -= 1` in `bump()` was also wrong

With `prologPos` using `t = Time`, calling Prolog `bump(D, X, Y, T)` with `T = time - 1` caused the rule to check `holdsAt(at(P), time-2)`. But `initiatesAt` was only asserted at `time-1` (the previous cycle). Since `time-1 > time-2`, `holdsAt` failed again.

**Fix:** removed `time -= 1` from `bump()`. Now `T = time`, so the rule checks `holdsAt(at(P), time-1)` (satisfied by the previous cycle's `initiatesAt`) and `holdsAt(at(P), time)` (satisfied by the just-asserted `initiatesAt`).

### Supporting fixes

| Bug | Fix |
|-----|-----|
| `prev_pos` was `None` at cycle 0 | Initialize `self.prev_pos = c` inside `initial()` so cycle-1 bump detection has a valid previous position to compare |
| Turning check had no `time > 0` guard | At cycle 0, `old_pos == coordinate` was true (both the initial position), spuriously triggering `turning = 2` before any move. Added `time > 0` to the guard |
| `self.cycle` not incremented during turns | EC timestamps fell behind; bump detection failed for the first wall found after a turn. Added `self.cycle += 1` inside the turning branch |

### False positive `wallAt` after turning — root cause of `findbyHeight` returning 1

After bumping the north wall and turning south, the agent sat at position `P=(X, 0)` for 4 consecutive cycles (bump + 2 turns + first south move). At the first southward cycle:

1. `prologPos(P, T, south)` asserts `initiatesAt(move(south), at(P), T)`.
2. `bump(south, P, T)` checks `holdsAt(at(P), T-1)` — **true** (stale `initiatesAt` from the north-bump era).
3. `holdsAt(at(P), T)` — **true** (just asserted above).
4. `wallAt(X, 0, south)` is asserted — **wrong**. The south wall is at `Y = N-1`, not `Y = 0`.

`findbyHeight` then finds `wallAt(_, 0, north)` (real) and `wallAt(_, 0, south)` (false), computing `N = 0 - 0 + 1 = 1`.

**Fix:** guard the bump call with `if old_pos is not None`. When `turning = 2` is set, `prev_pos` is reset to `None`. So on the first cycle after turning, `old_pos is None` and the bump check is skipped, preventing the false positive. Real bumps are unaffected because they happen after `prologPos` has already set `prev_pos` to a valid position.

---

## Phase 1 results

Confirmed correct `N` for grids 3x3 through 13x13, all starting at `(1,1)` facing north, in exactly `3N + 7` cycles each. This is the baseline Phase 2 is measured against.

---

# Phase 2

## Research question

Can an LLM correctly autoformalize raw VacuumWorld percepts into EC-compatible Prolog, and does the resulting reasoning match the Phase 1 hand-coded baseline?

### Why isolate autoformalization from navigation

An earlier exploratory script (`UROP/Attempts/LLM_Autoformalization.py`) let the LLM both choose actions *and* guess `N` directly from a natural-language description of the percept — it never produced actual Prolog and never touched `EC.pl`'s `bump/4` or `find/N` rules. That conflates two different skills (navigation quality and autoformalization accuracy) and doesn't answer the research question, since "deduce N" is being done by the LLM's free-text reasoning rather than by the EC engine.

Phase 2 instead keeps two things identical to Phase 1, and varies only one:

| Component | Phase 1 | Phase 2 |
|-----------|---------|---------|
| Navigation (move-until-bump, then turn) | hand-coded | **same hand-coded logic, reused verbatim** |
| EC rules (`bump/4`, `findbyWidth`, `findbyHeight`, `find/N`) in `EC.pl` | fixed | **same file, unmodified** |
| Percept → Prolog fact translation | hand-coded f-strings (`initial`, `prologPos`, `prologMove`) | **delegated to the LLM** |

This isolates the experiment to a single question: given a plain-English description of what happened in a cycle, can the LLM emit the correct `assertz(...)` Event Calculus fact?

## Week 2 Day 1: `Phase_2.py` skeleton

### Class setup

`MyMind` now extends `VWLLMActorMindSurrogate` (the Gemini-backed mind class used in `vw4_llm_example.py`) instead of plain `VWActorMindSurrogate`, so it gets Gemini access via `dot_env_path=".env"`. `janus.consult("UROP/EC.pl")` is still called at module load, exactly as in Phase 1 — the EC rules are untouched.

### `revise()`

Unchanged from Phase 1: at cycle 0 it calls `initial(pos, orien)`, which asserts `initially(at(X,Y),0)` and `initially(orient(D),0)` directly (this single bootstrapping fact is not delegated to the LLM, since there's no "event" to describe yet).

### The autoformalization prompt

A constant `EC_CONVENTION` string teaches the LLM the same vocabulary documented in Day 2 above — `initially/2`, `happensAt/2`, `initiatesAt/3`, `terminatesAt/3`, fluents `at(X,Y)` and `orient(D)`, events `move(D)` — and instructs it to respond with *only* `assertz(...)` lines, one per fact, no prose.

### `autoformalize(pos, orien, time, bumped)` — the LLM-calling function

Each cycle, instead of Python building the Prolog strings itself, this method:

1. Builds a plain-English description of the cycle: position before/after, attempted `move(orien)`, and whether it succeeded or bumped.
2. Calls `self.provide_context(context=prompt)` — the free-text Gemini method on `VWLLMActorMindSurrogate`, not `decide_physical_with_ai` (the output here is a Prolog fact, not a `VWAction`).
3. Validates: if the call errored, or the response doesn't parse as one-or-more lines matching `ASSERTZ_RE` (`^assertz\(...\)\.?$`), or any line fails to execute via `janus.query_once`, it logs the failure and falls back to the old hand-coded `fallback_move`/`fallback_pos` (renamed from Phase 1's `prologMove`/`prologPos`) so the EC knowledge base stays consistent and the run can keep going.
4. Otherwise, each validated `assertz(...)` line is executed directly against the same Prolog session Phase 1 used.

### `decide()`

Same move-until-bump-then-turn structure as Phase 1's `decide()`, with one swap: where Phase 1 called `prologMove` + `prologPos` directly, Phase 2 calls `autoformalize(...)` once per cycle. The bump check, `turning` counter, and `find(N)` query are otherwise identical to Phase 1.

### Abstract method stubs

`VWLLMActorMindSurrogate` requires `parse_gemini_response` and `backup_decide_after_llm_error` to be implemented even though Phase 2 never calls `decide_physical_with_ai`/`decide_communicative_with_ai` (it only uses `provide_context`). Both are present as minimal stubs returning `VWMoveAction()` to satisfy the abstract base class.

### Not yet implemented

- Per-cycle success/failure logging for the autoformalization accuracy metric (success rate of LLM-produced facts vs. fallback rate).
- A `## Phase 2 Testing Result` table in `note.md`/`note_better.md` mirroring the Phase 1 results table, to compare cycle counts and accuracy across grid sizes 3x3–13x13.