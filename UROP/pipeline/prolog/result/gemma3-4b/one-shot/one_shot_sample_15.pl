grid_size(8).
grid(X,Y) :- X > 0, X < 8, Y > 0, Y < 8 .
dirt(X,Y,color) :-
    X >= 0, X < 8,
    Y >= 0, Y < 8,
    color like('orange').
agent(id,X,Y,color) :-
    X >= 0, X < 8,
    Y >= 0, Y < 8,
    id = '9af04778-08d6-4e40-8c6f-ba123d292a22',
    color like('green').
empty(X,Y) :-
    X >= 0, X < 8,
    Y >= 0, Y < 8.

wall(X,Y,north) :-
    X >= 0, X < 8,
    Y = 7.
wall(X,Y,south) :-
    X >= 0, X < 8,
    Y = 0.
wall(X,Y,west) :-
    X = 0, Y >= 0, Y < 8.
wall(X,Y,east) :-
    X = 7, Y >= 0, Y < 8.