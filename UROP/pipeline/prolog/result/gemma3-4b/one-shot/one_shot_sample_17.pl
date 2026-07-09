grid_size(8).
grid(x, y) :- x > 0, x < 8, y > 0, y < 8.
dirt(x, y, color) :- x > 0, x < 8, y > 0, y < 8, color = 'green'.
dirt(x, y, color) :- x > 0, x < 8, y > 0, y < 8, color = 'orange'.
agent(id, x, y, color) :- x > 0, x < 8, y > 0, y < 8, substring(id, 1, 9, '_').
empty(x, y) :- x > 0, x < 8, y > 0, y < 8.
wall(0, 0, 'north') .
wall(0, 7, 'north') .
wall(7, 0, 'west') .
wall(7, 7, 'west') .
wall(3, 0, 'south') .
wall(3, 7, 'south') .
wall(6, 0, 'east') .
wall(6, 7, 'east') .