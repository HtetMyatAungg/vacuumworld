grid_size(5).
grid(X, Y) :- X between 0..4, Y between 0..4.

dirt(X, Y, orange) :- X between 0..4, Y between 0..4, X = 3, Y = 3.
dirt(X, Y, green) :- X between 0..4, Y between 0..4, X = 5, Y = 1.
dirt(X, Y, orange) :- X between 0..4, Y between 0..4, X = 6, Y = 4.

agent(id1, 0, 0, orange) :- X between 0..4, Y between 0..4, X = 3, Y = 3.
agent(id2, 4, 0, green) :- X between 0..4, Y between 0..4, X = 4, Y = 0.

empty(X, Y) :- X between 0..4, Y between 0..4.

wall(x, y, west) :- x = 0, y between 1..4.
wall(x, y, north) :- y = 0, x between 1..4.
wall(x, y, east) :- x = 4, y between 1..4.
wall(x, y, south) :- y = 4, x between 1..4.