grid_size(8).
grid(loc(X, Y)) :- between(0, 7, X), between(0, 7, Y).
seen(dirt(loc(2, 1), orange)).
seen(dirt(loc(3, 4), orange)).
seen(dirt(loc(4, 6), orange)).
seen(dirt(loc(5, 1), green)).
seen(dirt(loc(6, 4), orange)).
seen(agent('9af04778-08d6-4e40-8c6f-ba123d292a22', loc(0, 3), orange)).
seen(agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', loc(4, 0), green)).
empty_location(loc(X, Y)) :- grid(loc(X, Y)), \+ seen(dirt(loc(X, Y), _)), \+ seen(agent(_, loc(X, Y), _)).
wall(loc(X, Y), north) :- grid_size(N), Y = 0, X >= 0, X < N.
wall(loc(X, Y), south) :- grid_size(N), M is N - 1, Y = M, X >= 0, X < N.
wall(loc(X, Y), west) :- grid_size(N), X = 0, Y >= 0, Y < N.
wall(loc(X, Y), east) :- grid_size(N), M is N - 1, X = M, Y >= 0, Y < N.