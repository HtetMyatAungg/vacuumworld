grid_size(5).
grid(x, y) :- x >= 0, x < 5, y >= 0, y < 5.
dirt(x, y, colour) :- x >= 0, x < 5, y >= 0, y < 5, colour = orange | colour = green.
agent(id, x, y, colour) :- x >= 0, x < 5, y >= 0, y < 5, id = '9af04778-08d6-4e40-8c6f-ba123d292a22' | id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', colour = orange | colour = green.
empty(x, y) :- x >= 0, x < 5, y >= 0, y < 5.

wall(x, y, west) :- x > 0, x < 5, y >= 0, y < 5.
wall(x, y, north) :- y > 0, y < 5, x >= 0, x < 5.
wall(x, y, east) :- x < 4, x >= 0, y >= 0, y < 5.
wall(x, y, south) :- y < 4, y >= 0, x >= 0, x < 5.