grid_size(8).

grid(X, Y) :-
    grid_size(N),
    X between 0, N-1,
    Y between 0, N-1,
    non_dirt(X, Y),
    non_agent(X, Y).

dirt(X, Y, Colour) :-
    grid_size(N),
    X between 0, N-1,
    Y between 0, N-1,
    drawer((X, Y), _, Colour).

agent(Id, X, Y, Colour) :-
    agent(Id),
    grid_size(N),
    X between 0, N-1,
    Y between 0, N-1,
    drawer((X, Y), Id, _).

empty(X, Y) :-
    grid_size(N),
    X between 0, N-1,
    Y between 0, N-1,
    not(drawer((X, Y), _, _)).

not(dirt(_, _, Colour)),
    not(agent(_Id, _, _, _Colour)).

drawer(X, Y, dirt(Colour)) :-
    member(coord([C_X, C_Y], [Col_X, Col_Y, wall(W, C_X, Col_X)], N),
        percept_log(CoordPerceptLog)), 
    X = C_X, Y = C_Y,
    W == east; W == west.

drawer(X, Y, agent(Id)) :-
    member(coord([C_X, C_Y], [Col_X, Col_Y, drawer(D, C_X, Col_X)], N), percept_log(CoordPerceptLog)),
    X = C_X, Y = C_Y,
    D == Id.

wall(X, Y, north).
wall(X, Y, south).
wall(X, Y, east).
wall(X, Y, west).

non_dirt(X, Y) :-
    grid_size(N),
    X between 0, N-1,
    Y between 0, N-1,
    not(drawer((X, Y), _, dirt(_Colour))).

non_agent(Id, X, Y) :-
    grid_size(N),
    X between 0, N-1,
    Y between 0, N-1,
    agent(Id).

empty(X, Y) :-
    grid_size(N),
    X between 0, N-1,
    Y between 0, N-1,
    not(non_dirt(X, Y)),
    not(non_agent(_Id, X, Y)).