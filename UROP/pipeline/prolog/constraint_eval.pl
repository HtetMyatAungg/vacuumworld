%% Constraint-based evaluation for VacuumWorld autoformalisation
%% Query check_all/0 for a full report, or individual checks.

:- discontiguous grid/1, dirt/2, agent/3, empty_location/1, wall/2.

%% grid/1 derived from the LLM's translation facts.
grid(loc(X,Y)) :-
    seen(dirt(loc(X,Y),_));
    seen(agent(_, loc(X,Y),_));
    empty_location(loc(X,Y)).

%% ---- Section A: Translation Constraints ------------------------------------

%% A.1 Partition: every grid cell is exactly one of dirt, agent, or empty_location.

not_in_grid(loc(X,Y)) :-
    grid(loc(X,Y)),
    \+ seen(dirt(loc(X,Y), _)),
    \+ seen(agent(_, loc(X,Y), _)),
    \+ empty_location(loc(X,Y)).

dual_category(loc(X,Y), dirt_and_empty) :-
    seen(dirt(loc(X,Y), _)), empty_location(loc(X,Y)).
dual_category(loc(X,Y), agent_and_empty) :-
    seen(agent(_, loc(X,Y), _)), empty_location(loc(X,Y)).
dual_category(loc(X,Y), dirt_and_agent) :-
    seen(dirt(loc(X,Y), _)), seen(agent(_, loc(X,Y), _)).

partition_ok :-
    \+ not_in_grid(_),
    \+ dual_category(_, _).

%% A.2 Bounds: all coordinates within 0..N-1.

out_of_bounds(loc(X,Y)) :-
    grid(loc(X,Y)),
    grid_size(N), N1 is N - 1,
    ( X < 0 ; X > N1 ; Y < 0 ; Y > N1 ).

bounds_ok :- \+ out_of_bounds(_).

%% A.3 Coverage: number of grid cells equals N^2.

coverage_ok :-
    grid_size(N),
    Expected is N * N,
    findall(loc(X,Y), grid(loc(X,Y)), Cells),
    sort(Cells, Unique),
    length(Unique, Expected).

%% A.4 Dirt/agent implies grid.

dirt_without_grid(loc(X,Y)) :-
    seen(dirt(loc(X,Y), _)), \+ grid(loc(X,Y)).
agent_without_grid(loc(X,Y)) :-
    seen(agent(_, loc(X,Y), _)), \+ grid(loc(X,Y)).

implies_grid_ok :-
    \+ dirt_without_grid(_),
    \+ agent_without_grid(_).

%% ---- Section B: Wall Constraints -------------------------------------------

%% B.1 Wall count equals 4*N (N facts per side, 4 sides, no duplicates).

wall_count_ok :-
    grid_size(N),
    Expected is 4 * N,
    findall(wall(loc(X,Y),D), wall(loc(X,Y),D), Ws),
    sort(Ws, Unique),
    length(Unique, Expected).

%% B.2 No interior walls.

interior_wall(loc(X,Y), D) :-
    wall(loc(X,Y), D),
    grid_size(N), N1 is N - 1,
    X > 0, X < N1,
    Y > 0, Y < N1.

no_interior_walls_ok :- \+ interior_wall(_, _).

%% B.3 Correct wall count per cell: corners=2, edges=1, interior=0.

wall_count_at(loc(X,Y), Count) :-
    findall(D, wall(loc(X,Y), D), Ds),
    length(Ds, Count).

wrong_cell_wall_count(loc(X,Y), Expected, Actual) :-
    grid_size(N), N1 is N - 1,
    between(0, N1, X), between(0, N1, Y),
    ( (X =:= 0 ; X =:= N1), (Y =:= 0 ; Y =:= N1)
      -> Expected = 2
    ; (X =:= 0 ; X =:= N1 ; Y =:= 0 ; Y =:= N1)
      -> Expected = 1
    ; Expected = 0
    ),
    wall_count_at(loc(X,Y), Actual),
    Actual \= Expected.

cell_wall_counts_ok :- \+ wrong_cell_wall_count(_, _, _).

%% B.4 All four directions present.

all_directions_ok :-
    wall(_, north), wall(_, south), wall(_, east), wall(_, west).

%% ---- Full Report -----------------------------------------------------------

check(Name, Goal, Result) :-
    ( call(Goal)
    -> format("  PASS  ~w~n", [Name]), Result = pass
    ;  format("  FAIL  ~w~n", [Name]), Result = fail
    ).

report_violations :-
    findall(C, dual_category(C, _), Duals), sort(Duals, UDuals),
    findall(C, out_of_bounds(C), OOB), sort(OOB, UOOB),
    findall(C, interior_wall(C, _), IW), sort(IW, UIW),
    findall(C-E-A, wrong_cell_wall_count(C, E, A), WC),
    ( UDuals \= [] -> format("    dual_category: ~w~n", [UDuals]) ; true ),
    ( UOOB \= [] -> format("    out_of_bounds: ~w~n", [UOOB]) ; true ),
    ( UIW \= [] -> format("    interior_walls: ~w~n", [UIW]) ; true ),
    ( WC \= [] -> format("    wrong_wall_counts: ~w~n", [WC]) ; true ).

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
    check(all_directions, all_directions_ok, R8),
    nl,
    Results = [R1,R2,R3,R4,R5,R6,R7,R8],
    include(=(pass), Results, Passes),
    length(Passes, P),
    length(Results, T),
    F is T - P,
    format("--- Summary: ~w/~w passed, ~w failed ---~n", [P, T, F]),
    ( F > 0 ->
        nl, writeln("Violations:"), report_violations
    ; true
    ).
