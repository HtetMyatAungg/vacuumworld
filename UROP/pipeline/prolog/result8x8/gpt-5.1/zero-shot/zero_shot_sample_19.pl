% grid size
grid_size(8,8).

% walls
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

% contents
agent(0,3,'9af04778-08d6-4e40-8c6f-ba123d292a22',orange).
agent(4,0,'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',green).

dirt(2,1,orange).
dirt(3,4,orange).
dirt(4,6,orange).
dirt(5,1,green).
dirt(6,4,orange).

% boundary wall rules
boundary_wall(X,Y,north) :-
    Y = 0,
    X >= 0,
    X < 8.

boundary_wall(X,Y,south) :-
    Y =:= 7,
    X >= 0,
    X < 8.

boundary_wall(X,Y,west) :-
    X = 0,
    Y >= 0,
    Y < 8.

boundary_wall(X,Y,east) :-
    X =:= 7,
    Y >= 0,
    Y < 8.