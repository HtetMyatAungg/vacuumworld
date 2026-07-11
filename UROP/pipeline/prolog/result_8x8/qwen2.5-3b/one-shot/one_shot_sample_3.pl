grid_size(8).

grid(X,Y) :-
    between(0,7,X),
    between(0,7,Y).

dirt(X,Y, Colour) :-
    grid(X,Y),
    \+ agent(_Id,X,Y,_Colour),
    \+ walldir(south,S,LonLarg),
    \+ grid(X-1,Y),
    \+ grid(X+1,Y),
    \+ grid(X,Y-1),
    \+ grid(X,Y+1).

agent(Id,X,Y,Colour) :-
    grid(X,Y),
    not(dirt(X,Y,_)),
    not(walldir(south,S,LonLarg)),
    not(grid(X-1,Y)),
    not(grid(X+1,Y)),
    not(grid(X,Y-1)),
    not(grid(X,Y+1)).

empty(X,Y) :-
    grid(X,Y).

walldir(n,s,W,E) :-
    \+ (\+ W ; E).
walldir(n,n,W,NxSmall) :-
    \+ (W = n ; NxSmall is X + 1),
    grid(NxSmall,Y), not(grid(NxSmall-1,Y)),
    \+ walldir(s,w,LonLarg).

walldir(s,n,S,W,NxLarge) :-
    \+ (W = s ; NxLarge is X - 1),
    grid(X,NxLarge), not(grid(X,NxLarge+1)),
    \+ walldir(n,s,E,LonLarg).

wall(0,Y,W,E).
walldir(s,n,W,LongLarge) :-
    \+ (W = n ; LongLarge is Y + 1),
    grid(X,LongLarge), not(grid(X,LongLarge-1)).

walldir(W,S,NxSmall,NxLarge) :-
    \+ (S = s ; NxSmall is X - abs(Y-Ny)),
    \+ (W = n ; S = s; nxSmall in [X,X-abs(Y-Nr)]),
    not(grid(NxSmall,Y)), not(grid(NxLarge,Y)),

lon_small(1,is).