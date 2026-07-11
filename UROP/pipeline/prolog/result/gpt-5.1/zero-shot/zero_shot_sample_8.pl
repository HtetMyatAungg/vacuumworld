% Grid dimensions
grid_size(5,5).

% Walls
wall(0,3,west).
wall(0,4,south).
wall(0,4,west).
wall(0,2,west).
wall(0,1,west).
wall(0,0,north).
wall(0,0,west).
wall(1,4,south).
wall(1,0,north).
wall(2,4,south).
wall(2,0,north).
wall(3,4,south).
wall(3,0,north).
wall(4,2,east).
wall(4,3,east).
wall(4,4,east).
wall(4,4,south).
wall(4,1,east).
wall(4,0,east).
wall(4,0,north).

% Dirt
dirt(2,3,orange).
dirt(1,2,green).
dirt(3,1,orange).

% Agents
agent(2,0,'c942b0ce-6c70-4311-a5b7-6b2640fe417c',green).
agent(4,2,'ec1d58f6-6db4-473d-af3e-518ca49c39f9',orange).

% Adjacency (within grid and not blocked by walls)
adjacent((X,Y),(X1,Y)) :-
    X1 is X+1,
    grid_size(W,_),
    X1 < W,
    \+ wall(X,Y,east),
    \+ wall(X1,Y,west).
adjacent((X,Y),(X1,Y)) :-
    X1 is X-1,
    X1 >= 0,
    \+ wall(X,Y,west),
    \+ wall(X1,Y,east).
adjacent((X,Y),(X,Y1)) :-
    Y1 is Y+1,
    grid_size(_,H),
    Y1 < H,
    \+ wall(X,Y,south),
    \+ wall(X,Y1,north).
adjacent((X,Y),(X,Y1)) :-
    Y1 is Y-1,
    Y1 >= 0,
    \+ wall(X,Y,north),
    \+ wall(X,Y1,south).

% Boundary walls induced by grid edges
boundary_wall(X,Y,west) :-
    X =:= 0.
boundary_wall(X,Y,east) :-
    grid_size(W,_),
    X =:= W-1.
boundary_wall(X,Y,north) :-
    Y =:= 0.
boundary_wall(X,Y,south) :-
    grid_size(_,H),
    Y =:= H-1.