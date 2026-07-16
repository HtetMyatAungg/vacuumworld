grid_size(11, 11).

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent(1, 0, orange).
agent(5, 0, green).

wall(X, Y, north) :- Y = 0.
wall(X, Y, south) :- Y = 10.
wall(X, Y, west) :- X = 0.
wall(X, Y, east) :- X = 10.