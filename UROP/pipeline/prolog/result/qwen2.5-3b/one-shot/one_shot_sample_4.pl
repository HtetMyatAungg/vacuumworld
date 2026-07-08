grid_size(8).

grid(X,Y) :-
    (X >= 0,
     X <= 7,
     Y >= 0,
     Y < 8,
     !),
    (Y == 0 -> (X == 0 ; X == 3 ; X == 6),
     wall(X, Y, north);
     walls(X-1, Y, west; east; south).

dirt(X,Y, Colour) :-
    grid(X, Y), nonvar(Colour),
    Colour \== null,
    !.

agent(Id, X,Y, Colour) :-
    grid(X, Y), var(Id),
    Id = 'agent-'++atom_concat('$', X, '-', Y, ','),
    Colour \== null,
    !.

empty(X,Y) :-
    grid(X, Y),
    nonvar(Colour),
    Colour == null.