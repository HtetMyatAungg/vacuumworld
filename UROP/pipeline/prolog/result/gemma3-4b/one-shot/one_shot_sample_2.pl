grid_size(8).
grid(x, y) :- x > 0 , x < 8, y > 0, y < 8 .
dirt(x, y, color) :- x > 0, x < 8, y > 0, y < 8, color = 'green' .
dirt(x, y, color) :- x > 0, x < 8, y > 0, y < 8, color = 'orange' .

agent(id, x, y, color) :- x > 0, x < 8, y > 0, y < 8, id like '_*'.
agent(id, x, y, color) :- x > 0, x < 8, y > 0, y < 8, color = 'white' .
agent(id, x, y, color) :- x > 0, x < 8, y > 0, y < 8, color = 'green' .

empty(x, y) :- x > 0, x < 8, y > 0, y < 8 .

wall(x, y, north) :- x > 0, x < 8, y = 0 .
wall(x, y, south) :- x > 0, x < 8, y = 7 .
wall(x, y, west) :- y > 0, y < 8, x = 0 .