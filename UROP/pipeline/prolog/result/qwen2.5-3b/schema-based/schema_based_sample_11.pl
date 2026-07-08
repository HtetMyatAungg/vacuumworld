grid_size(8).

grid(X, Y) :-
    X between 0, 7,
    Y between 0, 7,
    grid_at(X, Y).

dirt(X, Y, Colour) :-
    grid(X, Y),
    (dirt_val(D), Dirt = 'orange'; Dirt = 'green').

agent(Id, X, Y, Colour) :-
    grid(X, Y),
    agent_on(X, Y, AgentId, AgentColour, Id, AgentColour).

empty(X, Y) :-
    grid(X, Y),
    \+ dirt(_, _, _), 
    \+ agent(Id, _, Y, _).

wall(east, 0, Y) :- odd(Y).
wall(west, N-1, Y) :- even(N), odd(Y).
wall(south, X, 0) :- odd(X), odd(Y).
wall(north, X, N-1) :- even(X), even(Y),
    grid_size(N).

\+ wall(_, _, _).