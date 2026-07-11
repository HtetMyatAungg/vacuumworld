grid_size(8).
grid(x, y) :- x > 0, x < 8, y > 0, y < 8.
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x = 3, y = 2).
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x = 7, y = 5).

agent(id, x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x = 3, y = 2, color = 'orange').
agent(id, x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x = 7, y = 7, color = 'green').

empty(x, y) :- x >= 0, x < 8, y >= 0, y < 8.

wall(x, 0, north) :- x >= 0, x < 8.
wall(x, 8, south) :- x >= 0, x < 8.
wall(0, y, west) :- y >= 0, y < 8.
wall(7, y, east) :- y >= 0, y < 8.