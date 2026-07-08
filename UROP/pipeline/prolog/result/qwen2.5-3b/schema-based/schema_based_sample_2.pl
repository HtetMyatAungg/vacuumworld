grid_size(8).

% Section A - Translation facts

grid(X, Y) :-
    (X >= 0, X =< 7; grid_size(_), \+ member(grid(_, _), [Grid|_])),
    (Y >= 0, Y =< 7; grid_size(_), \+ member(grid(_, _), Grid)).

dirt(X, Y, Colour) :-
    coordinate(\+ empty(X,Y), X, Y),
    percept_log(dirt(X, Y, Color)).

agent(Id, X, Y, 'green', Id1 = Id).

empty(X, Y) :-
    grid(X, Y),
    \+ percept_log(dirt(_, _, _)),
    \+ percept_log(agent(_XY,_), X, Y).

% Section B - Wall rules

wall(\+ north, 0, N).
wall(\+ west, X, 0).
wall(\+ south, 0, N).
wall(\+ east, N, 7).