grid_size(11).

wall(0, 9, west).
empty(0, 9).
empty(1, 9).
empty(2, 9).
wall(0, 10, south).
wall(0, 10, west).
empty(0, 10).
wall(1, 10, south).
empty(1, 10).
wall(2, 10, south).
empty(2, 10).
wall(0, 8, west).
empty(0, 8).
empty(1, 8).
empty(2, 8).
wall(0, 7, west).
empty(0, 7).
empty(1, 7).
empty(2, 7).
wall(0, 6, west).
empty(0, 6).
empty(1, 6).
empty(2, 6).
wall(0, 5, west).
empty(0, 5).
empty(1, 5).
empty(2, 5).
wall(0, 4, west).
empty(0, 4).
dirt(1, 4, orange).
empty(2, 4).
wall(0, 3, west).
empty(0, 3).
empty(1, 3).
empty(2, 3).
wall(0, 2, west).
empty(0, 2).
empty(1, 2).
empty(2, 2).
wall(0, 1, west).
empty(0, 1).
empty(1, 1).
empty(2, 1).
wall(0, 0, north).
wall(0, 0, west).
empty(0, 0).
wall(1, 0, north).
agent(1, 0, 'd3af9897-9139-4ffe-8a15-2e9c6f06e71a', orange).
wall(2, 0, north).
empty(2, 0).
wall(3, 0, north).
empty(3, 0).
empty(3, 1).
empty(3, 2).
dirt(3, 3, orange).
empty(3, 4).
empty(3, 5).
dirt(3, 6, orange).
empty(3, 7).
empty(3, 8).
empty(3, 9).
wall(3, 10, south).
empty(3, 10).
empty(4, 8).
empty(4, 9).
wall(4, 10, south).
empty(4, 10).
empty(4, 7).
empty(4, 6).
empty(4, 5).
empty(4, 4).
empty(4, 3).
empty(4, 2).
empty(4, 1).
wall(4, 0, north).
empty(4, 0).
wall(5, 0, north).
agent(5, 0, 'd6428e63-73b7-40a5-9cc9-ea3b5e61a86d', green).
empty(5, 1).
empty(5, 2).
empty(5, 3).
empty(5, 4).
empty(5, 5).
empty(5, 6).
dirt(5, 7, orange).
empty(5, 8).
empty(5, 9).
wall(5, 10, south).
empty(5, 10).
empty(6, 8).
empty(6, 9).
wall(6, 10, south).
empty(6, 10).
empty(6, 7).
empty(6, 6).
empty(6, 5).
empty(6, 4).
empty(6, 3).
empty(6, 2).
empty(6, 1).
wall(6, 0, north).
empty(6, 0).
wall(7, 0, north).
empty(7, 0).
empty(7, 1).
empty(7, 2).
empty(7, 3).
empty(7, 4).
dirt(7, 5, green).
empty(7, 6).
empty(7, 7).
empty(7, 8).
empty(7, 9).
wall(7, 10, south).
empty(7, 10).
empty(8, 8).
empty(8, 9).
wall(8, 10, south).
empty(8, 10).
empty(8, 7).
empty(8, 6).
empty(8, 5).
empty(8, 4).
empty(8, 3).
empty(8, 2).
empty(8, 1).
wall(8, 0, north).
empty(8, 0).
wall(9, 0, north).
empty(9, 0).
empty(9, 1).
dirt(9, 2, green).
empty(9, 3).
empty(9, 4).
empty(9, 5).
empty(9, 6).
dirt(9, 7, green).
empty(9, 8).
empty(9, 9).
wall(9, 10, south).
empty(9, 10).
wall(10, 8, east).
empty(10, 8).
wall(10, 9, east).
empty(10, 9).
wall(10, 10, east).
wall(10, 10, south).
empty(10, 10).
wall(10, 7, east).
empty(10, 7).
wall(10, 6, east).
empty(10, 6).
wall(10, 5, east).
empty(10, 5).
wall(10, 4, east).
empty(10, 4).
wall(10, 3, east).
empty(10, 3).
wall(10, 2, east).
empty(10, 2).
wall(10, 1, east).
empty(10, 1).
wall(10, 0, east).
wall(10, 0, north).
empty(10, 0).

% Boundary wall rules (generalised for any grid size N)
% These rules define inherent walls at the grid boundaries.
% Facts from the percept log take precedence or are redundant if they match these rules.
wall(X, Y, north) :- grid_size(N), Y = 0, X >= 0, X < N.
wall(X, Y, south) :- grid_size(N), Y is N - 1, X >= 0, X < N.
wall(X, Y, west) :- grid_size(N), X = 0, Y >= 0, Y < N.
wall(X, Y, east) :- grid_size(N), X is N - 1, Y >= 0, Y < N.