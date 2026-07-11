grid_size(8).
grid(x, y) :- x > 0, x < 8, y > 0, y < 8.
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, color = 'green'.
agent(id, x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, id = '9af04778-08d6-4e40-8c6f-ba123d292a22', color = 'orange'.
empty(x, y) :- x >= 0, x < 8, y >= 0, y < 8.
wall(x, y, north) :- x >= 0, x < 8, y = 7.
wall(x, y