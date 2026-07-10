% Grid Dimensions
grid_size(8, 8).

% Agents
agent(id("9af04778-08d6-4e40-8c6f-ba123d292a22"), orange, 0, 3).
agent(id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c"), green, 4, 0).

% Dirt
dirt(orange, 2, 1).
dirt(orange, 3, 4).
dirt(orange, 4, 6).
dirt(orange, 6, 4).
dirt(green, 5, 1).

% Boundary Walls
wall(X, Y, north) :- Y = 0.
wall(X, Y, south) :- Y = 7.
wall(X, Y, west) :- X = 0.
wall(X, Y, east) :- X = 7.

% Cell contents helper
cell_content(X, Y, agent(Color)) :- agent(_, Color, X, Y).
cell_content(X, Y, dirt(Color)) :- dirt(Color, X, Y).
cell_content(X, Y, empty) :- \+ agent(_, _, X, Y), \+ dirt(_, X, Y).