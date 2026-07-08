edge(X, Y, Dir) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    Dir ins ['north', 'south', 'east', 'west'](Dir).

wall_direction(north) :-
    Y < 7.

wall_direction(south) :-
    Y > 0.

wall_direction(west) :-
    X > 0.

wall_direction(east) :-
    X < 7.

grid(X, Y) :-
    X in [0..7],
    Y in [0..7].