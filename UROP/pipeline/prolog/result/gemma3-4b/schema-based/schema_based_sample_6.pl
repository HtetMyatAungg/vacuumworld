grid_size(5).
grid(x, y) :- x in [0..4], y in [0..4].
dirt(x, y, colour) :- x in [0..4], y in [0..4], colour \= null.
agent(id, x, y, colour) :- x in [0..4], y in [0..4], colour \= null.
empty(x, y) :- x in [0..4], y in [0..4].

wall(x, y, west) :- x = 0, y in [0..4].
wall(x, y, east) :- x = 4, y in [0..4].
wall(x, y, north) :- y = 0, x in [0..4].
wall(x, y, south) :- y = 4, x in [0..4].