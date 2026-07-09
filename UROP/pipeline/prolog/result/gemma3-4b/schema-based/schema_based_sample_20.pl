grid_size(9).
grid(x,y) :- x >= 0, x < 9, y >= 0, y < 9.
dirt(x, y, orange) :- x >= 0, x < 9, y >= 0, y < 9.
dirt(x, y, green) :- x >= 0, x < 9, y >= 0, y < 9.
agent(id, x, y, orange) :- x >= 0, x < 9, y >= 0, y < 9.
agent(id, x, y, green) :- x >= 0, x < 9, y >= 0, y < 9.
empty(x,y) :- x >= 0, x < 9, y >= 0, y < 9.

wall(x, y, west) :- x > 0, x < 9, y >= 0, y < 9.
wall(x, y, east) :- x < 8, x >= 0, y >= 0, y < 9.
wall(x, y, north) :- y < 8, y >= 0, x >= 0, x < 9.
wall(x, y, south) :- y > 0, y >= 0, x >= 0, x < 9.