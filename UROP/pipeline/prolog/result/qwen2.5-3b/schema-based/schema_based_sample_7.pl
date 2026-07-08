grid_size(8).

grid(X,Y) :-
    X between 0, 7,
    Y between 0, 7.

dirt(X,Y,Colour) :-
    grid(X,Y),
    nonvar(Dirt),
    Dirt =.. [_|[_;Colour]].
    
agent(Id,X,Y,Colour) :-
    grid(X,Y),
    nonvar(AgentId),
    AgentId = Id,
    AgentType = agent,
    AgentColour = Colour.

empty(X,Y) :-
    grid(X,Y),
    \+ dirt(_, _, _),
    \+ agent(_, _, _, _).

wall(X,X,yes).
wall(X,AnX,NoYes,Dir) :-
        ( AnX < X -> dir(YES,Up); dir(NO,Up) ),
        wall(AnX,N,Yes,Dir),
        Wall(X,N,NoYes,Up).

dir(yes,No).
dir(no,Yes).