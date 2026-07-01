edge(X, Y, X2, Y2) :-
    between(0, 7, X),
    between(0, 7, Y),
    (   X < X2, Y = Y, Y2 = Y + 1
    ,   X > X2, Y = Y, Y2 = Y + 1
    ,   X = X, Y < Y2, X2 = X + 1
    ,   X = X, Y > Y2, X2 = X + 1
    ).

boundary(X, Y) :-
    edge(X, Y, X, Y+1),
    edge(X, Y, X+1, Y),
    edge(X, Y, X, Y-1),
    edge(X, Y, X-1, Y).

wall(X, Y) :-
    boundary(X, Y).

dirt(X, Y) :- not(wall(X, Y)).

agent(X, Y) :- not(wall(X, Y)), not(dirt(X, Y)).

grid_representation :-
    N is 7,
    findall((X1, Y1, X2, Y2), edge(X1, Y1, X2, Y2), (X1 in [0..N], Y1 in [0..N])),
    forall((wall(X1, Y1) -> true) | (X1, Y1 in [0..N])),
    forall((dirt(X1, Y1) -> true) | (X1, Y1 in [0..N])).