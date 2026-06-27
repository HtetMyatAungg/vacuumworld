# First Run: Claude Sonnet 4.6, Zero-Shot, 8x8 Grid

## Constraint Evaluation — 8/8 passed

| Section | Constraint | Result |
|---------|-----------|--------|
| A | partition | PASS |
| A | bounds | PASS |
| A | coverage | PASS |
| A | implies_grid | PASS |
| B | wall_count | PASS |
| B | no_interior_walls | PASS |
| B | cell_wall_counts | PASS |
| B | all_directions | PASS |

## F1 Results (wall_f1_sweep)

| N  | TP | FP | FN | Precision | Recall | F1     |
|----|----|----|-----|-----------|--------|--------|
| 3  | 6  | 26 | 6   | 0.1875    | 0.5000 | 0.2727 |
| 4  | 8  | 24 | 8   | 0.2500    | 0.5000 | 0.3333 |
| 5  | 10 | 22 | 10  | 0.3125    | 0.5000 | 0.3846 |
| 6  | 12 | 20 | 12  | 0.3750    | 0.5000 | 0.4286 |
| 7  | 14 | 18 | 14  | 0.4375    | 0.5000 | 0.4667 |
| **8**  | **32** | **0**  | **0**   | **1.0000** | **1.0000** | **1.0000** |
| 9  | 16 | 16 | 20  | 0.5000    | 0.4444 | 0.4706 |
| 10 | 16 | 16 | 24  | 0.5000    | 0.4000 | 0.4444 |
| 11 | 16 | 16 | 28  | 0.5000    | 0.3636 | 0.4211 |
| 12 | 16 | 16 | 32  | 0.5000    | 0.3333 | 0.4000 |
| 13 | 16 | 16 | 36  | 0.5000    | 0.3077 | 0.3810 |

F1-vs-N curve peaks at N=8 (training size) and decays on both sides — classic hardcoding signature.

## Finding: Partial Abstraction

The LLM's wall rules reference `grid_size(N)` for the boundary condition:

```prolog
wall(loc(X,Y), north) :- grid_size(N), grid(loc(X,Y)), Y =:= 0, X >= 0, X < N.
```

The boundary logic is correctly generalised (`Y =:= 0`, `X < N`), but cell enumeration is anchored to the 8x8 `grid/1` facts instead of using `between/3`. At held-out N, `setup_grid` reasserts `grid_size(N)` but the `grid/1` facts remain the original 64 cells from N=8.

**Partial abstraction**: the model generalised the boundary rule but not the cell iteration. It understood *what* makes a wall, but not *where* to check for one.

## Note

Original LLM output contained both enumerated wall facts AND generalised wall rules — the model hedged by producing both. The enumerated facts were removed before evaluation so the generalised rules could be tested in isolation.
