%% Constraint-based evaluation for VacuumWorld autoformalisation
%% Query check_all/0 for a full report, or individual checks.

:- discontiguous grid/2, dirt/3, agent/4, empty/2, wall/3.

%% grid/2 is expected to come from the LLM translation file as ground facts.
%% Do NOT define it here — defining it as a rule that calls empty/2
%% causes infinite mutual recursion when the LLM defines empty/2
%% in terms of grid/2.

%% Models express the grid side length inconsistently: grid_size(N) (arity 1,
%% what the schema prompt asks for) or grid_size(Cols, Rows) (arity 2, common
%% in unconstrained zero-shot output). Accept both. Without this a grid_size/2
%% output raises existence_error(grid_size/1), which check/3 records as a
%% FAILED check — so the size-dependent checks measured schema convention
%% rather than correctness. The current_predicate/1 guards keep a wholly
%% absent grid_size a clean failure rather than an error.

model_grid_size(N) :-
    (   current_predicate(grid_size/1), grid_size(N0)
    ->  N = N0
    ;   current_predicate(grid_size/2), grid_size(W, H)
    ->  N is max(W, H)
    ).

%% ---- Section A: Translation Constraints ------------------------------------

%% A.1 Partition: every grid cell is exactly one of dirt, agent, or empty.

not_in_grid(loc(X,Y)) :-
    grid(X,Y),
    \+ dirt(X, Y, _),
    \+ agent(_, X, Y, _),
    \+ empty(X,Y).

dual_category(loc(X,Y), dirt_and_empty) :-
    dirt(X, Y, _), empty(X,Y).
dual_category(loc(X,Y), agent_and_empty) :-
    agent(_, X, Y, _), empty(X,Y).
dual_category(loc(X,Y), dirt_and_agent) :-
    dirt(X, Y, _), agent(_, X, Y, _).

%% The \+ checks below are vacuously true when there is nothing to quantify
%% over: a model that emits no grid/2 at all would "pass" simply because no
%% violation can be found. Require the premise to exist first, so an absent
%% grid or grid_size is reported as a FAILED (unverifiable) check rather than
%% a silent pass.

partition_ok :-
    grid(_, _),
    \+ not_in_grid(_),
    \+ dual_category(_, _).

%% A.2 Bounds: all coordinates within 0..N-1.

out_of_bounds(loc(X,Y)) :-
    grid(X,Y),
    model_grid_size(N), N1 is N - 1,
    ( X < 0 ; X > N1 ; Y < 0 ; Y > N1 ).

bounds_ok :- model_grid_size(_), grid(_, _), \+ out_of_bounds(_).

%% A.3 Coverage: number of grid cells equals N^2.

coverage_ok :-
    model_grid_size(N),
    Expected is N * N,
    findall(loc(X,Y), grid(X,Y), Cells),
    sort(Cells, Unique),
    length(Unique, Expected).

%% A.4 Dirt/agent implies grid.

dirt_without_grid(loc(X,Y)) :-
    dirt(X, Y, _), \+ grid(X,Y).
agent_without_grid(loc(X,Y)) :-
    agent(_, X, Y, _), \+ grid(X,Y).

implies_grid_ok :-
    \+ dirt_without_grid(_),
    \+ agent_without_grid(_).

%% ---- Section B: Wall Constraints -------------------------------------------

%% B.1 Wall count equals 4*N (N facts per side, 4 sides, no duplicates).

wall_count_ok :-
    model_grid_size(N),
    Expected is 4 * N,
    N1 is N - 1,
    findall(X-Y-D, (between(0,N1,X), between(0,N1,Y), wall(X,Y,D)), Ws),
    sort(Ws, Unique),
    length(Unique, Expected).

%% B.2 No interior walls.

interior_wall(loc(X,Y), D) :-
    model_grid_size(N), N1 is N - 1, N2 is N1 - 1,
    between(1, N2, X),
    between(1, N2, Y),
    wall(X,Y, D).

no_interior_walls_ok :- model_grid_size(_), \+ interior_wall(_, _).

%% B.3 Correct wall count per cell: corners=2, edges=1, interior=0.

wall_count_at(X,Y, Count) :-
    findall(D, wall(X,Y, D), Ds),
    length(Ds, Count).

wrong_cell_wall_count(loc(X,Y), Expected, Actual) :-
    model_grid_size(N), N1 is N - 1,
    between(0, N1, X), between(0, N1, Y),
    ( (X =:= 0 ; X =:= N1), (Y =:= 0 ; Y =:= N1)
      -> Expected = 2
    ; (X =:= 0 ; X =:= N1 ; Y =:= 0 ; Y =:= N1)
      -> Expected = 1
    ; Expected = 0
    ),
    wall_count_at(X,Y, Actual),
    Actual \= Expected.

cell_wall_counts_ok :- model_grid_size(_), \+ wrong_cell_wall_count(_, _, _).

