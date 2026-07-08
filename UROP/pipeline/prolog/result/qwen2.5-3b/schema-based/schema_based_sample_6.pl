grid_size(8).

% Section A - Translation facts

empty(0,7).
empty(1,7).
...
dirt(3,4, 'orange').
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 0,5, 'orange').
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4,0, 'green').

% Section B - Wall rules

wall(X,Y,north) :- X > 0, Y = 0.
wall(X,Y,south) :- X < grid_size(8), Y = 8.
wall(X,Y,east) :- X = grid_size(8), Y > 0.
wall(X,Y,west) :- X = 0, Y > 0.