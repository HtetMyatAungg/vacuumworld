grid_size(8).
grid(x, y) :- x > 0 , x < 8, y > 0 , y < 8.
dirt(x, y, colour) :-
    x >= 0, x < 8,
    y >= 0, y < 8,
    colour = 'orange' | colour = 'green'.
agent(id, x, y, colour) :-
    x >= 0, x < 8,
    y >= 0, y < 8,
    id = '9af04778-08d6-4e40-8c6f-ba123d292a22' | id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',
    colour = 'orange' | colour = 'green'.
empty(x, y) :-
    x >= 0, x < 8,
    y >= 0, y < 8.
wall(x, y, west) :-
    x = 0, y >= 0, y < 8.
wall(x, y, north) :-
    y = 0, x >= 0, x < 8.
wall(x, y, east) :-
    x = 7, y >= 0, y < 8.
wall(x, y, south) :-
    y = 7, x >= 0, x < 8.