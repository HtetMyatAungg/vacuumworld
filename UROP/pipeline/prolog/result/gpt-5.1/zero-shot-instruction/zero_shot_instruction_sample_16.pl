% Grid dimensions
grid_size(11,11).

% Walls from percept log
wall(0,9,west).
wall(1,9,none).
wall(2,9,none).
wall(0,10,west).
wall(0,10,south).
wall(1,10,south).
wall(2,10,south).
wall(0,8,west).
wall(1,8,none).
wall(2,8,none).
wall(0,7,west).
wall(1,7,none).
wall(2,7,none).
wall(0,6,west).
wall(1,6,none).
wall(2,6,none).
wall(0,5,west).
wall(1,5,none).
wall(2,5,none).
wall(0,4,west).
wall(1,4,none).
wall(2,4,none).
wall(0,3,west).
wall(1,3,none).
wall(2,3,none).
wall(0,2,west).
wall(1,2,none).
wall(2,2,none).
wall(0,1,west).
wall(1,1,none).
wall(2,1,none).
wall(0,0,west).
wall(0,0,north).
wall(1,0,north).
wall(2,0,north).
wall(3,0,north).
wall(3,1,none).
wall(3,2,none).
wall(3,3,none).
wall(3,4,none).
wall(3,5,none).
wall(3,6,none).
wall(3,7,none).
wall(3,8,none).
wall(3,9,none).
wall(3,10,south).
wall(4,8,none).
wall(4,9,none).
wall(4,10,south).
wall(4,7,none).
wall(4,6,none).
wall(4,5,none).
wall(4,4,none).
wall(4,3,none).
wall(4,2,none).
wall(4,1,none).
wall(4,0,north).
wall(5,0,north).
wall(5,1,none).
wall(5,2,none).
wall(5,3,none).
wall(5,4,none).
wall(5,5,none).
wall(5,6,none).
wall(5,7,none).
wall(5,8,none).
wall(5,9,none).
wall(5,10,south).
wall(6,8,none).
wall(6,9,none).
wall(6,10,south).
wall(6,7,none).
wall(6,6,none).
wall(6,5,none).
wall(6,4,none).
wall(6,3,none).
wall(6,2,none).
wall(6,1,none).
wall(6,0,north).
wall(7,0,north).
wall(7,1,none).
wall(7,2,none).
wall(7,3,none).
wall(7,4,none).
wall(7,5,none).
wall(7,6,none).
wall(7,7,none).
wall(7,8,none).
wall(7,9,none).
wall(7,10,south).
wall(8,8,none).
wall(8,9,none).
wall(8,10,south).
wall(8,7,none).
wall(8,6,none).
wall(8,5,none).
wall(8,4,none).
wall(8,3,none).
wall(8,2,none).
wall(8,1,none).
wall(8,0,north).
wall(9,0,north).
wall(9,1,none).
wall(9,2,none).
wall(9,3,none).
wall(9,4,none).
wall(9,5,none).
wall(9,6,none).
wall(9,7,none).
wall(9,8,none).
wall(9,9,none).
wall(9,10,south).
wall(10,8,east).
wall(10,9,east).
wall(10,10,east).
wall(10,10,south).
wall(10,7,east).
wall(10,6,east).
wall(10,5,east).
wall(10,4,east).
wall(10,3,east).
wall(10,2,east).
wall(10,1,east).
wall(10,0,east).
wall(10,0,north).

% Derived boundary walls (generic for any grid_size/2)
boundary_wall(X,Y,north) :-
    Y = 0,
    grid_size(_,H),
    Y >= 0,
    Y < H,
    X >= 0,
    grid_size(W,_),
    X < W.

boundary_wall(X,Y,south) :-
    grid_size(_,H),
    Y is H-1,
    Y >= 0,
    X >= 0,
    grid_size(W,_),
    X < W.

boundary_wall(X,Y,west) :-
    X = 0,
    grid_size(W,_),
    X >= 0,
    X < W,
    Y >= 0,
    grid_size(_,H),
    Y < H.

boundary_wall(X,Y,east) :-
    grid_size(W,_),
    X is W-1,
    X >= 0,
    Y >= 0,
    grid_size(_,H),
    Y < H.

has_wall(X,Y,Dir) :-
    wall(X,Y,Dir).
has_wall(X,Y,Dir) :-
    boundary_wall(X,Y,Dir).

% Dirt facts (only non-empty)
dirt(1,4,orange).
dirt(3,3,orange).
dirt(3,6,orange).
dirt(5,7,orange).
dirt(7,5,green).
dirt(9,2,green).
dirt(9,7,green).

% Agent facts (only where present)
agent(1,0,'d3af9897-9139-4ffe-8a15-2e9c6f06e71a',orange).
agent(5,0,'d6428e63-73b7-40a5-9cc9-ea3b5e61a86d',green).

% Location classification
occupied(X,Y) :-
    dirt(X,Y,_);
    agent(X,Y,_,_).

empty(X,Y) :-
    grid_size(W,H),
    X >= 0, X < W,
    Y >= 0, Y < H,
    \+ occupied(X,Y).