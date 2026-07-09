% Define the size of the grid
grid_size(8).

% Create an empty grid
create_grid(N) :-
    findall((X, Y), 0..N-1, CoordList),
    forall(member((X, Y), CoordList), \+ (is_empty_coord((X, Y)))).

% Define a helper predicate to check if a coordinate is empty.
is_empty_coord((X, Y)) :-
    not(grid_contains_something((X, Y))).

% Defines a predicate that checks whether the grid contains something at a given coord.
grid_contains_something((X,Y)) :-
    exists(cell,(member((X,Y), cell) )).


% Initialize the grid with walls
init_grid([]).

init_grid([[[wall],[nil]]]) :-
    grid_size(3).

init_grid([[[nil]], [[wall]]]) :-
    grid_size(3).

% Define the actual grid based on the percept log and grid size.
make_grid(N) :-
    create_grid(N),
    init_grid([]).

% Represent the grid as a list of lists, where each inner list represents a row.
representation(Grid, N) :-
    findall([((X, Y), CellType) | (X, Y) -> CellType), 0..N-1, Grid).

% Example use:
% representation(MyGrid, 8).