grid_size(9).

grid(loc(X, Y)) :-
    X in 0..7,
    Y in 0..7.

empty_location(loc(X, Y)) :-
    \+ seen(dirt(_X, _Y)),
    \+ seen(agent(_, _, _Colour)),
    grid(loc(X, Y)),
    X #\= 0,
    X #\= 8,
    Y #\= 0,
    Y #\= 8.

seen(dirt(loc(X, Y)), dirt(loc(X, Y))). 

seen(agent(Id, loc(X, Y), Colour), agent(Id, Colour, loc(X, Y))). 

empty_location(loc(X, Y)) :-
    \+ seen(dirt(_X, _Y)),
    \+ seen(agent(_, _, _Colour)),
    grid(loc(X, Y)),
    X #\= 0,
    X #\= 8,
    Y #\= 0,
    Y #\= 8.

wall(side(north), loc(0, _Y)).

wall(side(south), loc(_X, 8, _Y)).

wall(side(west), loc(_, 0, _Y)).

wall(side(east), loc(_, 8, _Y)).