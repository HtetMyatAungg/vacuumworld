edge(X, Y) :- between(0, 7, X), between(0, 7, Y).
wall(X, Y, Direction) :-
    between(0, 7, X),
    between(0, 7, Y),
    (   X = 0, Direction = 'west'
    ;   X = 7, Direction = 'east'
    ;   Y = 0, Direction = 'south'
    ;   Y = 7, Direction = 'north'
    ;   X = 3, Y = 7, Direction = 'east'
    ;   X = 0, Y = 0, Direction = 'south').
dirt(X, Y) :- between(0, 7, X), between(0, 7, Y),
    (   X = 0, Y = 0
    ;   X = 2, Y = 6
    ;   X = 0, Y = 7
    ;   X = 1, Y = 7
    ;   X = 2, Y = 7
    ;   X = 0, Y = 5
    ;   X = 1, Y = 5
    ;   X = 2, Y = 5
    ;   X = 0, Y = 4
    ;   X = 1, Y = 4
    ;   X = 2, Y = 4
    ;   X = 0, Y = 3
    ;   X = 1, Y = 3
    ;   X = 2, Y = 3
    ;   X = 0, Y = 2
    ;   X = 1, Y = 2
    ;   X = 2, Y = 2
    ;   X = 0, Y = 1
    ;   X = 1, Y = 1
    ;   X = 2, Y = 1
    ;   X = 5, Y = 0
    ;   X = 5, Y = 1
    ;   X = 5, Y = 2
    ;   X = 5, Y = 3
    ;   X = 5, Y = 4
    ;   X = 5, Y = 5
    ;   X = 5, Y = 6
    ;   X = 5, Y = 7
    ;   X = 6, Y = 5
    ;   X = 6, Y = 6
    ;   X = 6, Y = 7
    ;   X = 6, Y = 4
    ;   X = 6, Y = 3
    ;   X = 6, Y = 2
    ;   X = 6, Y = 1
    ;   X = 6, Y = 0
    ;   X = 7, Y = 0
    ;   X = 7, Y = 1
    ;   X = 7, Y = 2
    ;   X = 7, Y = 3
    ;   X = 7, Y = 4
    ;   X = 7, Y = 5
    ;   X = 7, Y = 6
    ;   X = 7, Y = 7
    ).