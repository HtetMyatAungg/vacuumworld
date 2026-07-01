grid_size(10).

% Section A — Translation facts:
grid(loc(X, Y)) :-
    X between 0, 9,
    Y between 0, 9.

seen(dirt(loc(X, Y), Color)) :-
    findall((X, Y, Color), {entry(_Id, _Percept, [X, Y], dirt(Color)), grid(loc(X, Y))}, SeenDirts),
    maplist(grid_dirt_seen, SeenDirts).

seen(agent(Id, loc(X, Y), Color)) :-
    entry(Id, _Percept, X, Y, agent(Id, Color)),
    grid(loc(X, Y)).

empty_location(loc(X, Y)) :-
    \+ seen(agent(_, _, _)),
    \+ seen(dirt(_)),  
    grid(loc(X, Y)).  

% Section B — Wall rules:
walk(loc(X1,Y1), north(loc(X2,Y1))) :- X1 = X2,
                                          Y1 < Y2.

walk(loc(X1,Y1), south(loc(X2,Y1))) :- X1 = X2,
                                           Y1 > Y2.

walk(loc(X1,Y1), east(loc(X1,Y2)))  :- Y1 = Y2,
                                            X1 < X2.

walk(loc(X1,Y1), west(loc(X2,Y1)))  :- Y1 = Y2,
                                            X1 > X2.