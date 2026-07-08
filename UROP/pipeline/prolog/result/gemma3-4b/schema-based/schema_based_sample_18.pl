grid_size(8).
grid(X, Y) :- X in [0..7], Y in [0..7].
dirt(X, Y, orange) :- X in [0..3], Y in [0..7], Y < 7, X < 3.
dirt(X, Y, green) :- X in [5..7], Y in [0..5], Y < 6, X >= 5.
dirt(X, Y, orange) :- X in [6..7], Y in [4..7], Y < 7, X >= 6.
agent(id1, 3, 7, orange) :- id1 = '9af04778-08d6-4e40-8c6f-ba123d292a22'.
agent(id2, 4, 0, green) :- id2 = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
empty(X, Y) :- X in [0..7], Y in [0..7].
wall(0, 0, north) :- X = 0, Y = 0.
wall(0, 7, north) :- X = 0, Y = 7.
wall(7, 0, south) :- X = 7, Y = 0.
wall(7, 7, south) :- X = 7, Y = 7.
wall(X, 0, west) :- X in [1..7], Y = 0.
wall(0, Y, east) :- Y in [1..7], X = 0.
wall(X, Y, south) :- X in [1..7], Y = 7.
wall(X, Y, north) :- X in [1..7], Y = 0.