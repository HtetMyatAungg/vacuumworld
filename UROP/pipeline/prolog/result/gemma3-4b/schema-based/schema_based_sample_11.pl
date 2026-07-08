grid_size(8).
grid(X, Y) :- X in [0..7], Y in [0..7].
dirt(X, Y, orange) :- X in [0..7], Y in [0..7], X >= 0, Y >= 0.
dirt(X, Y, green) :- X in [5..7], Y in [0..7],  X >= 0, Y >= 0.
agent(9af04778-08d6-4e40-8c6f-ba123d292a22, 3, 0, orange).
agent(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c, 4, 0, green).
empty(X, Y) :- X in [0..7], Y in [0..7].

wall(X, Y, west) :- X = 0, Y in [0..7].
wall(X, Y, north) :- Y = 0, X in [0..7].
wall(X, Y, south) :- Y = 7, X in [0..7].
wall(X, Y, east) :- X = 7, Y in [0..7].