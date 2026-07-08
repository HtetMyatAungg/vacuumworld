grid(X,Y,Observed) :-
    findall({X,Y,Obs}, (
        {Coord, Walls, Dirt, Agent} = Obs,
        Coord = [X,Y],
        member(Obs, [
            {0,6,[west],null,null},
            {1,6,null,null,null},
            {2,6,null,null,null},
            ...
            {7,7,[east,south],null}
        ]
    ), L),
    setof({Obs}, _{Obs}^(L,\+member(Obs,L)), [Obs|_]),
    true.

walls(WestEast,NorthSouth) :-
    findall(({X,Y,O,D,A},{N,S}), (
        ({Coord, Walls, Dirt, Agent} = Obs,
         Coord = [X,Y],
         N is X + 1,
         S is Y + 1,
         W is X - 1,
         E is X + 1
    ),
    Walls \= [],
    wallsNorthSouth(N,S,W,E),
    wallsWestEast(W,N,E,S,L,Obs)
    ), _).

wallsNorthSouth(NorthSouth) :-
    findall(({X,Y,O,D,A},{W,E}), (
        ({Coord, Walls, Dirt, Agent} = Obs,
         Coord = [X,Y],
         W is X - 1,
         E is X + 1
    ),
    west(W,X,S),
    wallsNorth(NorthSouth,N,W) \= [],
    east(E,X,W)
    ), _).

west(X,L,R,S) :- L,\=R.\=S.
east(X,L,R,S) :- R,\=L.\=S.