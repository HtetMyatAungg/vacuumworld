grid_size(3).
grid(x, y) :- x > 0, x < 3, y > 0, y < 3.
seen(dirt(x, y), colour) :- x > 0, x < 3, y > 0, y < 3, colour = 'orange' | colour = 'green'.
seen(agent(id, x, colour)) :- x > 0, x < 3, colour = 'green'.
empty_location(x) :- x > 0, x < 3.
wall(loc(0, y), north) :- y >= 0, y < 3.
wall(loc(0, y), south) :- y > 0, y < 3.
wall(loc(x, 0), west) :- x > 0, x < 3.
wall(loc(x, 0), east) :- x > 0, x < 3.
wall(loc(x, 1), north) :- x > 0, x < 3.
wall(loc(x, 1), south) :- x > 0, x < 3.
wall(loc(x, 2), north) :- x > 0, x < 3.
wall(loc(x, 2), south) :- x > 0, x < 3.
wall(loc(1, 0), east) :- true.
wall(loc(1, 1), east) :- true.
wall(loc(1, 2), east) :- true.
wall(loc(2, 0), west) :- true.
wall(loc(2, 1), west) :- true.
wall(loc(2, 2), west) :- true.