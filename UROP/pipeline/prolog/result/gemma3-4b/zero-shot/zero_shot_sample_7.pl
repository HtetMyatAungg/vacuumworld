% Define the size of the grid (N x N) - Assuming it's 8x8 for this example
grid_size := 8.

% Representation:  grid(X, Y, wall_type, dirt_type, agent_id)
% X and Y are coordinates within the grid (0 to N-1)
% wall_type can be 'north', 'south', 'east', 'west', or [] if no walls.
% dirt_type can be null, 'orange', or 'green'.
% agent_id is a string representing the unique agent ID, or null if no agent.

grid(0, 0, [north, west], null, "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c").
grid(1, 0, [], [], null).
grid(2, 0, [], [], null).
grid(0, 1, [south, west], null, null).
grid(1, 1, [], [], null).
grid(2, 1, [], [], null).
grid(0, 2, [south, west], null, null).
grid(1, 2, [], [], null).
grid(2, 2, [], [], null).
grid(0, 3, [south, west], "9af04778-08d6-4e40-8c6f-ba123d292a22", null).
grid(1, 3, [], [], null).
grid(2, 3, [], [], null).
grid(0, 4, [south, west], null, null).
grid(1, 4, [], [], null).
grid(2, 4, [], [], null).
grid(0, 5, [south, west], null, null).
grid(1, 5, [], [], null).
grid(2, 5, [], [], null).
grid(0, 6, [south, west], null, null).
grid(1, 6, [], [], null).
grid(2, 6, [], [], null).
grid(0, 7, [south, west], null, null).
grid(1, 7, [south], null, null).
grid(2, 7, [south], null, null).
grid(3, 0, [north], null, null).
grid(3, 1, [], [], null).
grid(3, 2, [], [], null).
grid(3, 3, [], [], null).
grid(3, 4, [south], null, null).
grid(3, 5, [], [], null).
grid(3, 6, [], [], null).
grid(3, 7, [south], null, null).
grid(4, 0, [north], "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", null).
grid(5, 0, [north], null, null).
grid(5, 1, [green], null, null).
grid(5, 2, [], [], null).
grid(5, 3, [], [], null).
grid(5, 4, [], [], null).
grid(5, 5, [], [], null).
grid(5, 6, [], [], null).
grid(5, 7, [south], null, null).
grid(6, 0, [north], "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", null).
grid(7, 0, [east, north], null, null).
grid(7, 1, [east], null, null).
grid(7, 2, [east], null, null).
grid(7, 3, [east], null, null).
grid(7, 4, [east], null, null).
grid(7, 5, [east], null, null).
grid(7, 6, [east], null