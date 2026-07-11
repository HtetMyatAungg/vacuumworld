% grid size
grid_size(8,8).

% locations with contents
cell(0,3,agent(agent('9af04778-08d6-4e40-8c6f-ba123d292a22',orange))).
cell(2,1,dirt(orange)).
cell(3,4,dirt(orange)).
cell(4,0,agent(agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',green))).
cell(4,6,dirt(orange)).
cell(5,1,dirt(green)).
cell(6,4,dirt(orange)).

% walls from percepts
wall(0,6,west).
wall(0,7,south).
wall(0,7,west).
wall(1,7,south).
wall(2,7,south).
wall(0,5,west).
wall(0,4,west).
wall(0,3,west).
wall(0,2,west).
wall(0,1,west).
wall(0,0,north).
wall(0,0,west).
wall(1,0,north).
wall(2,0,north).
wall(3,0,north).
wall(3,7,south).
wall(4,7,south).
wall(4,0,north).
wall(5,0,north).
wall(5,7,south).
wall(6,7,south).
wall(6,0,north).
wall(7,0,east).
wall(7,0,north).
wall(7,1,east).
wall(7,2,east).
wall(7,3,east).
wall(7,4,east).
wall(7,5,east).
wall(7,6,east).
wall(7,7,east).
wall(7,7,south).

% inferred boundary walls
boundary_wall(X,Y,north) :-
    Y = 0,
    grid_size(_,H),
    Y < H.

boundary_wall(X,Y,south) :-
    grid_size(_,H),
    Y is H-1.

boundary_wall(X,Y,west) :-
    X = 0,
    grid_size(W,_),
    X < W.

boundary_wall(X,Y,east) :-
    grid_size(W,_),
    X is W-1.