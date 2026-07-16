grid_size(11).
cell(X, Y) :- grid_size(N), between(0, N, X), between(0, N, Y).
wall(X, Y, north) :- Y = 0.
wall(X, Y, south) :- grid_size(N), Y = N.
wall(X, Y, west) :- X = 0.
wall(X, Y, east) :- grid_size(N), X = N.
dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).
agent(1, 0, 'd3af9897-9139-4ffe-8a15-2e9c6f06e71a', orange).
agent(5, 0, 'd6428e63-73b7-40a5-9cc9-ea3b5e61a86d', green).