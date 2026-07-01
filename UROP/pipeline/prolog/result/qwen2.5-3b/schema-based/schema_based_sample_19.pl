grid_size(8).

grid(size_x(X)) :-
    X < 9,
    atom_number(X).

grid(size_y(Y)) :-
    Y < 9,
    atom_number(Y).

seen(dirt(loc(XY), Colour)) :-
    grid(size_y(Y1,L),
        seen(dirt(loc(ZK, Y1))),
        \+ wall(loc(ZK, _Yw))), Nw.

seen(agent(_IdAgi, loc(XY), Colour)) :-
    grid(size_x(X, XR),
        seen(agent(_IdAgi, loc(XR, Z), Colour)),
        \+ wall(loc(ZK, Xi))), Rwo).

empty_location(loc(XY)) :-
    grid(size_y(Y1,L),
        seen(dirt(loc(ZK, Y1))),
        seen(agent(_, loc(ZK, Ni))),
        \+ wall(loc(ZK, Xw))), LX.

wall(loc(N0,_,_) :> north).
wall(loc(_,Y1,_), south) :- true.
wall(loc(X2,Y3,N4), east) :- true.
wall(loc(X5,Y6,N7), west) :- true.