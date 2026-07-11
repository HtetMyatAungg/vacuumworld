grid_size(9).
grid(X, Y) :- X >= 0, X < 9, Y >= 0, Y < 9.
dirt(X, Y, orange) :- X >= 0, X < 9, Y >= 0, Y < 9.
dirt(X, Y, green) :- X >= 0, X < 9, Y >= 0, Y < 9.
agent(id, X, Y, orange) :- X >= 0, X < 9, Y >= 0, Y < 9.
agent(id, X, Y, green) :- X >= 0, X < 9, Y >= 0, Y < 9.
empty(X, Y) :- X >= 0, X < 9, Y >= 0, Y < 9.

wall(X, Y, west) :- X = 0, Y >= 0, Y < 9.
wall(X, Y, south) :- Y = 0, X >= 0, X < 9.
wall(X, Y, east) :- X = 8, Y >= 0, Y < 9.
wall(X, Y, north) :- Y = 8, X >= 0, X < 9.
wall(X, Y, south) :- Y = 7, X >= 0, X < 9.
wall(X, Y, east) :- X = 7, Y >= 0, Y < 9.