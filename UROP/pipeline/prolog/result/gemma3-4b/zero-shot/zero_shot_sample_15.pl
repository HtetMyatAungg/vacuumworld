% Define the size of the grid (N x N).  Assuming square grid here
grid_size := 8.

% Represent the grid as a list of lists, where each inner list is a row.
% Initially, all cells are empty (represented by null).
grid(X, Y) :-
    X >= 0, X < grid_size,
    Y >= 0, Y < grid_size,
    \+ member((X, Y), walls), % Ensure the cell is not a wall.  This list must be generated somehow.
    !.

% Define the walls of the grid. This represents the boundaries and interior walls.
walls([0, 0], north, west).
walls([0, 1], north, west).
walls([0, 2], north, west).
walls([0, 3], north, west).
walls([0, 4], north, west).
walls([0, 5], north, west).
walls([0, 6], north, west).
walls([0, 7], north, west).

walls([1, 0], north, west).
walls([1, 1], north, west).
walls([1, 2], north, west).
walls([1, 3], north, west).
walls([1, 4], north, west).
walls([1, 5], north, west).
walls([1, 6], north, west).
walls([1, 7], north, west).

walls([2, 0], north, west).
walls([2, 1], north, west).
walls([2, 2], north, west).
walls([2, 3], north, west).
walls([2, 4], north, west).
walls([2, 5], north, west).
walls([2, 6], north, west).
walls([2, 7], north, west).

walls([3, 0], north, west).
walls([3, 1], north, west).
walls([3, 2], north, west).
walls([3, 3], north, west).
walls([3, 4], north, west).
walls([3, 5], north, west).
walls([3, 6], north, west).
walls([3, 7], north, west).

walls([4, 0], north, west).
walls([4, 1], north, west).
walls([4, 2], north, west).
walls([4, 3], north, west).
walls([4, 4], north, west).
walls([4, 5], north, west).
walls([4, 6], north, west).
walls([4, 7], north, west).

walls([5, 0], north, west).
walls([5, 1], north, west).
walls([5, 2], north, west).
walls([5, 3], north, west).
walls([5, 4], north, west).
walls([5, 5], north, west).
walls([5, 6], north, west).
walls([5, 7], north, west).

walls([6, 0], north, west).
walls([6, 1], north, west).
walls([6, 2], north, west).
walls([6, 3], north, west).
walls([6, 4], north, west).
walls([6, 5], north, west).
walls([6, 6], north, west).
walls([6, 7], north, west).

walls([7, 0], east, north).
walls([7, 1], east, north).
walls([7, 2], east, north).
walls([7, 3], east, north).
walls([7, 4], east, north).
walls([7, 5], east, north).
walls([7, 6], east, north).
walls([7, 7], east, north).

% Define cells as having dirt/agent and walls.
cell(X, Y) :-
    grid(X, Y), !.

% Add other locations of objects. These