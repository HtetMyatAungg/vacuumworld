%% VacuumWorld Autoformalization Schema
%% DICE Lab UROP — single agent, dirt and agent, N×N grid, 0-based indexing
%%
%% Coordinate system:
%%   (X, Y) where X = column (east +), Y = row (south +)
%%   (0, 0) = north-west corner
%%
%% LLM fills Sections A and B; Sections C and D are fixed scaffolding.

:- dynamic dirt/2, agent/3, perceived/2,
           grid_size/1, wall/2, empty_location/1, seen/1.

:- discontiguous dirt/2, agent/3, wall/2,
                 empty_location/1, perceived/2, seen/1.


%% ---- Section A: Translation (LLM fills) ------------------------------------
%% Emit ground facts from the deduplicated percept log:
%%   grid_size(N). seen(loc(X,Y)). dirt(loc(X,Y), Colour).
%%   agent(Id, loc(X,Y), Colour). empty_location(loc(X,Y)).

%% >>> BEGIN translation facts
grid_size(8).

seen(loc(0,6)).
empty_location(loc(0,6)).
seen(loc(1,6)).
empty_location(loc(1,6)).
seen(loc(2,6)).
empty_location(loc(2,6)).
seen(loc(0,7)).
empty_location(loc(0,7)).
seen(loc(1,7)).
empty_location(loc(1,7)).
seen(loc(2,7)).
empty_location(loc(2,7)).
seen(loc(0,5)).
empty_location(loc(0,5)).
seen(loc(1,5)).
empty_location(loc(1,5)).
seen(loc(2,5)).
empty_location(loc(2,5)).
seen(loc(0,4)).
empty_location(loc(0,4)).
seen(loc(1,4)).
empty_location(loc(1,4)).
seen(loc(2,4)).
empty_location(loc(2,4)).
seen(loc(0,3)).
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', loc(0,3), orange).
seen(loc(1,3)).
empty_location(loc(1,3)).
seen(loc(2,3)).
empty_location(loc(2,3)).
seen(loc(0,2)).
empty_location(loc(0,2)).
seen(loc(1,2)).
empty_location(loc(1,2)).
seen(loc(2,2)).
empty_location(loc(2,2)).
seen(loc(0,1)).
empty_location(loc(0,1)).
seen(loc(1,1)).
empty_location(loc(1,1)).
seen(loc(2,1)).
dirt(loc(2,1), orange).
seen(loc(0,0)).
empty_location(loc(0,0)).
seen(loc(1,0)).
empty_location(loc(1,0)).
seen(loc(2,0)).
empty_location(loc(2,0)).
seen(loc(3,0)).
empty_location(loc(3,0)).
seen(loc(3,1)).
empty_location(loc(3,1)).
seen(loc(3,2)).
empty_location(loc(3,2)).
seen(loc(3,3)).
empty_location(loc(3,3)).
seen(loc(3,4)).
dirt(loc(3,4), orange).
seen(loc(3,5)).
empty_location(loc(3,5)).
seen(loc(3,6)).
empty_location(loc(3,6)).
seen(loc(3,7)).
empty_location(loc(3,7)).
seen(loc(4,5)).
empty_location(loc(4,5)).
seen(loc(4,6)).
dirt(loc(4,6), orange).
seen(loc(4,7)).
empty_location(loc(4,7)).
seen(loc(4,4)).
empty_location(loc(4,4)).
seen(loc(4,3)).
empty_location(loc(4,3)).
seen(loc(4,2)).
empty_location(loc(4,2)).
seen(loc(4,1)).
empty_location(loc(4,1)).
seen(loc(4,0)).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', loc(4,0), green).
seen(loc(5,0)).
empty_location(loc(5,0)).
seen(loc(5,1)).
dirt(loc(5,1), green).
seen(loc(5,2)).
empty_location(loc(5,2)).
seen(loc(5,3)).
empty_location(loc(5,3)).
seen(loc(5,4)).
empty_location(loc(5,4)).
seen(loc(5,5)).
empty_location(loc(5,5)).
seen(loc(5,6)).
empty_location(loc(5,6)).
seen(loc(5,7)).
empty_location(loc(5,7)).
seen(loc(6,5)).
empty_location(loc(6,5)).
seen(loc(6,6)).
empty_location(loc(6,6)).
seen(loc(6,7)).
empty_location(loc(6,7)).
seen(loc(6,4)).
dirt(loc(6,4), orange).
seen(loc(6,3)).
empty_location(loc(6,3)).
seen(loc(6,2)).
empty_location(loc(6,2)).
seen(loc(6,1)).
empty_location(loc(6,1)).
seen(loc(6,0)).
empty_location(loc(6,0)).
seen(loc(7,0)).
empty_location(loc(7,0)).
seen(loc(7,1)).
empty_location(loc(7,1)).
seen(loc(7,2)).
empty_location(loc(7,2)).
seen(loc(7,3)).
empty_location(loc(7,3)).
seen(loc(7,4)).
empty_location(loc(7,4)).
seen(loc(7,5)).
empty_location(loc(7,5)).
seen(loc(7,6)).
empty_location(loc(7,6)).
seen(loc(7,7)).
empty_location(loc(7,7)).

%% >>> END translation facts


%% ---- Section B: Wall Rules (LLM fills) -------------------------------------
%% Define wall(loc(X, Y), Dir) for the four boundary directions.
%% Rules must generalise over grid_size(N), not enumerate specific walls.

%% >>> BEGIN wall rules
% North boundary wall (Y=0)
wall(loc(X, 0), north) :-
    grid_size(N),
    between(0, N - 1, X).

% South boundary wall (Y=N-1)
wall(loc(X, Y), south) :-
    grid_size(N),
    Y is N - 1,
    between(0, N - 1, X).

% West boundary wall (X=0)
wall(loc(0, Y), west) :-
    grid_size(N),
    between(0, N - 1, Y).

% East boundary wall (X, Y) where X=N-1
wall(loc(X, Y), east) :-
    grid_size(N),
    X is N - 1,
    between(0, N - 1, Y).

%% >>> END wall rules


%% ---- Section C: Generalised Knowledge (fixed) ------------------------------

direction(north).
direction(south).
direction(east).
direction(west).

available(move(Dir)) :- direction(Dir).
available(clean).
available(idle).

possible(move(Dir), loc(X, Y)) :-
    seen(loc(X, Y)),
    direction(Dir),
    \+ wall(loc(X, Y), Dir),
    \+ agent(_, loc(X, Y), _).

possible(clean, loc(X, Y)) :-
    seen(loc(X, Y)),
    dirt(loc(X, Y), _).

possible(idle, loc(X, Y)) :-
    seen(loc(X, Y)).


%% ---- Section D: Testing Primitives (fixed) ---------------------------------
%% Validates Section A against seen/1 facts populated by the harness.
%% Section B is validated separately by the F1-vs-N generalisation harness.

model_fact(loc(X, Y))                :- seen(loc(X, Y)).
model_fact(dirt(loc(X, Y), C))       :- dirt(loc(X, Y), C).
model_fact(agent(I, loc(X, Y), C))   :- agent(I, loc(X, Y), C).
model_fact(empty_location(loc(X,Y))) :- empty_location(loc(X, Y)).

final_state(State) :- findall(F, model_fact(F), State).

sound    :- forall(model_fact(F), seen(F)).
complete :- forall(seen(F), model_fact(F)).
exact    :- sound, complete.

%% Re-create an N×N grid for testing wall rules at held-out N.
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

walls_at(N, Walls) :-
    setup_grid(N),
    predicted_walls(Walls).