grid_size(8).
grid(X, Y) :- between(0, 7, X), between(0, 7, Y).
dirt(2, 1, orange).
dirt(3, 4, orange).
dirt(4, 6, orange).
dirt(5, 1, green).
dirt(6, 4, orange).
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 0, 3, orange).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4, 0, green).
empty(0, 0).
empty(0, 1).
empty(0, 2).
empty(0, 4).
empty(0, 5).
empty(0, 6).
empty(0, 7).
empty(1, 0).
empty(1, 1).
empty(1, 2).
empty(1, 3).
empty(1, 4).
empty(1, 5).
empty(1, 6).
empty(1, 7).
empty(2, 0).
empty(2, 2).
empty(2, 3).
empty(2, 4).
empty(2, 5).
empty(2, 6).
empty(2, 7).
empty(3, 0).
empty(3, 1).
empty(3, 2).
empty(3, 3).
empty(3, 5).
empty(3, 6).
empty(3, 7).
empty(4, 1).
empty(4, 2).
empty(4, 3).
empty(4, 4).
empty(4, 5).
empty(4, 7).
empty(5, 0).
empty(5, 2).
empty(5, 3).
empty(5, 4).
empty(5, 5).
empty(5, 6).
empty(5, 7).
empty(6, 0).
empty(6, 1).
empty(6, 2).
empty(6, 3).
empty(6, 5).
empty(6, 6).
empty(6, 7).
empty(7, 0).
empty(7, 1).
empty(7, 2).
empty(7, 3).
empty(7, 4).
empty(7, 5).
empty(7, 6).
empty(7, 7).
wall(X, Y, north) :- grid_size(N), Y =:= 0, X >= 0, X < N.
wall(X, Y, south) :- grid_size(N), Y =:= N - 1, X >= 0, X < N.
wall(X, Y, west) :- grid_size(N), X =:= 0, Y >= 0, Y < N.
wall(X, Y, east) :- grid_size(N), X =:= N - 1, Y >= 0, Y < N.