grid_size(5).

% Observed dirt locations
cell_has_dirt(2, 3, orange).
cell_has_dirt(1, 2, green).
cell_has_dirt(3, 1, orange).

% Observed agent locations
cell_has_agent(2, 0, 'c942b0ce-6c70-4311-a5b7-6b2640fe417c', green).
cell_has_agent(4, 2, 'ec1d58f6-6db4-473d-af3e-518ca49c39f9', orange).

% Perceived walls from inside a cell
perceived_wall(0, 3, west).
perceived_wall(0, 4, south).
perceived_wall(0, 4, west).
perceived_wall(1, 4, south).
perceived_wall(2, 4, south).
perceived_wall(0, 2, west).
perceived_wall(0, 1, west).
perceived_wall(0, 0, north).
perceived_wall(0, 0, west).
perceived_wall(1, 0, north).
perceived_wall(2, 0, north).
perceived_wall(3, 0, north).
perceived_wall(3, 4, south).
perceived_wall(4, 2, east).
perceived_wall(4, 3, east).
perceived_wall(4, 4, east).
perceived_wall(4, 4, south).
perceived_wall(4, 1, east).
perceived_wall(4, 0, east).
perceived_wall(4, 0, north).

% Boundary wall rules
is_boundary_wall(X, Y, north) :- grid_size(_N), Y = 0.
is_boundary_wall(X, Y, south) :- grid_size(N), Y = N - 1.
is_boundary_wall(X, Y, west) :- grid_size(_N), X = 0.
is_boundary_wall(X, Y, east) :- grid_size(N), X = N - 1.

% A cell has a wall if it was perceived or if it's a boundary wall.
has_wall(X, Y, Direction) :-
    perceived_wall(X, Y, Direction)
    ;
    is_boundary_wall(X, Y, Direction).

% Helper predicate to check if a cell is within grid bounds
in_grid(X, Y) :-
    grid_size(N),
    X >= 0, X < N,
    Y >= 0, Y < N.

% A cell is considered empty if it exists within the grid and has no dirt or agent
cell_is_empty(X, Y) :-
    in_grid(X, Y),
    \+ cell_has_dirt(X, Y, _),
    \+ cell_has_agent(X, Y, _, _).