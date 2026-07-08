edge(X, Y, Dir) :-
    X >= 0,
    X < 7,
    Y >= 0,
    Y < 7,
    (
        (Dir = 'north') -> Y > 0
    ),
    (
        (Dir = 'south') -> Y < 6
    ),
    (
        (Dir = 'east') -> X < 6
    ),
    (
        (Dir = 'west') -> X > 0
    ).

wall(X, Y, Dir) :-
    edge(X, Y, Dir).

grid(X, Y) :-
    X >= 0,
    X < 7,
    Y >= 0,
    Y < 7.