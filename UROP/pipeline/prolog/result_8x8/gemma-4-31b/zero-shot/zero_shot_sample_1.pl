grid_size(8, 8).

dirt(2, 1, orange).
dirt(3, 4, orange).
dirt(4, 6, orange).
dirt(6, 4, orange).
dirt(5, 1, green).

agent(0, 3, orange).
agent(4, 0, green).

wall(X, 0, north) :- member(X, [0, 1, 2, 3, 4, 5, 6, 7]).
wall(X, 7, south) :- member(X, [0, 1, 2, 3, 4, 5, 6, 7]).
wall(0, Y, west) :- member(Y, [0, 1, 2, 3, 4, 5, 6, 7]).
wall(7, Y, east) :- member(Y, [0, 1, 2, 3, 4, 5, 6, 7]).