grid_size(11).

wall(X, Y, west) :- grid_size(N), X = 0, Y >= 0, Y < N.
wall(X, Y, east) :- grid_size(N), MaxX is N - 1, X = MaxX, Y >= 0, Y < N.
wall(X, Y, north) :- grid_size(N), Y = 0, X >= 0, X < N.
wall(X, Y, south) :- grid_size(N), MaxY is N - 1, Y = MaxY, X >= 0, X < N.

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent(1, 0, 'd3af9897-9139-4ffe-8a15-2e9c6f06e71a', orange).
agent(5, 0, 'd6428e63-73b7-40a5-9cc9-ea3b5e61a86d', green).