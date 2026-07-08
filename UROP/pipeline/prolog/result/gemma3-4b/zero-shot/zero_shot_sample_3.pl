edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    (
        (Dir == 'north') -> Y > 0
    ),
    (
        (Dir == 'south') -> Y < N - 1
    ),
    (
        (Dir == 'east') -> X < N - 1
    ),
    (
        (Dir == 'west') -> X > 0
    ).

edge(X, Y, 'north') :-
    X >= 0,
    X < N,
    Y > 0.

edge(X, Y, 'south') :-
    X >= 0,
    X < N,
    Y < N - 1.

edge(X, Y, 'east') :-
    X < N,
    Y >= 0,
    X < N - 1.

edge(X, Y, 'west') :-
    X > 0,
    Y >= 0,
    X > 0.

edge(X, Y, 'north') :- X >= 0, X < N, Y > 0.
edge(X, Y, 'south') :- X >= 0, X < N, Y < N - 1.
edge(X, Y, 'east') :- X < N, Y >= 0, X < N - 1.
edge(X, Y, 'west') :- X > 0, Y >= 0, X > 0.

edge(0, 0, 'north') :- true.
edge(0, 0, 'west') :- true.
edge(N-1, N-1, 'east') :- true.
edge(N-1, N-1, 'south') :- true.

edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Dir = north | south | east | west,
    (
        X > 0
    ), 
    (
        X < N - 1
    ),
    (
        Y > 0
    ),
    (
        Y < N - 1
    ),
    (
        edge(X, Y, Dir)
    ).