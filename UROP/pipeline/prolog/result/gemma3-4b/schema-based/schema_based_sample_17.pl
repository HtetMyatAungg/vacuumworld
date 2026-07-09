grid_size(8).
grid(X, Y) :- X in [0..7], Y in [0..7].
dirt(X, Y, orange) :- X in [0..7], Y in [0..7], X >= 0, Y >= 0.
dirt(X, Y, green) :- X in [0..7], Y in [0..7], X = 5, Y = 1.
agent(id, X, Y, orange) :- X in [0..7], Y in [0..7], X = 3, Y in [0..7], X >= 0, Y >= 0.
agent(id, X, Y, green) :- X in [0..7], Y in [0..7], X = 4, Y in [0..7], X >= 0, Y >= 0.
empty(X, Y) :- X in [0..7], Y in [0..7].

wall(west, X, _) :- X = 0.
wall(south, _, Y) :- Y = 7.
wall(east, X, _) :- X = 7.
wall(north, _, Y) :- Y = 0.