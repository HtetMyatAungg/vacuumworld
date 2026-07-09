edge(X, Y) :- between(0, N), X == Y.
edge(X, Y) :- between(0, N), X \== Y.

grid(N) :-
    N > 0,
    integer(N).

cell(X, Y) :-
    between(0, N),
    X >= 0,
    X < N,
    between(0, N),
    Y >= 0,
    Y < N.

wall(X, Y, Direction) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Direction = west | Direction = east | Direction = north | Direction = south.

agent(X, Y, Id, Colour) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',
    Colour = 'green'.

agent(X, Y, Id, Colour) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Id = '9af04778-08d6-4e40-8c6f-ba123d292a22',
    Colour = 'orange'.

dirt(X, Y, Colour) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Colour = 'orange' | Colour = 'green' | Colour = 'null'.

/*
cell(X, Y, W, D, A) :-
    edge(X, Y),
    wall(X + dx, Y, W),
    dirt(X + dx, Y, D),
    agent(X + dx, Y, A).
*/

