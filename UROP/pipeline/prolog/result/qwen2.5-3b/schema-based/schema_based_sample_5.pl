grid_size(8).

grid(X,Y) :-
    between(0,X,7),
    between(0,Y,7),
    !,
    (X*Y == 64 --> true ;
    grid(X+1,Y)||
    grid(X-1,Y)||
    grid(X,Y+1)||
    grid(X,Y-1)).

dirt(X,Y, Colour) :-
    findall(grid(X,Y), grid(X,Y),
            [grid_X_Y|_]),
    member(grid(X,Y), [
        {X,Y,walls,"west"},
        {X-1,Y,walls,"north"},
        {0,Y,walls,"east"}
    ]),
    nonempty([Colour]).

agent(Id,X,Y, Colour) :-
    findall(agent(X,Y,Id,Col), agent(Id,X,Y,Col),
            [agent_X_Y_Ids_Cols|_]),
    member(grid(ParentX,ParentY), [
        {0,6,walls,"west"},
        {1,6,walls,"north"},
        {2,7,walls,"south"},
        {3,4,walls,"east"}])
    Id \= "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",
    agent(Id,X,Y,Col),
    nonempty([Colour]),
    Colour \= Col,
    nonempty([Id]).

nonempty(L) :-
    length(L,N), N > 0.

empty(X,Y) :-
    findall(grid(ParentX,ParenY), grid(ParentX,ParenY),
            Grid),
    member(grid(X,Y), [
        {X,Y,walls,"north"},
        {X,Y,walls,"south"}]).

wall(X,Y, "west").
wall(X,Y, "east").
wall(X,Y, "north").
wall(X,Y, "south").