grid_size(8).
grid(x, y) :- x > 0, x < 8, y > 0, y < 8.
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, color \= null.
agent(id, x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, id \= null, color \= null.
empty(x, y) :- x >= 0, x < 8, y >= 0, y < 8.

wall(x, y, north) :- x >= 0, x < 8, y = 7.
wall(x, y, south) :- x >= 0, x < 8, y = 0.
wall(x, y, west) :- y >= 0, y < 8, x = 0.
wall(x, y, east) :- y >= 0, y < 8, x = 7.