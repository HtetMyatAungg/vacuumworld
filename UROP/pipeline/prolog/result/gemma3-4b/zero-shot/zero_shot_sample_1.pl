edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    [Dir].

boundary(X, Y, North) :-
    X >= 0,
    X < N,
    Y = 0.

boundary(X, Y, South) :-
    X >= 0,
    X < N,
    Y = N - 1.

boundary(X, Y, West) :-
    X = 0,
    Y >= 0,
    Y < N.

boundary(X, Y, East) :-
    X = N - 1,
    Y >= 0,
    Y < N.

/*
grid(N) :-
    N > 0,
    N1 is N + 1,
    findall(Edge, edge(X, Y, Dir), (X in [0..N1-1], Y in [0..N1-1], Dir in ['north', 'south', 'east', 'west'])),
    sort(Edge).
*/