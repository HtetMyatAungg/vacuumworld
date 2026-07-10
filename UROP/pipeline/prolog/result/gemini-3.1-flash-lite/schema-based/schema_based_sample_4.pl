grid_size(8).
grid(X, Y) :- between(0, 7, X), between(0, 7, Y).
dirt(2, 1, orange).
dirt(3, 4, orange).
dirt(4, 6, orange).
dirt(5, 1, green).
dirt(6, 4, orange).
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 0, 3, orange).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4, 0, green).
empty(X, Y) :- grid(X, Y), \+ dirt(X, Y, _), \+ agent(_, X, Y, _).
wall(X, Y, north) :- grid_size(N), Y = 0, X >= 0, X < N.
wall(X, Y, south) :- grid_size(N), Y =:= N - 1, X >= 0, X < N.
wall(X, Y, west) :- grid_size(N), X = 0, Y >= 0, Y < N.
wall(X, Y, east) :- grid_size(N), X =:= N - 1, Y >= 0, Y < N.