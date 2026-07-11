% grid size
n_size(5).

% create an empty N x N grid
grid(N) :-
    n_size(N),
    blank_grid(1, N).

% blank the grid
blank_grid(0, _) :- true;
blank_grid(Row, N) :-
    Row > 0,
    findall([], _, 1..N),
    forall(_, Col) : (Col >= Row -> blank_grid(Row - 1, N); true).

% wall definitions
wall(Direction, IsBoundary) :-
    Direction ins ['north', 'south', 'east', 'west'],
    write('Wall: Direction '), write(Direction), newline.