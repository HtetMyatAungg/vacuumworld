edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    between(X, X, N),
    between(Y, Y, N),
    between(Dir, ['north', 'south', 'east', 'west'], Dir).

boundary(X, Y, Dir) :-
    X = 0,
    Y >= 0,
    Y < N,
    between(Dir, ['north', 'west'], Dir).

boundary(X, Y, Dir) :-
    X = N - 1,
    Y >= 0,
    Y < N,
    between(Dir, ['south', 'east'], Dir).

boundary(X, Y, Dir) :-
    Y = 0,
    X >= 0,
    X < N,
    between(Dir, ['west', 'north'], Dir).

boundary(X, Y, Dir) :-
    Y = N - 1,
    X >= 0,
    X < N,
    between(Dir, ['east', 'south'], Dir).

grid(N) :-
    N > 0,
    integer(N).

agent(Id, Colour) :-
    member(Id, ['9af04778-08d6-4e40-8c6f-ba123d292a22', '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c']),
    member(Colour, ['orange', 'green']).

dirt(Coord, Colour) :-
    edge(CoordX, CoordY, Dir),
    dirt_color(CoordX, CoordY, Colour).

dirt_color(X, Y, Colour) :-
    (   X = 0,   Y = 0
    ->  Colour = 'orange'
    ;   X = 3,   Y = 7
    ->  Colour = 'orange'
    ;   X = 6,   Y = 5
    ->   Colour = 'orange'
    ;   X = 7,   Y = 0
    ->   Colour = 'orange'
    ; true
    ).