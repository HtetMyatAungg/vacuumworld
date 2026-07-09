grid_size(5).
grid(x, y) :- x > 0, x < 5, y > 0, y < 5, between(0,4, x), between(0,4,y).
dirt(x, y, orange) :- x >= 0, x < 5, y >= 0, y < 5, between(0,4, x), between(0,4,y), x = 3, y = 3.
dirt(x, y, green) :- x >= 0, x < 5, y >= 0, y < 5, between(0,4, x), between(0,4,y), x = 5, y = 1.
dirt(x, y, orange) :- x >= 0, x < 5, y >= 0, y < 5, between(0,4, x), between(0,4,y), x = 6, y = 4.
agent(id, x, y, orange) :- x >= 0, x < 5, y >= 0, y < 5, between(0,4, x), between(0,4,y), x = 4, y = 0.
agent(id, x, y, green) :- x >= 0, x < 5, y >= 0, y < 5, between(0,4, x), between(0,4,y), x = 5, y = 7.

wall(x, y, west) :- x > 0, x < 5, y >= 0, y < 5 , between(0,4,x).
wall(x, y, north) :- x >= 0, x < 5, y > 0, y < 5 , between(0,4,y).
wall(x, y, east) :- x > 0, x < 5, y >= 0, y < 5 , between(0,4,x).
wall(x, y, south) :- x >= 0, x < 5, y > 0, y < 5 , between(0,4,y).