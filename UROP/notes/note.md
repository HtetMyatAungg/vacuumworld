# Research Question Phase 1: Can an agent infer grid dimensions using only wall bumps and EC reasoning, without direct perception?

why EC over a simple counter? Because it models changes by events naturally. It also serves as a evaluator for LLM prolog outputs in phase 2.

why Prolog over Python logic? As the next phase is LLM autoformalizing to a formal language eg. Prolog, Prolog is chosen for logic structure.

## Day 1: Setting up Vacuumworld and checking what percepts are outputted when idle, took one step, against a wall.

`run(default_mind=MyMind(), efforts=VWActionEffort.REASONABLE_EFFORTS, gui=True, load="files/guiless.json")` I had `gui=False` and it shows a grid in terminal. Changed to `True` to get the GUI.

Idle agent observation gives its current coordinates, whether left/right/forward/backward has a wall, and the forward/backward/left/right/forward-left/forward-right coordinates along with wall flags for each neighboring cell.

Made the agent turn and the observation log gives the correct orientation.

The agent does not clip into the wall — it stops and can check if a wall is there.

When the agent moves forward, the observation updates the coordinate accordingly and the neighbour coordinates too.

`get_own_id()` reads the observer's ID from the latest perception (`self.__latest_observation.get_observer_id()`), not from any separately stored state. The `"actor"` field in the observation JSON is exactly what it returns. If another agent is in a neighboring cell, their ID is also directly readable from that cell's perception — no need to ask them. In short, `get_own_id()` reads from the center cell, and other agents' IDs are readable from their respective cells the same way.

## Day 2: Event Calculus core, tested in isolation, wrote a Prolog file with physics as axioms.

Decided to use the Event Fluent Time convention `initiatesAt(E,F,T)` as it has better readability and is easier to understand.

Initial coordinates and orientation are set as facts: `initially(at(3,4),0)` means the agent starts at coordinate (3,4) at time 0, and `initially(orien(n),0)` means the agent's orientation is north at time 0.

`holdsAt/2` has two clauses:

First clause: `holdsAt(F,T) :- initial(0), initially(F, 0), 0 =< T, \+ brokenAt(F, 0, T).`
Fluent `F` holds at time `T` if the initial time is 0 (already a fact), `F` held at time 0, and it has not been broken from time 0 to time `T`.

Second clause (event case): `holdsAt(F, T) :- happensAt(E, Ti), Ti =< T, initiatesAt(E, F, Ti), \+ brokenAt(F, Ti, T).`
This checks whether fluent `F` holds at time `T` by requiring that some event `E` happened at time `Ti ≤ T`, that event initiated `F` at `Ti`, and `F` has not been broken from `Ti` to `T`.

## Day 3: Wall discovery and grid-size inference

**Bump detection:** `bump(D, X, Y, T)` fires when a `move(D)` event happened at time `T` but the agent's position didn't change. i.e., `holdsAt(at(X,Y), T-1)` and `holdsAt(at(X,Y), T)` are both true. On the first detected bump in direction `D` from `(X,Y)`, `wallAt(X, Y, D)` is asserted as a new fact. This is monotonic belief expansion — facts are only added, never retracted.

`wallAt(X, Y, D)` encodes: "there is a wall adjacent to cell `(X,Y)` in direction `D`." Because VacuumWorld uses a square grid starting at `(1,1)`, a west wall at `(1, Y)` means `Xmin = 1`, and an east wall at `(N, Y)` means `Xmax = N`, so the width is `N = Xmax - Xmin + 1`. Same logic applies vertically for height.

**Grid-size inference:**
- `findbyWidth(N)` unifies `Xmin` and `Xmax` from any two `wallAt` facts facing `w` and `e` on the same row `Y`.
- `findbyHeight(N)` unifies `Ymin` and `Ymax` from any two `wallAt` facts facing `n` and `s` on the same column `X`.
- `find(N)` succeeds only when both agree on the same `N`, exploiting the square-grid assumption.

## Day 4: Python–Prolog bridge and bump detection

Linked Python and Prolog using `janus_swi`. Docs: https://www.swi-prolog.org/pldoc/man?section=janus-call-prolog

