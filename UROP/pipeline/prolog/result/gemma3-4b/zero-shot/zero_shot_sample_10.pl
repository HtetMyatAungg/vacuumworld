edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    (
        (Dir == 'north') -> Y > 0
    ),
    (
        (Dir == 'south') -> Y < N - 1
    ),
    (
        (Dir == 'east') -> X < N - 1
    ),
    (
        (Dir == 'west') -> X > 0
    ).

boundary(X, Y) :-
    X = 0,
    Y = 0;
    X = 0,
    Y = N - 1;
    X = N - 1,
    Y = 0;
    X = N - 1,
    Y = N - 1.

agent_id(Id) :-
    sub_string(Id, '_', _, _, Num),
    integer(Num, _, NumInt),
    NumInt > 0.

colour(Colour) :-
    sub_string(Colour, ':', _, _, Value),
    sub_string(Value, '#', _, _, Hex),
    hex_to_atom(Hex, ColourAttrib),
    ColourAttrib = orange;
    ColourAttrib = green.

/*
edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    (
        (Dir == 'north') -> Y > 0
    ),
    (
        (Dir == 'south') -> Y < N - 1
    ),
    (
        (Dir == 'east') -> X < N - 1
    ),
    (
        (Dir == 'west') -> X > 0
    ).

boundary(X, Y) :-
    X = 0,
    Y = 0;
    X = 0,
    Y = N - 1;
    X = N - 1,
    Y = 0;
    X = N - 1,
    Y = N - 1.
*/