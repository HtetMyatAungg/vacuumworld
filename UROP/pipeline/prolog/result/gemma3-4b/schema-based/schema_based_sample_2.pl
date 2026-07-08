grid_size(9).
grid(X, Y) :- X in [0..8], Y in [0..8].
dirt(X, Y, orange) :- X in [0..8], Y in [0..8], (X mod 2 = 0 and Y mod 2 = 0).
dirt(X, Y, green) :- X in [0..8], Y in [0..8], (X mod 2 = 1 and Y mod 2 = 1).
agent(Id, X, Y, orange) :- X in [0..8], Y in [0..8], X = 7, Y = 7, Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
agent(Id, X, Y, green) :- X in [0..8], Y in [0..8], X = 4, Y = 0, Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
empty(X, Y) :- X in [0..8], Y in [0..8].
wall(X, Y, west) :- X > 0, Y in [0..8], X in [0..8].
wall(X, Y, north) :- Y > 0, X in [0..8], X in [0..8].
wall(X, Y, east) :- X < 8, Y in [0..8], X in [0..8].
wall(X, Y, south) :- Y < 8, X in [0..8], X in [0..8].
wall(7, 7, east) :- true.
wall(7, 7, south) :- true.