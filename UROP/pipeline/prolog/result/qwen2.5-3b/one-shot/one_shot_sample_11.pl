grid_size(8).

grid(loc(0,0)).
grid(loc(1,0)).
grid(loc(2,0)).
grid(loc(3,0)).
grid(loc(4,0)).
grid(loc(5,0)).
grid(loc(6,0)).
grid(loc(7,0)).
grid(loc(0,1)).
grid(loc(1,1)).
grid(loc(2,1)).
grid(loc(3,1)).
grid(loc(4,1)).
grid(loc(5,1)).
grid(loc(6,1)).
grid(loc(7,1)).
grid(loc(0,2)).
grid(loc(1,2)).
grid(loc(2,2)).
grid(loc(3,2)).
grid(loc(4,2)).
grid(loc(5,2)).
grid(loc(6,2)).
grid(loc(7,2)).
grid(loc(0,3)).
grid(loc(1,3)).
grid(loc(2,3)).
grid(loc(3,3)).
grid(loc(4,3)).
grid(loc(5,3)).
grid(loc(6,3)).
grid(loc(7,3)).
grid(loc(0,4)).
grid(loc(1,4)).
grid(loc(2,4)).
grid(loc(3,4)).
grid(loc(4,4)).
grid(loc(5,4)).
grid(loc(6,4)).
grid(loc(7,4)).
grid(loc(0,5)).
grid(loc(1,5)).
grid(loc(2,5)).
grid(loc(3,5)).
grid(loc(4,5)).
grid(loc(5,5)).
grid(loc(6,5)).
grid(loc(7,5)).
grid(loc(0,6)).
grid(loc(1,6)).
grid(loc(2,6)).
grid(loc(3,6)).
grid(loc(4,6)).
grid(loc(5,6)).
grid(loc(6,6)).
grid(loc(7,6)).
grid(loc(0,7)).
grid(loc(1,7)).
grid(loc(2,7)).
grid(loc(3,7)).
grid(loc(4,7)).
grid(loc(5,7)).
grid(loc(6,7)).
grid(loc(7,7)).

seen(dirt(loc(X,Y), Colour)) :-
    nonvar(Colour),
    grid(loc(X,Y)),
    nonvar(X),
    nonvar(Y),
    \+ atom(AgentId) @= agent(Id, LocA, AColour) @= loc(LocB, AColour).

seen(agent(Id, loc(X,Y), Col)) :-
    nonvar(Id),
    grid(loc(X,Y)),
    nonvar(Colour),
    atom(AgentId),
    atom(Colour),
    \+ grid(loc(X,Y)),
    AgentId @= Id,
    LocA @= X, Y,
    Col @= AColour.

empty_location(loc(X,Y)) :-
    grid(loc(X,Y)).
    
wal(l(loc(0, Y), south)).
wal(l(loc(X, 7), east)).
wal(l(loc(7, Y), west)).