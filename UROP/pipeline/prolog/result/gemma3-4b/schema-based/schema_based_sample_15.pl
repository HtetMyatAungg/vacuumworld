grid_size(8).
grid(x, y) :- x >= 0, x < 8, y >= 0, y < 8.
dirt(x, y, colour) :- x >= 0, x < 8, y >= 0, y < 8, colour = 'orange' ;
                       x >= 0, x < 8, y >= 0, y < 8, colour = 'green'.
agent(id, x, y, colour) :- x >= 0, x < 8, y >= 0, y < 8, colour = 'orange' ;
                           x >= 0, x < 8, y >= 0, y < 8, colour = 'green'.
empty(x, y) :- x >= 0, x < 8, y >= 0, y < 8.

wall(x, y, west) :- x > 0, x < 8, y >= 0, y < 8.
wall(x, y, north) :- x >= 0, x < 8, y > 0, y < 8.
wall(x, y, east) :- x == 7, x >= 0, y >= 0, y < 8.
wall(x, y, south) :- x >= 0, x < 8, y == 7, y >= 0.