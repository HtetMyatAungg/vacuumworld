grid_size(11). grid(X,Y) :-
        Y between 0, 11,
        X between 0, 11.
dirt(X, Y, Colour) :-
        grid(X, Y),
        dirt_between(Colour).
agent(Id, X, Y, Colour) :-
        grid(X, Y),
        agent_id_between(Id, AgentId),
        agent_colour_between(Colour, _AgentColour).
empty(X, Y) :-
        grid(X, Y).