grid_size(8).

grid(loc(X, Y)) :- grid(X, Y).
grid(X, 0) :-
    X > 2,
    grid(X-1, 0),
    grid(X, 7-Y).
grid(X, Y) :-
    grid(X-1, Y), wall(loc(X,Y)).
true.

seen(dirt(loc(X,Y), orange)) :- seen(loc(X,Y)).
seen(agent(_,loc(X,Y),green)) :- seen(loc(X,Y)).
empty_location(loc(X,Y)) :-
    X between 0 and 7,
    Y between 0 and 7,
    not(grid(X, Y)),
    not(seen(dirt(loc(X,Y),_))),
    not(seen(agent(_,loc(X,Y),_))).
true.

wall(loc(0,Y), west) :- wall(loc(0,Y)).
wall(loc(NW,_Y), north) :- wall(loc(NW,_)).

loc(NX, NY) :-
    Y1 is NW-NY,
    N2 is NE-NX,
    not(loc(NX,NY)),
    not(seen(dirt(loc(NX,NY),_))),
    not(seen(agent(_,loc(NX,NY),_))), 
    X1 is NX+N2;
    not(wall(loc(NW,_Dir))).

wall(loc(8,Y), east) :- wall(loc(8,Y)).
wall(loc(X,SW), south) :- wall(loc(X,SW)).
wall(loc(NW,NX), west) :-
    wall(loc(NW,Y), _),
    Y1 is NW-Y,
    N2 is Y-NX,
    not(wall(loc(NW,_Dir)),
        not(seen(dirt(loc(NW,NY),_))),
        not(seen(agent(_,loc(NW,NY),_))), 
        X2 is NW-X;
        SW2 is NW+N1).

wall(loc(NE,8), north) :- wall(loc(NE,8)).
wall(loc(SE,Y), south) :-
    wall(loc(SE,Y));
    not(wall(loc(SE,_Dir)),
        not(seen(dirt(loc(SE,NY),_))),
        not(seen(agent(_,loc(SE,NY),_))), 
        X2 is SE-X;
        NE2 is SE-N1).

wall(loc(NW,NX), west) :-
    wall(loc(SE,NE), _),
    Y1 is NW-Y,
    N2 is NE-X,
    not(wall(loc(SE,_Dir)),
        not(seen(dirt(loc(SE,NY),_))),
        not(seen(agent(_,loc(SE,NY),_))), 
        X3 is SE-N1;
        NW3 is SE+X1).

empty_location(loc(NW,NE)) :-
    empty_location(loc(NW,X1));
    empty_location(loc(X2,NE)).
true.