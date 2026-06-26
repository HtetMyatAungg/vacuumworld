%% VacuumWorld Autoformalization Schema
%% DICE Lab UROP - single agent, dirt and agent, N×N grid, 0-based indexing
%%
%% Coordinate system:
%%   (X, Y) where X = column (east +), Y = row (south +)
%%   (0, 0) = north-west corner
%%
%% LLM fills Sections A and B; Sections C and D are fixed scaffolding.

:- dynamic dirt/2, agent/3, perceived/2,
           grid_size/1, wall/2, empty_location/1, seen/1, location/2.

:- discontiguous dirt/2, agent/3, wall/2,
                 empty_location/1, perceived/2, seen/1.


%% ---- Section A: Translation (LLM fills) ------------------------------------
%% Emit ground facts from the deduplicated percept log:
%%   grid_size(N). grid(loc(X,Y)). dirt(loc(X,Y), Colour).
%%   agent(Id, loc(X,Y), Colour). empty_location(loc(X,Y)).

%% >>> BEGIN translation facts


%% >>> END translation facts


%% ---- Section B: Wall Rules (LLM fills) -------------------------------------
%% Define wall(loc(X, Y), Dir) for the four boundary directions.
%% Rules must generalise over grid_size(N), not enumerate specific walls.

%% >>> BEGIN wall rules


%% >>> END wall rules


%% ---- Section C: Testing Primitives (fixed) ---------------------------------

%% --- C.1  Section A evaluation (translation) --------------------------------
%% exact/0 checks grid/1 facts only.

model_seen(loc(X, Y)) :- grid(loc(X, Y)).

sound    :- forall(model_seen(F), oracle(F)).
complete :- forall(oracle(F), model_seen(F)).
exact    :- sound, complete.

%% --- C.2  Section B evaluation (wall generalisation, F1-vs-N) ----------------
%% setup_grid(N) creates an N×N grid and reasserts grid_size so the LLM's
%% wall rules can fire at a held-out N.

setup_grid(N) :-
    retractall(grid_size(_)),
    assertz(grid_size(N)),
    retractall(location(_, _)),
    N1 is N - 1,
    forall( ( between(0, N1, X), between(0, N1, Y) ),
            assertz(location(X, Y)) ).

predicted_walls(Walls) :-
    findall(wall(loc(X, Y), D), wall(loc(X, Y), D), Ws),
    sort(Ws, Walls).

oracle_walls(N, Walls) :-
    N1 is N - 1,
    findall(wall(loc(X, Y), D), (
        between(0, N1, X), between(0, N1, Y),
        direction(D),
        (D = north, Y =:= 0 ;
         D = south, Y =:= N1 ;
         D = west,  X =:= 0 ;
         D = east,  X =:= N1)
    ), Ws),
    sort(Ws, Walls).

walls_at(N, Walls) :-
    setup_grid(N),
    predicted_walls(Walls).

wall_f1(N) :-
    walls_at(N, Pred),
    oracle_walls(N, Oracle),
    intersection(Pred, Oracle, TPList),
    length(TPList, TP),
    length(Pred, PredN),
    length(Oracle, OracleN),
    FP is PredN - TP,
    FN is OracleN - TP,
    format("N=~w  TP=~w  FP=~w  FN=~w~n", [N, TP, FP, FN]),
    (TP > 0 ->
        Precision is TP / (TP + FP),
        Recall is TP / (TP + FN),
        F1 is 2 * Precision * Recall / (Precision + Recall),
        format("  Precision=~4f  Recall=~4f  F1=~4f~n", [Precision, Recall, F1])
    ;
        writeln("  F1=0.0000 (no true positives)")
    ).

wall_f1_sweep(Ns) :-
    forall(member(N, Ns), wall_f1(N)).
