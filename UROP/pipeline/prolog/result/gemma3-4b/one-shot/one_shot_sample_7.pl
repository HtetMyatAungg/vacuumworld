grid_size(8).
grid(x, y) :- x > 0, x < 8, y > 0, y < 8.
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, color = 'green' ;
                       x >= 0, x < 8, y >= 0, y < 8, color = 'orange'.
agent(id, x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, id = '9af04778-08d6-4e40-8c6f-ba123d292a22', color = 'orange' ;
                         x >= 0, x < 8, y >= 0, y < 8, id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', color = 'green'.
empty(x, y) :- x >= 0, x < 8, y >= 0, y < 8.

wall(x, y, north) :- x >= 0, x < 8, y == 7 ;
                   x >= 0, x < 8, y == 6 ;
                   x >= 0, x < 8, y ==