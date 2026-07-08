grid_size(5).
grid(x, y) :- x >= 0, x < 5, y >= 0, y < 5.
dirt(x, y, colour) :- x >= 0, x < 5, y >= 0, y < 5, colour not = null.
agent(id, x, y, colour) :- x >= 0, x < 5, y >= 0, y < 5, id not = null, colour not = null.
empty(x, y) :- x >= 0, x < 5, y >= 0, y < 5, not (dirt(x, y, _) ) and not (agent(_,x,y,_)).

wall(0, 0, north) :- true.
wall(0, 4, north) :- true.
wall(4, 0, east) :- true.
wall(4, 4, east) :- true.
wall(0, 0, west) :- x = 0, y = 0.
wall(4, 0, west) :- x = 4, y = 0.
wall(0, 4, south) :- y = 4, x = 0.
wall(4, 4, south) :- y = 4, x = 4.
wall(1, 6, south) :- true.
wall(2, 6, south) :- true.
wall(3, 7, south) :- true.
wall(3, 6, east) :- true.
wall(5, 0, north) :- true.
wall(5, 1, east) :- true.
wall(5, 2, east) :- true.
wall(5, 3, east) :- true.
wall(5, 4, east) :- true.
wall(5, 5, east) :- true.
wall(5, 6, east) :- true.
wall(5, 7, south) :- true.
wall(7, 0, north) :- true.
wall(7, 1, east) :- true.
wall(7, 2, east) :- true.
wall(7, 3, east) :- true.
wall(7, 4, east) :- true.
wall(7, 5, east) :- true.
wall(7, 6, east) :- true.
wall(7, 7, south) :- true.