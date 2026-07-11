grid_size(9).
grid(X, Y) :- X in [0..8], Y in [0..8].
dirt(X, Y, _) :- X in [0..8], Y in [0..8].
agent(ID, X, Y, _) :- X in [0..8], Y in [0..8].
empty(X, Y) :- X in [0..8], Y in [0..8].
wall(X, Y, west) :- X == 0, Y >= 0, Y < 9.
wall(X, Y, east) :- X == 8, Y >= 0, Y < 9.
wall(X, Y, north) :- Y == 0, X >= 0, X < 9.
wall(X, Y, south) :- Y == 8, X >= 0, X < 9.