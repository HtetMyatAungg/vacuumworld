grid_size(8).
grid(x, y) :- x > 0 && x <= 8 , y > 0 && y <= 8 .
dirt(x, y, color) :- x > 0 && x <= 8 , y > 0 && y <= 8 , color = 'green' || color = 'orange'.
agent(id, x, y, color) :- x > 0 && x <= 8 , y > 0 && y <= 8 , id = '9af04778-08d6-4e40-8c6f-ba123d292a22' || color = 'white' || color = 'green' || color = 'orange'.
empty(x, y) :- x > 0 && x <= 8 , y > 0 && y <= 8 .

wall(x, y, north) :- x > 0 && x <= 8, y = 0.
wall(x, y, south) :- x > 0 && x <= 8, y = 7.
wall(x, y, west) :- y > 0 && y <= 8, x = 0.
wall(x, y, east) :- y > 0 && y <= 8, x = 7.
