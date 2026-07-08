grid_size(9).
grid(X, Y) :- X in [0..8], Y in [0..8].
dirt(X, Y, Colour) :-
    X in [0..8],
    Y in [0..8],
    Colour ins ['orange', 'green'].
agent(Id, X, Y, Colour) :-
    X in [0..8],
    Y in [0..8],
    Id like '_*4',
    Colour ins ['orange', 'green'].
empty(X, Y) :-
    X in [0..8],
    Y in [0..8].

wall(X, Y, west) :-
    X = 0,
    Y in [0..8].
wall(X, Y, south) :-
    Y = 0,
    X in [0..8].
wall(X, Y, east) :-
    X = 8,
    Y in [0..8].
wall(X, Y, north) :-
    Y = 8,
    X in [0..8].