grid_dim(8).

valid_coord(X, Y) :-
    grid_dim(N),
    X >= 0, X < N,
    Y >= 0, Y < N.

wall(X, Y, north) :- grid_dim(N), Y is 0, X >= 0, X < N.
wall(X, Y, south) :- grid_dim(N), Y is N - 1, X >= 0, X < N.
wall(X, Y, west) :- grid_dim(N), X is 0, Y >= 0, Y < N.
wall(X, Y, east) :- grid_dim(N), X is N - 1, Y >= 0, Y < N.

dirt(2, 1, orange).
dirt(3, 4, orange).
dirt(4, 6, orange).
dirt(5, 1, green).
dirt(6, 4, orange).

agent(0, 3, '9af04778-08d6-4e40-8c6f-ba123d292a22', orange).
agent(4, 0, '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', green).

empty(X, Y) :-
    valid_coord(X, Y),
    \+ dirt(X, Y, _),
    \+ agent(X, Y, _, _).