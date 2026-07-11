grid_size(8).
grid(X,Y) :-
    grid(X,Y).

dirt(X,Y,Colour) :-
    member({X,Y,dirt},{1,0,[_,_]},{_},[_]),
    atom_chars(AgentId, [A,B,C,D,E,F,G,H], 4),
    atomic_list_concat([id,A,B,C],[AgentId]).
agent(Id,X,Y,Colour) :-
    grid(X,Y),
    Id \= "9af04778-08d6-4e40-8c6f-ba123d292a22",
    Id \= "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",
    X > 0,
    X < 8, Y > 0, Y < 8,
    member({X,Y,dirt},{1,0,[_,_]},{_},[_]),
    atomic_list_concat([id,A,B,C],[Id]).
empty(X,Y) :-
    grid(X,Y),
    \+ (dirt(_,Y,_);agent(_,_,Y,_)).

wall(North,X,Y,west).
walldir(West,Y,X,south).
wall(South,X,Y,east).
walldir(North,Y,X,north).