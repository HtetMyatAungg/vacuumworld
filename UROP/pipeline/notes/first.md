# First Run: Zero-Shot, 8x8 Grid

## Setup

- Prompt: zero-shot translation of deduplicated percept log into Prolog
- Models: Claude Sonnet 4.6, Gemini 2.5 Flash
- Temperature: 1.0 for both
- Grid: 8x8, 5 dirt cells, 2 agents
- Samples: 5 per model
- Repair loop: up to 5 syntax-error retries per sample

## Claude Sonnet 4.6

### Multi-sample results

All 5 samples are byte-identical (deterministic output despite temperature=1).

### Constraint Evaluation — 5/8 passed (all samples)

| Section | Constraint | Result |
|---------|-----------|--------|
| A | partition | PASS |
| A | bounds | PASS |
| A | coverage | PASS |
| A | implies_grid | PASS |
| B | wall_count | ERROR/FAIL |
| B | no_interior_walls | ERROR/FAIL |
| B | cell_wall_counts | PASS |
| B | all_directions | ERROR/FAIL |

### F1 Sweep — 1.0 across all N (all samples)

Wall rules fully generalise to held-out grid sizes.

### Finding: anonymous variable style

Sonnet's wall rules use `_` for the unused coordinate:

```prolog
wall(loc(X,_), west) :- grid_size(_), X =:= 0.
wall(loc(X,_), east) :- grid_size(N), X =:= N - 1.
wall(loc(_,Y), north) :- grid_size(_), Y =:= 0.
wall(loc(_,Y), south) :- grid_size(N), Y =:= N - 1.
```

The rules are logically correct and generalise perfectly, but `constraint_eval.pl` fails because it expects `wall/2` to return fully ground `loc(X,Y)` terms. The F1 sweep handles it correctly since it enumerates cells with `between` and just tests whether `wall/2` succeeds.

## Gemini 2.5 Flash

### Multi-sample results

All 5 samples are distinct. Section A passes for all. Section B varies:

| Sample | Constraint B | F1 (all N) | Wall style |
|--------|-------------|------------|------------|
| 1 | 2/4 FAIL | 1.0 | anonymous vars + `is` |
| 2 | 2/4 FAIL | 1.0 | anonymous vars + hardcoded 0, `is` for N-1 |
| 3 | 4/4 PASS | 1.0 | fully ground, correct |
| 4 | 2/4 FAIL | 1.0 | `=` for 0, `is` for N-1, singleton warnings |
| 5 | 1/4 FAIL | 1.0 | `>=`/`<` guards with unbound vars |

### Key finding: constraint_eval vs F1 disagreement

All 5 Gemini samples achieve **F1=1.0 across all held-out N** — the wall rules are logically correct in every case. The constraint_eval failures (4/5 samples) are caused by formalisation style differences, not logical errors:

- Samples 1, 2: anonymous variables (`_` / `_Y`) leave coordinates unbound
- Sample 4: singleton variables (uses `X,Y` in head but doesn't bind both)
- Sample 5: arithmetic guards (`X >= 0, X < N`) fail when the other coordinate is unbound

Only sample 3 uses fully ground `loc(X,Y)` with `grid(loc(X,Y))` as guard — the style constraint_eval expects.

## Summary

| | Section A | F1 generalisation | constraint_eval B | Style |
|---|-----------|-------------------|-------------------|-------|
| Sonnet (5/5 identical) | 4/4 PASS | 1.0 all N | 2/4 PASS | anonymous vars |
| Gemini sample 3 | 4/4 PASS | 1.0 all N | 4/4 PASS | fully ground |
| Gemini other 4 | 4/4 PASS | 1.0 all N | 1-2/4 PASS | mixed styles |

### Conclusions

1. **Both models abstract correctly** — F1=1.0 across all N for every sample. Neither model hardcodes wall constants from the training grid. The core research question is answered for zero-shot: both Claude and Gemini abstract the boundary rule.

2. **constraint_eval is style-sensitive, F1 is style-robust** — constraint_eval penalises valid formalisation styles (anonymous variables, partial grounding). The F1 sweep, which enumerates cells externally and tests wall/2 as a predicate, correctly identifies all samples as fully generalised. F1 is the more reliable metric for the abstraction question.

3. **Claude is deterministic, Gemini varies** — Sonnet produces the same output every time (despite temperature=1), while Gemini explores different formalisation styles across samples. Both converge on correct logic, but Gemini's variation is useful for studying the space of possible formalisations.

4. **No hardcoding signature observed** — the F1-vs-N curve is flat at 1.0 for both models. The predicted decay pattern for a hardcoding model (peak at N=8, decay away) does not appear.
