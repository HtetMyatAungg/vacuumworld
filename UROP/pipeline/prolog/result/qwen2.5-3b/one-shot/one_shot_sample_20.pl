grid_size(12)

grid(X,Y) :-
    -(X < 0; X =< 11; Y < 0; Y =< 11), grid(X,Y).

dirt(X,Y,Colour) :-
    \+ agent(_Id,X,Y), \+ (wall(WallType,East,North)), 
    (Y > 0,\+wall(East,Y-1,_); wall(North,Y,_)),
    (X < 11,\+wall(East,X+1,_); wall(WallType,X,_)),
    dirt(X,Y,Colour).

agent(Id,X,Y,Colour) :-
    \+ agent(_Id,X2,Y2), atom_concat('_Id', Id),
    (Y > 0,\+wall(North,Y-1,_); wall(_,Y,North)),
    (X < 11,\+wall(East,X+1,_); wall(WallType,X,North)),
    atom_concat('_', Id, X2),

dirt(X,Y,Colour) :-
    \+ agent(_Id,X,Y), \+ wall(_WallType,_East,_North),
    grid(X,Y), nonvar(Colour),
    dirt(X,Y,Colour).

empty(X,Y) :-
    atom_concat(XY, _, Y),
    integer(XY),
    (X < 0;\+grid(X,Y); X > 11; \+grid(X,Y)),

wall(North,East,WallType) :-
    !(N>S,C\=WallType), !,
    grid(?,?),
    North != S, East != W;

    (!,!).

wall(W,N,S) :-
    grid(?, ?),
    N < WallType; N =< (WallType-1),

    ( (S<E;grid(N,?),N:=WallType,W=N); SE>E), \+ wall(E,N,WallType);

    !,

    grid(?,_), S <= E,
    !(N>W,C\=wall(W,N,S)), !;

    !.

wall(North,East) :-
    grid(?,_), E < North; E =< (North-1),

    grid(?,?),
    \+ wall(East,North,?).

wall(_East,North,WallType) :-
    grid(?, _), S > North,
    !(N<WallType,C\=wall(North,S,WallType)),!;

    !.