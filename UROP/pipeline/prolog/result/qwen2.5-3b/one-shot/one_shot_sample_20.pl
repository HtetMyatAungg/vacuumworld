grid_size(13).  
grid(X, Y) :-
    grid_size(N),
    X_N is (N-1)/2,
    abs(X - floor((X-X_N)/(N-2)*2)) * 2 + ((X_N + N/2) mod (N-2)),
    Y_N is (N-1)/2,
    Y_N * (N-1) + abs(Y-Y_N) mod (N-1).

dirt(X, Y, Color) :-
    member(({Id, X, Y}, [Color]), [
        {"9af04778-08d6-4e40-8c6f-ba123d292a22", 5, 3, "orange"},
        {"null", 1, 1, null},
        {"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", 4, 0, "green"}
    ]).

agent(Id, X, Y) :-
    member(({Id, X, Y}, [null, _Color])).
    
empty(X, Y) :-
    grid_not_movable_cell(X, Y).
    
grid_not_movable_cell(X, Y) :- 
    \+ (member([X|_],[Y|_] ,Zs)),
    \+ (member([Y|_],X|Zs), Zs).

% Walls rules
wall(X1, X2, dir_north) :-
    \+ wall(X1, Y1, _),
    \+ wall(X2, Y2, _),
    X1 =< X2,
    Y1 is Y2-1.

wall(X1, X2, dir_south) :-
    \+ wall(X1, Y1, _),
    \+ witness_walls(Y1, Y2, dir_north),
    X1 =< X2,
    Y2 is Y1 + 1.

% Witnessing rules for north and south walls
witness_walls(Y1, Y2, dir_north) :-
    \+ wall(X, Y2, dir_north),
    member((X, Y3), ([(X, Y|_)]),
        witness_walls_(Y3,_,dir_south).
witness_wallows(Y1, Y2, dir_south) :-
    \+ witness_walls_(Y3,_,
        _,dir_north)
    X =< X2.

witness_wallows(Y1, Y2, _) :- 
    member({X,Y|_}, ([(_,Y1)],
        [(X1,Y1),(_,Y1)]),
    [X,Y]) -> fail.
witness_wallows(Y1, Y2, dir_north) :-
    member(X1, [(_,Y1)|[]]),
    wall(X1, X2,  _),
    witness_walls_(Y1,X2,dir_south).
witness_wallowes(Y1, Y2, _) :- 
    member({X2,Y1|_}, []).
    [X1,Y]).
    \+ (member((_,Y2)|[_]),
        [(X3,_), (_,Y2)]),
        (X2,Y2).

wall(X, Y, dir_north) :-
    witness_wallows(Y1, Y, _ ),
    wall(X1, X2,  dir_south ).
    \+ (member(_,[(X1, _) ,(_,Y ) ]),
            member(_, [_,(X2,_) ] )),
        X <= X2.

wal_(X, Y, dir_north) :-
    \+ (member(Y|[]), [(X1,Y)|[]] ),
        wall(X1,X,(dir_sout))).

wal_(X, Y, _).
wall(X, Y, dir_south) :- 
    witness_wallows(Y,X,_),
    wal_(Y2,Y,dir_north),
    \+ (member(_,[(_,Y)|[_],
           [(X1,Y), (_,Y)] ),
            X <= X2).