`janus.consult("UROP/EC.pl")` loads the Prolog file. `janus.query_once("goal")` runs a query and returns a dict of variable bindings (`{'truth': False}` on failure). To add facts from Python, use `assertz` inside the query string: `janus.query_once(f"assertz(happensAt(move({orien}), {t}))")`.

Each cycle in `decide()`: assert `happensAt` for the current move, call the Prolog `bump/4` rule to check if the previous move resulted in no position change, then compare `wallAt` before and after to see if a new wall was discovered. Position tracking uses `initiatesAt` and `terminatesAt` so `holdsAt` stays accurate.

Key bugs fixed along the way:
- `get_effort()` returns total effort (VWMoveAction costs 3), not cycle count — used a manual `self.cycle` counter instead
- `prologMove` was querying `happensAt` instead of asserting it with `assertz`
- `terminatesAt` was asserted even on bumps (when position didn't change), breaking `holdsAt`
- EC.pl had a missing `.` on `:- dynamic initially/2` causing silent assertz failures
- `janus_swi` can't return compound Prolog terms (e.g. `at(4,0)`) as Python values — query variables must be atomic

## Day 5: Fixing bump detection and findbyHeight

**Bug: `prologPos` called after `bump`** — `initiatesAt(move, at(P), T)` was asserted AFTER the Prolog bump query ran, so `holdsAt(at(P), T)` always failed. Fix: moved `prologPos` to run before `bump`.

**Bug: `time -= 1` in `bump()` was wrong** — with prologPos using `t = Time`, calling Prolog `bump` with `T = time-1` caused `holdsAt(at(P), time-2)` to fail since `initiatesAt` was only asserted at `time-1`. Fix: removed the subtraction; pass `T = time` directly.

**Bug: `prev_pos` not initialized** — bump detection at cycle 1 was silently skipped because `prev_pos` was `None`. Fix: initialize `self.prev_pos = c` inside `initial()`.

**Bug: Turning check missing `time > 0` guard** — at cycle 0, `old_pos == coordinate` would incorrectly trigger turning before any move. Fix: guard with `if time > 0`.

**Bug: `self.cycle` not incremented during turns** — EC timestamps fell behind real cycles; bump detection missed the first wall in a new direction after turning. Fix: added `self.cycle += 1` in the turning branch.

**Bug: False positive `wallAt` after turning** — after bouncing off the north wall and turning, the agent's position was unchanged for several cycles. At the first cycle moving south, `holdsAt(at(P), T-1)` and `holdsAt(at(P), T)` were both true (stale EC history), so a south wall was incorrectly asserted at the north edge. This caused `findbyHeight` to compute `N = 1`. Fix: guard `self.bump(...)` with `if old_pos is not None` — since `prev_pos` is reset to `None` when turning starts, this suppresses the bump check for exactly the first cycle in a new direction.

## Testing Result
### All agents start from position: (1,1) facing north.
3x3 : Took 16 cycles, testing success: prolog output N: 3
4x4: Took 19 cycles, testing success: prolog output N: 4
5x5: Took 22 cycles, testing success: prolog output N: 5
6x6: Took 25 cycles, testing success: prolog output N: 6
7x7: Took 28 cycles, testing success: prolog output N: 7
8x8: Took 31 cycles, testing success: prolog output N: 8
9x9: Took 34 cycles, testing success: prolog output N: 9
10x10: Took 37 cycles, testing success: prolog output N: 10
11x11: Took 40 cycles, testing success: prolog output N: 11
12x12: Took 43 cycles, testing success: prolog output N: 12
13x13: Took 46 cycles, testing success: prolog output N: 13

cycle = 3N + 7. As agent traces two full sides of the grid to hit all 4 walls; 3 cycles per N comes from movement and turning overhead.

Phase 1 confirms EC can track agent state and infer world structure from minimal sensory input (bumps only), this establishes the baseline: correct EC reasoning achieves N in 3N+7 cycles. Phase 2 will measure whether LLM-autoformalized Prolog can match this.

# Phase 2

## Question: Can an agent build an interpretable model of its own world from experience?


## Week 2 Day 1: Focusing on LLM integration and autoformalization of percepts into prolog