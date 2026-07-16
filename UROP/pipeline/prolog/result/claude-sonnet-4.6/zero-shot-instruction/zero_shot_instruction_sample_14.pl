:- dynamic dirt/3, agent/3, wall/3.

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent(1, 0, 'd3af9897-9139-4ffe-8a15-2e9c6f06e71a').
agent(5, 0, 'd6428e63-73b7-40a5-9cc9-ea3b5e61a86d').

agent_colour('d3af9897-9139-4ffe-8a15-2e9c6f06e71a', orange).
agent_colour('d6428e63-73b7-40a5-9cc9-ea3b5e61a86d', green).

grid_size(11, 11).

wall(X, Y, north) :- grid_size(_, _), Y =:= 0.
wall(X, Y, south) :- grid_size(_, Rows), Y =:= Rows - 1.
wall(X, Y, west) :- grid_size(_, _), X =:= 0.
wall(X, Y, east) :- grid_size(Cols, _), X =:= Cols - 1.