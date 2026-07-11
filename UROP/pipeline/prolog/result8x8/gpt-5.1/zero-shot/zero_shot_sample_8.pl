% grid size
grid_size(8, 8).

% contents
content(0,3,agent(9af04778-08d6-4e40-8c6f-ba123d292a22,orange)).
content(2,1,dirt(orange)).
content(3,4,dirt(orange)).
content(4,6,dirt(orange)).
content(6,4,dirt(orange)).
content(4,0,agent(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c,green)).
content(5,1,dirt(green)).

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

% derived boundary walls for any coordinate
boundary_wall(X,Y,north) :-
    Y =:= 0,
    grid_size(_,H),
    X >= 0,
    X < H.

boundary_wall(X,Y,south) :-
    grid_size(_,H),
    Y =:= H-1,
    X >= 0,
    X < H.

boundary_wall(X,Y,west) :-
    X =:= 0,
    grid_size(W,_),
    Y >= 0,
    Y < W.

boundary_wall(X,Y,east) :-
    grid_size(W,_),
    X =:= W-1,
    Y >= 0,
    Y < W.

has_wall(X,Y,Dir) :-
    wall(X,Y,Dir);
    boundary_wall(X,Y,Dir).