grid_size(8).
grid(x, y) :- x > 0 , x < 8 , y > 0 , y < 8 .
dirt(x, y, colour) :- x >= 0 , x < 8 , y >= 0 , y < 8 , x = (x+1) mod 8, y = (y + 1 ) mod 8 , colour is 'orange'.

agent(id, x, y, colour) :- x >= 0 , x < 8 , y >= 0 , y < 8 .
empty(x, y) :- x > 0 , x < 8 , y > 0 , y < 8 .

wall(x, y, north) :- x >= 0, x < 8, y = 7.
wall(x, y, south) :- x >= 0, x < 8, y = 0.
wall(x, y, east) :- x = 7, y > 0, y < 8 .
wall(x, y, west) :- x = 0, y > 0, y < 8 .