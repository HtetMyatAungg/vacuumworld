% Define the size of the grid (N x N)
grid_size(8).

% Represent the grid as a list of lists
% Each inner list represents a row
% Use symbols for walls ('north', 'south', 'east', 'west') and dirt ('orange', 'green')
% Use 'empty' to represent an empty cell (no wall, no dirt, no agent)

grid(
    [
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty]
    ]
).

% Define agents with their IDs and colors
agent(id(9af04778-08d6-4e40-8c6f-ba123d292a22), color('orange')).
agent(id(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c), color('green')).

% Define wall rules based on the percept log
wall(0, 6, 'west').
wall(1, 6, []).
wall(2, 6, []).
wall(0, 7, ['south', 'west']).
wall(1, 7, ['south']).
wall(2, 7, ['south']).
wall(0, 5, 'west').
wall(1, 5, []).
wall(2, 5, []).
wall(0, 4, 'west').
wall(1, 4, []).
wall(2, 4, []).
wall(0, 3, 'west').
wall(1, 3, []).
wall(2, 3, []).
wall(0, 2, 'west').
wall(1, 2, []).
wall(2, 2, []).
wall(0, 1, 'west').
wall(1, 1, []).
wall(2, 1, ['south']).
wall(0, 0, ['north', 'west']).
wall(1, 0, ['north']).
wall(2, 0, ['north']).
wall(3, 0, ['north']).
wall(3, 1, []).
wall(3, 2, []).
wall(3, 3, []).
wall(3, 4, []).
wall(3, 5, []).
wall(3, 6, []).
wall(3, 7, ['south']).
wall(4, 5, []).
wall(4, 6, []).
wall(4, 7, ['south']).
wall(4, 4, []).
wall(4, 3, []).
wall(4, 2, []).
wall(4, 1, []).
wall(4, 0, ['north']).
wall(5, 0, ['north']).
wall(5, 1, ['green']).
wall(5, 2, []).
wall(5, 3, []).
wall(5, 4, []).
wall(5, 5, []).
wall(5, 6, []).
wall(5, 7, ['south']).
wall(6, 5, []).
wall(6, 6, []).
wall(6, 7, ['south']).
wall(6, 4, ['orange']).
wall(6, 3, []).
wall(6, 2, []).
wall(6, 1, []).
wall(6, 0, ['north']).
wall(7