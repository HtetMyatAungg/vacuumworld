edge(X, Y, 'north') :-
    Y = 0,
    X >= 0,
    X < N.
edge(X, Y, 'south') :-
    Y = N - 1,
    X >= 0,
    X < N.
edge(X, Y, 'east') :-
    X = N - 1,
    Y >= 0,
    Y < N.
edge(X, Y, 'west') :-
    X = 0,
    Y >= 0,
    Y < N.

boundary(X, Y, 'north') :-
    X == 0,
    Y >= 0,
    Y < N.
boundary(X, Y, 'south') :-
    X == N - 1,
    Y >= 0,
    Y < N.
boundary(X, Y, 'east') :-
    X == N - 1,
    Y >= 0,
    Y < N.
boundary(X, Y, 'west') :-
    X == 0,
    Y >= 0,
    Y < N.

grid(N) :-
    N > 0,
    N >= 1.

cell(X, Y) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N.

wall(X, Y, Dir) :-
    edge(X, Y, Dir).

agent_id(ID) :-
    str(ID) = '9af04778-08d6-4e40-8c6f-ba123d292a22'.
agent_id(ID) :-
    str(ID) = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.

colour(Colour) :-
    str(Colour) = 'orange'.
colour(Colour) :-
    str(Colour) = 'green'.