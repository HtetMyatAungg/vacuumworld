edge(X, Y) :- between(0, N), X == Y.
edge(X, Y) :- between(0, N), X \= Y.

grid(N) :-
    integer(N),
    N > 0.

cell(X, Y) :-
    between(0, N),
    X >= 0, X < N+1,
    Y >= 0, Y < N+1.

wall(X, Y, Direction) :-
    between(0, N),
    X >= 0, X < N+1,
    Y >= 0, Y < N+1,
    Direction ins [north, south, east, west].

agent_data(Id, Colour) :- member([Coord], PerceptLog),
    (   atom(Id), Id == '9af04778-08d6-4e40-8c6f-ba123d292a22', Colour == 'orange' )
        or
    (   atom(Id), Id == '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour == 'green').

dirt_data(Coord, DirtType) :- member([Coord], PerceptLog),
    DirtType == null or DirtType == "orange" or DirtType == "green".

grid_state(X, Y, Walls, Agent, Dirt) :-
    cell(X, Y),
    wall(X, Y, Walls),
    case Agent of
        null -> ();
        atom(AgentId) : agent_data(AgentId, Colour),
            DirtType == null
    ,
    case Dirt of
        null -> ();
        _ -> dirt_data(X, Dirt)
    ).
