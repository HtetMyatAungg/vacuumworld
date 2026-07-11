grid_size(8).

% Generalized grid rules for any N×N grid size where N = 8
grid(X,Y) :-
    between(0,X,7),
    between(0,Y,7).

dirt(X,Y,Colour) :-
    grid(X,Y),
    percept(dirt(Colour)).

agent(Id,X,Y,Colour) :-
    grid(X,Y),
    percept(agent(Id)),
    AgentColour(Colour).

empty(X,Y) :-
    grid(X,Y),
    \+ percept(_).

wall(X,Y,north).
wall(X,Y,south).
wall(X,Y,east).
wall(X,Y,west).