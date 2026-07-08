grid_size(5).
grid(x, y) :- x > 0, x < 5, y > 0, y < 5.
dirt(x, y, orange) :- x >= 0, x < 5, y >= 0, y < 5, x = 3, y = 3.
dirt(x, y, green) :- x >= 0, x < 5, y >= 0, y < 5, x = 5, y = 1.
dirt(x, y, orange) :- x >= 0, x < 5, y >= 0, y < 5, x = 6, y = 4.
empty(x, y) :- x > 0, x < 5, y > 0, y < 5.

wall(x, y, west) :- x > 0, x < 5, y >= 0, y < 5, x == 0, y >= 0, y < 5.
wall(x, y, south) :- x >= 0, x < 5, y > 0, y < 5, x == 0, y == 0, y < 5.
wall(x, y, north) :- x >= 0, x < 5, y > 0, y < 5, x == 0, y == 7, y < 5 .
wall(x, y, east) :- x >= 0, x < 5, y >= 0, y < 5, x == 6, y >= 0, y < 5.