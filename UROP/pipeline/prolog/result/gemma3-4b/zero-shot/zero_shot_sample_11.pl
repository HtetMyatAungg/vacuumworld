edge(X, Y, Dir) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    Dir = north,
    (X = 0, Y >= 0, Y < 8).

edge(X, Y, Dir) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    Dir = west,
    (X = 0, Y >= 0, Y < 8).

edge(X, Y, Dir) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    Dir = south,
    (Y = 7, X >= 0, X < 8).

edge(X, Y, Dir) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    Dir = east,
    (X = 7, Y >= 0, Y < 8).

boundary(X, Y, West) :-
    X = 0,
    Y >= 0,
    Y < 8.

boundary(X, Y, South) :-
    Y = 7,
    X >= 0,
    X < 8.

boundary(X, Y, East) :-
    X = 7,
    Y >= 0,
    Y < 8.

boundary(X, Y, North) :-
    Y = 0,
    X >= 0,
    X < 8.

grid(N) :-
    N > 0.

agent_id(Id) :-
    atom_number(Id, _, Num), Num > 0.

dirt_present(X, Y, Color) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    (Color = black).

walls_present(X, Y) :-
    edge(X, Y, West).
walls_present(X, Y) :-
    edge(X, Y, South).
walls_present(X, Y) :-
    edge(X, Y, East).
walls_present(X, Y) :-
    edge(X, Y, North).