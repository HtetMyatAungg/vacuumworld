grid_size(9).
grid(loc(x, y)) :- x >= 0, x < 9, y >= 0, y < 9.
seen(dirt(loc(x, y), colour)) :- x >= 0, x < 9, y >= 0, y < 9, colour = 'orange' | colour = 'green'.
seen(agent(id, loc(x, y), colour)) :- x >= 0, x < 9, y >= 0, y < 9, id = '9af04778-08d6-4e40-8c6f-ba123d292a22' | id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
empty_location(loc(x, y)) :- x >= 0, x < 9, y >= 0, y < 9.
wall(loc(x, y), west) :- x = 0, y >= 0, y < 9.
wall(loc(x, y), east) :- x = 8, y >= 0, y < 9.
wall(loc(x, y), north) :- y = 0, x >= 0, x < 9.
wall(loc(x, y), south) :- y = 8, x >= 0, x < 9.
wall(loc(0, 0), north) :- true.
wall(loc(1, 0), north) :- true.
wall(loc(2, 0), north) :- true.
wall(loc(3, 0), north) :- true.
wall(loc(4, 0), north) :- true.
wall(loc(5, 0), north) :- true.
wall(loc(6, 0), north) :- true.
wall(loc(7, 0), north) :- true.
wall(loc(8, 0), north) :- true.
wall(loc(0, 1), west) :- y = 0, x = 0, true.
wall(loc(1, 1), west) :- y = 0, x = 1, true.
wall(loc(2, 1), west) :- y = 0, x = 2, true.
wall(loc(3, 1), west) :- y = 0, x = 3, true.
wall(loc(4, 1), west) :- y = 0, x = 4, true.
wall(loc(5, 1), west) :- y = 0, x = 5, true.
wall(loc(6, 1), west) :- y = 0, x = 6, true.
wall(loc(7, 1), west) :- y = 0, x = 7, true.
wall(loc(8, 1), west) :- y = 0, x = 8, true.
