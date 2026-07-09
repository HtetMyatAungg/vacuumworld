grid_size(8).
grid(x, y) :- x > 0, x < 8, y > 0, y < 8.
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 2 && y == 0 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 1 && y == 1 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 2 && y == 1 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 0 && y == 3 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 1 && y == 3 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 2 && y == 3 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 0 && y == 2 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 1 && y == 2 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 2 && y == 2 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 0 && y == 1 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 1 && y == 1 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 2 && y == 1 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 0 && y == 0 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 1 && y == 0 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 2 && y == 0 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 0 && y == 7 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 1 && y == 7 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 2 && y == 7 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 0 && y == 6 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 1 && y == 6 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 2 && y == 6 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 0 && y == 5 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 1 && y == 5 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 2 && y == 5 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 0 && y == 4 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 1 && y == 4 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 2 && y == 4 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 3 && y == 0 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 3 && y == 1 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 3 && y == 2 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 3 && y == 3 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 3 && y == 4 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 3 && y == 5 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 3 && y == 6 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 3 && y == 7 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 4 && y == 5 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 4 && y == 6 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 4 && y == 7 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 4 && y == 4 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 4 && y == 3 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 4 && y == 2 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 4 && y == 1 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 4 && y == 0 && color = 'white').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 5 && y == 0 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 5 && y == 1 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 5 && y == 2 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 5 && y == 3 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 5 && y == 4 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 5 && y == 5 && color = 'orange').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 5 && y == 6 && color = 'green').
dirt(x, y, color) :- x >= 0, x < 8, y >= 0, y < 8, (x == 5 && y == 7 && color = 'orange').

agent(id, x, y, color) :- x > 0, x < 8, y > 0, y < 8.
empty(x,y) :- x >= 0, x < 8, y >= 0, y < 8.