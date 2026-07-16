:- dynamic dirt/3.
:- dynamic agent/4.
:- dynamic wall/3.

grid_size(11, 11).

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent(1, 0, d3af9897_9139_4ffe_8a15_2e9c6f06e71a, orange).
agent(5, 0, d6428e63_73b7_40a5_9cc9_ea3b5e61a86d, green).

wall(X, Y, north) :- grid_size(_, _), Y =:= 0.
wall(X, Y, south) :- grid_size(_, Rows), Y =:= Rows - 1.
wall(X, Y, west) :- grid_size(_, _), X =:= 0.
wall(X, Y, east) :- grid_size(Cols, _), X =:= Cols - 1.