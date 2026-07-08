domain(N, X, Y) :-
    N > 0,
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    true.

edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    (
        X == 0,
        Dir = north
    ),
    (Y == 0),
        Dir = north,
    (
        X == N - 1,
        Dir = east
    ),
    (
        Y == N - 1,
        Dir = south
    ),
    (
        X == 0,
        Dir = west
    ),
    (
        Y == N - 1,
        Dir = south
    ).

walls(X, Y) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N.

agent(X, Y) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N.

dirt(X, Y) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N.