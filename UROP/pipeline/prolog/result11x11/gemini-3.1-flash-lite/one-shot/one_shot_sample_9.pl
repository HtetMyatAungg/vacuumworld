grid_size(11).

grid(X,Y) :- X >= 0, X < 11, Y >= 0, Y < 11.

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent('d3af9897-9139-4ffe-8a15-2e9c6f06e71a', 1, 0, orange).
agent('d6428e63-73b7-40a5-9cc9-ea3b5e61a86d', 5, 0, green).

empty(X,Y) :- grid(X,Y), \+ dirt(X,Y, _), \+ agent(_, X, Y, _).

wall(X, Y, north) :- Y = 0, X >= 0, X < 11.
wall(X, Y, south) :- Y = 10, X >= 0, X < 11.
wall(X, Y, west) :- X = 0, Y >= 0, Y < 11.
wall(X, Y, east) :- X = 10, Y >= 0, Y < 11.