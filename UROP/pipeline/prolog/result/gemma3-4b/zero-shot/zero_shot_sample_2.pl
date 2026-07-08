edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    (
        (X == 0, Y == 0, Dir == 'north', Dir2 == 'west')
    ;
        (X == N - 1, Y == 0, Dir == 'east', Dir2 == 'north')
    ;
        (X == 0, Y == N-1, Dir == 'south', Dir2 == 'west')
    ;
        (X == N - 1, Y == N-1, Dir == 'south', Dir2 == 'east')
    ;
        (X == X, Y == Y, Dir == Dir)
    ).

edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    (
        (X == 0, Y == Y, Dir == 'west')
    ;
        (X == X, Y == N - 1, Dir == 'east')
    ;
        (X == X, Y == 0, Dir == 'north')
    ;
        (X == N - 1, Y == Y, Dir == 'south')
    ;
        (X == 0, Y == 0, Dir == 'west')
    ;
       (X == 1, Y == 0, Dir == 'north')
    ;
        (X == 0, Y == 1, Dir == 'west')
    ).

edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    (
       (X == X, Y == Y, Dir == Dir)
    ).

edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
   (
       (X == X, Y == Y, Dir == Dir)
    ).

edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
     (
       (X == X, Y == Y, Dir == Dir)
    ).

edge(X, Y, Dir) :-
   X >= 0, X < N, Y >= 0, Y < N, Direction == Dir.

edge(X, Y, Dir) :-
   X >= 0, X < N, Y >= 0, Y < N, Direction == Dir.

edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Dir == 'north'
;
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Dir == 'south'
;
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Dir == 'east'
;
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Dir == 'west'.
    

% Grid dimensions (example - adapt to actual size)
N := 8.