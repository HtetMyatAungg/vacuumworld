% -------------------------------------------------------
%  WALL REPRESENTATION – generalizable to any N x N grid
% -------------------------------------------------------

% Change this single fact to resize the world.
grid_size(8).

% wall(?X, ?Y, ?Direction)
% True if cell (X,Y) has a wall on the given side.
% Directions: north, south, east, west.
%
% Perimeter walls are derived from the grid size.
% You can add internal walls by writing extra facts,
% e.g.:  wall(3,4,north).

wall(X, Y, north) :-
    grid_size(N),
    between(0, N_minus_1, X),
    Y =:= 0,
    N_minus_1 is N - 1.

wall(X, Y, south) :-
    grid_size(N),
    N_minus_1 is N - 1,
    between(0, N_minus_1, X),
    Y =:= N_minus_1.

wall(X, Y, west) :-
    grid_size(N),
    N_minus_1 is N - 1,
    X =:= 0,
    between(0, N_minus_1, Y).

wall(X, Y, east) :-
    grid_size(N),
    N_minus_1 is N - 1,
    X =:= N_minus_1,
    between(0, N_minus_1, Y).

% -------------------------------------------------------
%  USEFUL QUERIES
% -------------------------------------------------------

% inside(?X, ?Y) – cell is within the grid.
inside(X, Y) :-
    grid_size(N),
    N_minus_1 is N - 1,
    between(0, N_minus_1, X),
    between(0, N_minus_1, Y).

% can_move(+X, +Y, +Direction)
% True if the robot can move one step in Direction
% (no wall, target still inside the grid).
can_move(X, Y, north) :-
    Y > 0,
    \+ wall(X, Y, north).
can_move(X, Y, south) :-
    grid_size(N),
    N_minus_1 is N - 1,
    Y < N_minus_1,
    \+ wall(X, Y, south).
can_move(X, Y, west) :-
    X > 0,
    \+ wall(X, Y, west).
can_move(X, Y, east) :-
    grid_size(N),
    N_minus_1 is N - 1,
    X < N_minus_1,
    \+ wall(X, Y, east).

% wall_between(+X1,+Y1, +X2,+Y2)
% True if there is a wall between two adjacent cells.
wall_between(X, Y, X, Y1) :-
    Y1 is Y + 1,
    wall(X, Y, north) ; wall(X, Y1, south).
wall_between(X, Y, X, Y1) :-
    Y1 is Y - 1,
    wall(X, Y, south) ; wall(X, Y1, north).
wall_between(X, Y, X1, Y) :-
    X1 is X + 1,
    wall(X, Y, east) ; wall(X1, Y, west).
wall_between(X, Y, X1, Y) :-
    X1 is X - 1,
    wall(X, Y, west) ; wall(X1, Y, east).

% -------------------------------------------------------
%  (OPTIONAL) DIRT FACTS FROM THE SENSOR LOG
% -------------------------------------------------------
dirt(1, 1, green).
dirt(4, 3, green).
dirt(2, 4, orange).
dirt(4, 6, orange).
dirt(6, 2, orange).
dirt(6, 5, orange).

% -------------------------------------------------------
%  EXAMPLE: print a simple ASCII map of walls
% -------------------------------------------------------
print_walls :-
    grid_size(N),
    N_minus_1 is N - 1,
    % top border
    write('+'), write_hline(N, '+'), nl,
    forall(between(0, N_minus_1, Y),
           print_row(Y, N, N_minus_1)),
    write('+'), write_hline(N, '+'), nl.

write_hline(0, _) :- !.
write_hline(N, End) :-
    write('---+'),
    N1 is N - 1,
    write_hline(N1, End).

print_row(Y, N, Nmax) :-
    Y > Nmax, !.
print_row(Y, N, Nmax) :-
    % vertical walls on west side
    write('|'),
    forall(between(0, Nmax, X),
           (   write('   '),
               (wall(X,Y,east) -> write('|') ; write(' '))
           )),
    nl,
    % horizontal walls on south side of this row
    write('+'),
    forall(between(0, Nmax, X),
           (   (wall(X,Y,south) -> write('---') ; write('   ')),
               write('+')
           )),
    nl,
    Y1 is Y + 1,
    print_row(Y1, N, Nmax).