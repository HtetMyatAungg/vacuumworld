grid_size(9).
grid(X, Y) :- X >= 0, X < 9, Y >= 0, Y < 9.
dirt(X, Y, Colour) :-
    X >= 0, X < 9, Y >= 0, Y < 9,
    Colour = 'orange' | Colour = 'green'.
agent(Id, X, Y, Colour) :-
    X >= 0, X < 9, Y >= 0, Y < 9,
    Id = '9af04778-08d6-4e40-8c6f-ba123d292a22' | Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
empty(X, Y) :-
    X >= 0, X < 9, Y >= 0, Y < 9.

wall(X, Y, west) :-
    X = 0, Y >= 0, Y < 9.
wall(X, Y, south) :-
    Y = 0, X >= 0, X < 9.
wall(X, Y, east) :-
    X = 8, Y >= 0, Y < 9.
wall(X, Y, north) :-
    Y = 8, X >= 0, X < 9.