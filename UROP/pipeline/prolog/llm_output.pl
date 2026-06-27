%% Dummy LLM output for a 5x5 grid — contains deliberate errors for testing constraints.

:- discontiguous seen/1, empty_location/1, wall/2.

grid_size(5).

%% Translation facts
seen(dirt(loc(1,2), orange)).
seen(dirt(loc(3,0), green)).
seen(agent('agent-001', loc(2,2), green)).

empty_location(loc(0,0)).
empty_location(loc(1,0)).
empty_location(loc(2,0)).
empty_location(loc(0,1)).
empty_location(loc(1,1)).
empty_location(loc(2,1)).
empty_location(loc(3,1)).
empty_location(loc(4,1)).
empty_location(loc(0,2)).
empty_location(loc(3,2)).
empty_location(loc(4,2)).
empty_location(loc(0,3)).
empty_location(loc(1,3)).
empty_location(loc(2,3)).
empty_location(loc(3,3)).
empty_location(loc(4,3)).
empty_location(loc(0,4)).
empty_location(loc(1,4)).
empty_location(loc(2,4)).
empty_location(loc(3,4)).
empty_location(loc(4,4)).
empty_location(loc(4,0)).

%% BUG: loc(1,2) has dirt AND empty — partition violation
empty_location(loc(1,2)).

%% Wall rules — hardcoded to 5, will fail at other N
wall(loc(X,0), north) :- between(0,4,X).
wall(loc(X,4), south) :- between(0,4,X).
wall(loc(0,Y), west)  :- between(0,4,Y).
wall(loc(4,Y), east)  :- between(0,4,Y).
