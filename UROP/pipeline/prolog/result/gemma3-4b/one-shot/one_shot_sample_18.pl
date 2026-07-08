grid_size(8).
grid(x, y) :- x > 0, x < 8, y > 0, y < 8.
dirt(x, y, colour) :- x > 0, x < 8, y > 0, y < 8, between(1, 8, x), between(1, 8, y), colour = 'green' | colour = 'orange'.
agent(id, x, y, colour) :- x > 0, x < 8, y > 0, y < 8, between(1, 8, x), between(1, 8, y), id like '_*?[a-f][a-f]*.'.
empty(x, y) :- x > 0, x < 8, y > 0, y < 8, between(1, 8, x), between(1, 8, y).

wall(x, y, north) :- x > 0, x < 8, y = 8.
wall(x, y, south) :- x > 0, x < 8, y = 0.
wall(x, y, east) :- y > 0, y < 8, x = 8.
wall(x, y, west) :- y > 0, y < 8, x = 0.