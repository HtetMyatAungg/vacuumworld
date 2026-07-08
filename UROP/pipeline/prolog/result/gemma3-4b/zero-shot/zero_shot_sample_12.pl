edge(X, Y, Dir) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    Dir ins('north', 'south', 'east', 'west'),
    (Dir = 'north', Y > 0),
    (Dir = 'south', Y < 7),
    (Dir = 'east', X < 7),
    (Dir = 'west', X > 0);

wall(X, Y, Dir) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    edge(X, Y, Dir);

boundary(X, Y) :-
    X = 0, Y >= 0, Y < 8;
boundary(X, Y) :-
    X = 7, Y >= 0, Y < 8;
boundary(X, Y) :-
    X >= 0, X < 8, Y = 0;
boundary(X, Y) :-
    X >= 0, X < 8, Y = 7;

grid(N) :-
    N > 0;

cell(X, Y, State) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    edge(X, Y, StateDir),
    wall(X, Y, StateDir);

agent(Id, Colour) :-
    substitute(Id, _, _),
    substitute(Colour, _, _);

dirt(X, Y, Colour) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    Colour ins('orange', 'green');
