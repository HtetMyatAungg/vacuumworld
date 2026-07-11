grid_size(11).
grid(X, Y) :- between(0, 10, X), between(0, 10, Y).

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent('d3af9897-9139-4ffe-8a15-2e9c6f06e71a', 1, 0, orange).
agent('d6428e63-73b7-40a5-9cc9-ea3b5e61a86d', 5, 0, green).

empty(X, Y) :- grid(X, Y), \+ dirt(X, Y, _), \+ agent(_, X, Y, _).

wall(X, Y, north) :- grid(X, Y), Y = 0.
wall(X, Y, south) :- grid_size(N), M is N - 1, grid(X, Y), Y = M.
wall(X, Y, west) :- grid(X, Y), X = 0.
wall(X, Y, east) :- grid_size(N), M is N - 1, grid(X, Y), X = M.