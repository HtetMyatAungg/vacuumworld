grid_size(5).
grid(loc(x, y)) :- x in [0..4], y in [0..4].
seen(dirt(loc(x, y), colour)) :- x in [0..4], y in [0..4], colour in ['orange', 'green'].
seen(agent(id, loc(x, y), colour)) :- x in [0..4], y in [0..4], id = '9af04778-08d6-4e40-8c6f-ba123d292a22', colour in ['orange','green'].
seen(empty(loc(x, y))) :- x in [0..4], y in [0..4].

wall(loc(0, 0), north) :- true.
wall(loc(0, 1), north) :- true.
wall(loc(0, 2), north) :- true.
wall(loc(0, 3), north) :- true.
wall(loc(0, 4), north) :- true.
wall(loc(1, 0), east) :- true.
wall(loc(2, 0), east) :- true.
wall(loc(3, 0), east) :- true.
wall(loc(4, 0), east) :- true.
wall(loc(4, 1), east) :- true.
wall(loc(4, 2), east) :- true.
wall(loc(4, 3), east) :- true.
wall(loc(4, 4), east) :- true.
wall(loc(0, 4), west) :- true.
wall(loc(1, 4), west) :- true.
wall(loc(2, 4), west) :- true.
wall(loc(3, 4), west) :- true.
wall(loc(4, 4), west) :- true.
wall(loc(0, 3), south) :- true.
wall(loc(1, 3), south) :- true.
wall(loc(2, 3), south) :- true.
wall(loc(3, 3), south) :- true.
wall(loc(4, 3), south) :- true.
wall(loc(4, 6), south) :- true.
wall(loc(7,0), south) :- true.
wall(loc(7,1), south) :- true.
wall(loc(7,2), south) :- true.
wall(loc(7,3), south) :- true.
wall(loc(7,4), south) :- true.
wall(loc(7,5), south) :- true.
wall(loc(7,6), south) :- true.
