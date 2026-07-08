grid_size(5).
grid(x, y) :- x in [0..4], y in [0..4].
dirt(x, y, colour) :- x in [0..4], y in [0..4], (x == 3 && y == 3), colour = 'orange'.
dirt(x, y, colour) :- x in [0..4], y in [0..4], (x == 5 && y == 1), colour = 'green'.
dirt(x, y, colour) :- x in [0..4], y in [0..4], (x == 6 && y == 4), colour = 'orange'.
empty(x, y) :- x in [0..4], y in [0..4].

wall(0, 7, north) :- not (grid(0, 7)).
wall(1, 0, north) :- not (grid(1, 0)).
wall(2, 0, north) :- not (grid(2, 0)).
wall(3, 0, north) :- not (grid(3, 0)).
wall(4, 0, north) :- not (grid(4, 0)).
wall(7, 0, east) :- not (grid(7, 0)).
wall(0, 0, west) :- not (grid(0, 0)).
wall(0, 1, west) :- not (grid(0, 1)).
wall(0, 2, west) :- not (grid(0, 2)).
wall(0, 3, west) :- not (grid(0, 3)).
wall(0, 4, west) :- not (grid(0, 4)).
wall(1, 7, south) :- not (grid(1, 7)).
wall(2, 7, south) :- not (grid(2, 7)).
wall(3, 7, south) :- not (grid(3, 7)).
wall(4, 7, south) :- not (grid(4, 7)).
wall(5, 6, east) :- not (grid(5, 6)).
wall(6, 6, east) :- not (grid(6, 6)).
wall(6, 7, east) :- not (grid(6, 7)).
wall(7, 7, south) :- not (grid(7, 7)).