grid_size(8).

grid(loc(X,Y)) :-
    X between 0, 7,
    Y between 0, 7.

seen(dirt(loc(X,Y), green)) :-
    seen(agent(Id,Y,X)).

seen(dirt(loc(X,Y,_))) :-
    not(grid(loc(X,Y))), 
    \+ seen(agent(_Id,X,Y)),
    Dict = dict:from_list([]),
    get_walls(Dict, Wails),    
    (   memberchk(dir(zigzag(east)), Wails)
    -> seen(agent(Id,Y,X))
    ;   true
    ).

seen(dirt(loc(X,_Y), orange)) :-
    X > 0,
    \+ seen(dirt(loc(Y,_))),
    Dict = dict:from_list([]),
    get_walls(Dict, Wails),
    (memberchk(dir(zigzag(east)), Wails) -> grid(loc(_,X)), seen(agent(Id,Y,X)); true).

seen(empty_location(loc(X,Y))) :-
    \+ grid(loc(X,Y)),
    not(seen(dirt(loc(X,_Y), _))), 
    Dict = dict:from_list([]),
    get_walls(Dict, Wails),
    (memberchk(dir(zigzag(east)), Wails) -> seen(agent(_Id,X,Y)) ; true).

wall(loc(X1,Y,north)) :-
    grid(loc(X1,_)),
    Y > 0.

walk(loc(9,Y,south)) :-
    grid(loc(_,Y)),
    \+ walk(loc(X2,Y,south)), 
    findall(walks, memberchk(dir(X), walks), Wails),
    (   memberchk(dir(north), Wails) -> true ; false).

walk(loc(X1,X2,south)) :-
    Y < 7,
    grid(loc(X1,X2)),
    \+ walk(loc(X3,Y,south)), 
    findall(walks, memberchk(dir(X), walks), Wails),
    (   memberchk(dir(south), Wails) -> true ; false).

walk(loc(X1,X2,east)) :-
    X1 bmod 3 =:= 0,
    grid(loc(X1,X2)),
    \+ walk(loc(X3,X2,east)), 
    findall(walks, memberchk(dir(Y), walks), Wails),
    (   memberchk(dir(east), Wails) -> true ; false).

empty_location(loc(X1,Y)) :-
    not(grid(loc(X1)), 
        grid(loc(Y)),
        findall(walks, walk(WellLoc,n), WalksPos),
        \+ seen(dirt(loc(_,Y))), 
        (seen(dirt(loc(0,Y))) -> true ; false).

see_wallows(Dict, SeenWalls) :-
    Dict = dict:from_list([]),
    findall(walk(Wellloc,Y), walk(WellLoc,n), WalksPos),
    append(_, SeenWails, Wails).