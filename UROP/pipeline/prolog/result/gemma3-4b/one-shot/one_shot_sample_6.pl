grid_size(8).
grid(x, y) :- x > 0, x < 8, y > 0, y < 8.
dirt(x, y, color) :- x > 0, x < 8, y > 0, y < 8, between(1, 8, x), between(1, 8, y), (color = 'green' , x = 3, y = 7).
dirt(x, y, color) :- x > 0, x < 8, y > 0, y < 8, between(1, 8, x), between(1, 8, y), (color = 'orange' , x = 6, y = 4).
dirt(x, y, color) :- x > 0, x < 8, y > 0, y < 8, between(1, 8, x), between(1, 8, y), (color = 'orange' , x = 7, y = 7).
agent(id, x, y, color) :- x > 0, x < 8, y > 0, y < 8, id = '9af04778-08d6-4e40-8c6f-ba123d292a22', color = 'green', between(1, 8, x), between(1, 8, y).