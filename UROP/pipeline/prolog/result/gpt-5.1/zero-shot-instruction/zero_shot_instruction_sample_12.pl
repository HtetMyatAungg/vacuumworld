% Grid dimensions
max_x(10).
max_y(10).

% Basic coordinate range
in_range_x(X) :- between(0, 10, X).
in_range_y(Y) :- between(0, 10, Y).

% General boundary walls
wall(north, X, 0) :- in_range_x(X).
wall(south, X, Y) :- max_y(Y), in_range_x(X).
wall(west, 0, Y) :- in_range_y(Y).
wall(east, X, Y) :- max_x(X), in_range_y(Y).

% Specific walls from percept log (redundant with general rules but kept for completeness)
wall(west, 0, 9).
wall(south, 0, 10).
wall(west, 0, 10).
wall(south, 1, 10).
wall(south, 2, 10).
wall(west, 0, 8).
wall(west, 0, 7).
wall(west, 0, 6).
wall(west, 0, 5).
wall(west, 0, 4).
wall(west, 0, 3).
wall(west, 0, 2).
wall(west, 0, 1).
wall(north, 0, 0).
wall(west, 0, 0).
wall(north, 1, 0).
wall(north, 2, 0).
wall(north, 3, 0).
wall(south, 3, 10).
wall(south, 4, 10).
wall(north, 4, 0).
wall(north, 5, 0).
wall(south, 5, 10).
wall(south, 6, 10).
wall(north, 6, 0).
wall(north, 7, 0).
wall(south, 7, 10).
wall(south, 8, 10).
wall(north, 8, 0).
wall(north, 9, 0).
wall(south, 9, 10).
wall(east, 10, 8).
wall(east, 10, 9).
wall(east, 10, 10).
wall(south, 10, 10).
wall(east, 10, 7).
wall(east, 10, 6).
wall(east, 10, 5).
wall(east, 10, 4).
wall(east, 10, 3).
wall(east, 10, 2).
wall(east, 10, 1).
wall(east, 10, 0).
wall(north, 10, 0).

% Dirt locations
dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

% Agents
agent(1, 0, d3af9897-9139-4ffe-8a15-2e9c6f06e71a, orange).
agent(5, 0, d6428e63-73b7-40a5-9cc9-ea3b5e61a86d, green).

% Cell classification based on contents
has_dirt(X, Y) :- dirt(X, Y, _).
has_agent(X, Y) :- agent(X, Y, _, _).

cell(X, Y, dirt(C)) :-
    dirt(X, Y, C).
cell(X, Y, agent(Id, Colour)) :-
    agent(X, Y, Id, Colour).
cell(X, Y, empty) :-
    in_range_x(X),
    in_range_y(Y),
    \+ has_dirt(X, Y),
    \+ has_agent(X, Y).