%% B.4 Direction placement: a wall's direction must match the boundary it
%% sits on -- north only at Y=0, south only at Y=N-1, west at X=0, east at
%% X=N-1. Without this, a layout with every wall rotated 180 degrees (north
%% walls along the bottom row, etc.) passed B.1-B.3 and B.5, since those only
%% count walls. Enumerating wall/3 directly (rather than generating cells)
%% also catches wall facts outside the grid entirely, which the other B
%% checks' between/3 generators cannot see.

misplaced_wall(loc(X,Y), D) :-
    model_grid_size(N), N1 is N - 1,
    wall(X, Y, D),
    \+ legal_wall(N1, X, Y, D).

legal_wall(N1, X, Y, D) :-
    integer(X), integer(Y),
    X >= 0, X =< N1, Y >= 0, Y =< N1,
    (   D == north -> Y =:= 0
    ;   D == south -> Y =:= N1
    ;   D == west  -> X =:= 0
    ;   D == east  -> X =:= N1
    ).

wall_placement_ok :- model_grid_size(_), \+ misplaced_wall(_, _).

%% B.5 All four directions present.

all_directions_ok :-
    model_grid_size(N), N1 is N - 1,
    findall(D, (between(0,N1,X), between(0,N1,Y), wall(X,Y,D)), Ds),
    memberchk(north, Ds),
    memberchk(south, Ds),
    memberchk(east, Ds),
    memberchk(west, Ds).

%% ---- Full Report -----------------------------------------------------------

check(Name, Goal, Result) :-
    ( catch(call(Goal), E, (format("  ERROR ~w: ~w~n", [Name, E]), fail))
    -> format("  PASS  ~w~n", [Name]), Result = pass
    ;  format("  FAIL  ~w~n", [Name]), Result = fail
    ).

report_violations :-
    findall(C, dual_category(C, _), Duals), sort(Duals, UDuals),
    findall(C, out_of_bounds(C), OOB), sort(OOB, UOOB),
    findall(C, interior_wall(C, _), IW), sort(IW, UIW),
    findall(C-E-A, wrong_cell_wall_count(C, E, A), WC),
    findall(C-D, misplaced_wall(C, D), MW), sort(MW, UMW),
    ( UDuals \= [] -> format("    dual_category: ~w~n", [UDuals]) ; true ),
    ( UOOB \= [] -> format("    out_of_bounds: ~w~n", [UOOB]) ; true ),
    ( UIW \= [] -> format("    interior_walls: ~w~n", [UIW]) ; true ),
    ( WC \= [] -> format("    wrong_wall_counts: ~w~n", [WC]) ; true ),
    ( UMW \= [] -> format("    misplaced_walls: ~w~n", [UMW]) ; true ).

check_all :-
    writeln("=== Constraint Evaluation ==="),
    nl,
    writeln("--- Section A (translation) ---"),
    check(partition, partition_ok, R1),
    check(bounds, bounds_ok, R2),
    check(coverage, coverage_ok, R3),
    check(implies_grid, implies_grid_ok, R4),
    nl,
    writeln("--- Section B (walls) ---"),
    check(wall_count, wall_count_ok, R5),
    check(no_interior_walls, no_interior_walls_ok, R6),
    check(cell_wall_counts, cell_wall_counts_ok, R7),
    check(wall_placement, wall_placement_ok, R8),
    check(all_directions, all_directions_ok, R9),
    nl,
    Results = [R1,R2,R3,R4,R5,R6,R7,R8,R9],
    include(=(pass), Results, Passes),
    length(Passes, P),
    length(Results, T),
    F is T - P,
    format("--- Summary: ~w/~w passed, ~w failed ---~n", [P, T, F]),
    ( F > 0 ->
        nl, writeln("Violations:"), report_violations
    ; true
    ).

%% ---- CSV export -------------------------------------------------------------

check_all_to_csv(File) :-
    setup_call_cleanup(
        open(File, write, S),
        write_checks_csv(S),
        close(S)
    ).

write_checks_csv(S) :-
    format(S, "check,result~n", []),
    check(partition, partition_ok, R1), format(S, "partition,~w~n", [R1]),
    check(bounds, bounds_ok, R2), format(S, "bounds,~w~n", [R2]),
    check(coverage, coverage_ok, R3), format(S, "coverage,~w~n", [R3]),
    check(implies_grid, implies_grid_ok, R4), format(S, "implies_grid,~w~n", [R4]),
    check(wall_count, wall_count_ok, R5), format(S, "wall_count,~w~n", [R5]),
    check(no_interior_walls, no_interior_walls_ok, R6), format(S, "no_interior_walls,~w~n", [R6]),
    check(cell_wall_counts, cell_wall_counts_ok, R7), format(S, "cell_wall_counts,~w~n", [R7]),
    check(wall_placement, wall_placement_ok, R8), format(S, "wall_placement,~w~n", [R8]),
    check(all_directions, all_directions_ok, R9), format(S, "all_directions,~w~n", [R9]).
