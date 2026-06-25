%% VacuumWorld Autoformalization Schema
%% DICE Lab UROP — single agent, dirt only, N×N grid, 0-based indexing
%%
%% Coordinate system:
%%   (X, Y) where X = column (east +), Y = row (south +)
%%   (0, 0) = north-west corner
%%
%% LLM fills Sections A and B; Sections C and D are fixed scaffolding.

:- dynamic dirt/3, agent/4, location/2, perceived/2,
           grid_size/1, wall/3, empty_location/2, seen/1.

:- discontiguous dirt/3, agent/4, location/2, wall/3,
                 empty_location/2, perceived/2, seen/1.


%% ---- Section A: Translation (LLM fills) ------------------------------------
%% Emit ground facts from the deduplicated percept log:
%%   grid_size(N). location(X,Y). dirt(X,Y,Colour).
%%   agent(Id,X,Y,Colour). empty_location(X,Y).

%% >>> BEGIN translation facts


%% >>> END translation facts


%% ---- Section B: Wall Rules (LLM fills) -------------------------------------
%% Define wall(X, Y, Dir) for the four boundary directions.
%% Rules must generalise over grid_size(N), not enumerate specific walls.

%% >>> BEGIN wall rules


%% >>> END wall rules


%% ---- Section C: Generalised Knowledge (fixed) ------------------------------

direction(north).
direction(south).
direction(east).
direction(west).

available(move(Dir)) :- direction(Dir).
available(clean).
available(idle).

possible(move(Dir), X, Y) :-
    location(X, Y),
    direction(Dir),
    \+ wall(X, Y, Dir).

possible(clean, X, Y) :-
    location(X, Y),
    dirt(X, Y, _).

possible(idle, X, Y) :-
    location(X, Y).


%% ---- Section D: Testing Primitives (fixed) ---------------------------------
%% Validates Section A against seen/1 facts populated by the harness.
%% Section B is validated separately by the F1-vs-N generalisation harness.

model_fact(location(X, Y))       :- location(X, Y).
model_fact(dirt(X, Y, C))        :- dirt(X, Y, C).
model_fact(agent(I, X, Y, C))    :- agent(I, X, Y, C).
model_fact(empty_location(X, Y)) :- empty_location(X, Y).

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
    findall(wall(X, Y, D), wall(X, Y, D), Ws),
    sort(Ws, Walls).

walls_at(N, Walls) :-
    setup_grid(N),
    predicted_walls(Walls).
