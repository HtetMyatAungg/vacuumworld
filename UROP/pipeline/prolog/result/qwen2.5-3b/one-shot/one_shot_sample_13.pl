Section A — Translation facts:
grid_size(12).
grid(loc(X,Y)) :-
    X >= 0,
    Y >= 0,
    X < 13,
    Y < 13.

seen(dirt(loc(X,Y), _)) :- grid(loc(X,Y)), \+ seen(agent(_Id, loc(X,Y), _Colr)).
seen(dirt(loc(0,Y), o)). 
seen(dirt(loc(X,0), g)).
empty_location(loc(X,Y)) :-
    \+ seen(_loc(X,Y,_)),
    \+ seen(dirt(loc(X,Y)_)),
    \+ seen(agent(_Id, loc(X,Y),_Colr)).

Section B — Wall rules:
wall(south, _).
wall(east, _).
wall(north, _).
wall(west, _)