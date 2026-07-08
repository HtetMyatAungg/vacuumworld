grid_size(8).
grid(X, Y) :- X in [0..7], Y in [0..7].
dirt(X, Y, orange) :- X in [0..7], Y in [0..7], (X >= 0 and X <= 7 and Y >= 0 and Y <= 7).
dirt(X, Y, green) :- X in [5..7], Y in [1..7], (X >= 0 and X <= 7 and Y >= 0 and Y <= 7).
dirt(X, Y, null) :- X in [0..7], Y in [0..7].

agent(id, X, Y, orange) :- X in [3..7], Y in [0..7], (X >= 0 and X <= 7 and Y >= 0 and Y <= 7).
agent(id2, X, Y, green) :- X in [4..7], Y in [0..7], (X >= 0 and X <= 7 and Y >= 0 and Y <= 7).
agent(null, X, Y, null) :- X in [0..7], Y in [0..7].

wall(x, y, west) :- x < 0.
wall(x, y, east) :- x > 7.
wall(x, y, north) :- y < 0.
wall(x, y, south) :- y > 7.