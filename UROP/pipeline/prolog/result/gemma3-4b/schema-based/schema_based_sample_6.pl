grid_size(9).
grid(x, y) :- x > 0, x < 9, y > 0, y < 9.
dirt(x, y, colour) :-
    x >= 0, x < 9, y >= 0, y < 9,
    colour = 'orange' | colour = 'green'.
agent(id, x, y, colour) :-
    x >= 0, x < 9, y >= 0, y < 9,
    id = '9af04778-08d6-4e40-8c6f-ba123d292a22' | id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
empty(x, y) :-
    x >= 0, x < 9, y >= 0, y < 9.

wall(x, y, west) :-
    x = 0, y >= 0, y < 9.
wall(x, y, north) :-
    y = 0, x >= 0, x < 9.
wall(x, y, east) :-
    x = 8, y >= 0, y < 9.
wall(x, y, south) :-
    y = 8, x >= 0, x < 9.
wall(x, y, west) :-
   x = 0, y >= 0, y < 9.
wall(x, y, north) :-
   y = 0, x >= 0, x < 9.
wall(x, y, east) :-
    x = 8, y >= 0, y < 9.
wall(x, y, south) :-
    y = 8, x >= 0, x < 9.