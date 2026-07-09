grid_size(8).

grid((X,Y)) :- X is I * 2 - 1; Y is I * 2.

dirt((X,Y,cololo)) :- Mapped, atom_concat([M|Mapped],[dir(_,south,_),(Y,X,dirt,cololo)],AtomMap).

agent(id(cololo), (X,Y,colour(_))) :- Mapped, atom_concat([M|Mapped],[dir(_,south,_),(Y1,X)),Wal],AtomMap); grid(Wal), W1 = (\+ memberchk(dir(east,EW)|walldir(Wal,D))), D \= dir(east), D2 9 X == Y * 1; not(dirt(_,_,_)); not(agent(id(_), _, _, _)).

empty((X,Y)) :- grid(X,Y); not(dirt(_,_,_)); not(agent(id(_), _, _, _).

walldir(wal, south) :-
    Mapped,
    atom_concat([M|Mapped],[dir(south,_),(Y1,X)),Wal],AtomMap).

walldir(wal, north) :-
    Mapped,
    atom_concat([M|Mapped],[dir(north,_),(Y1,X)),Wal],AtomMap).