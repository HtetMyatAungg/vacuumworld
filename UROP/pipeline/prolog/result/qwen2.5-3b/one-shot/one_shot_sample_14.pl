grid_size(12).

grid(X,Y) :-
    write(grid(X,Y)).

dirt(X,Y, Colour) :-
    write(dirt(X,Y,_)).

agent(Id,X,Y,Colour) :-
    write(agent(Id,X,Y,Colour)).

empty(X,Y) :-
    write(empty(X,Y)).

wall(X,Y,east).
wall(X,Y,north).
wall(X,Y,south).
wall(X,Y,west).

X in 0..12,
Y in 0..12 :-
    wall(X,Y,north),
    grid(X,Y),
    \+ (agent(Id,Xb,_;dirt(_Xb,Id),_)),
    \+ (agent(Id,_xb,Yb),wall(Xb,Yb,south)).

X in 0..12,
Y in 0..12 :-
    wall(X,Y,east),
    grid(X,Y),
    \+ (agent(Id,Xb,_;dirt(_Id,Id),_)),
    \+ (agent(Id,_xb,Yb),wall(Xb,Yb,west)).

X in 0..11,
Y in 0..11 :-
    wall(X,Y,south),
    grid(X,Y),
    \+ (agent(Id,Xb,_;dirt(_Id,Id),_)),
    \+ (agent(Id,Yb),wall(Yb,Xb,north)).

X in 0..11,
Y in 0..11 :-
    wall(X,Y,west),
    grid(X,Y),
    \+ (agent(Id,Xb,_;dirt(_Id,Id),_)),
    \+ (agent(Id,Yb),wall(Yb,Xb,east)).