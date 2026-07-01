edge(X, Y, Direction) :-
    between(0, N, X),
    between(0, N, Y),
    (   X = 0, Y = 0 -> Direction = northwest
    ,   X = 0, Y = N -> Direction = northeast
    ,   X = N, Y = 0 -> Direction = southwest
    ,   X = N, Y = N -> Direction = southeast
    ).

wall(X, Y) :-
    between(0, N, X),
    between(0, N, Y),
    (   X == 0 ; X == N  -> northwest_wall(Y)
    ,   Y == 0 ; Y == N -> southwest_wall(X)
    ).



northwest_wall(Y) :-
    Y > 0.

southwest_wall(X) :-
   X > 0.


north_wall(Y) :- 
   Y == 0.

south_wall(Y) :-
     Y == N.

east_wall(X) :-
   X == N.

west_wall(X) :-
   X == 0.

boundary(X, Y) :-
    edge(X, Y, Direction),
    (   Direction = northwest ->  north_wall(Y);
        Direction = northeast -> east_wall(X);
        Direction = southwest -> south_wall(Y);
        Direction = southeast -> south_wall(Y)).