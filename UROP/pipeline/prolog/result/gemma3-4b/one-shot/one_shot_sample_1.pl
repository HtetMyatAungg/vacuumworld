grid_size(8).
grid(x, y) :- x > 0, x < 8, y > 0, y < 8.
dirt(x, y, colour) :- x > 0, x < 8, y > 0, y < 8,  x = 3, y = 2, colour = 'orange'.
dirt(x, y, colour) :- x > 0, x < 8, y > 0, y < 8,  x = 5, y = 1, colour = 'green'.
dirt(x, y, colour) :- x > 0, x < 8, y > 0, y < 8,  x = 7, y = 0, colour = 'orange'.
agent(id, x, y, colour) :- x > 0, x < 8, y > 0, y < 8, id = '9af04778-08d6-4e40-8c6f-ba123d292a22',  colour = 'green'.
agent(id, x, y, colour) :- x > 0, x < 8, y > 0, y < 8, id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',  colour = '