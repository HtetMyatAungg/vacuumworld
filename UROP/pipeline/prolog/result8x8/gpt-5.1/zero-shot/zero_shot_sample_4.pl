% grid size
grid_size(8,8).

% facts for cells with non-empty content
dirt(2,1,orange).
dirt(3,4,orange).
dirt(4,6,orange).
dirt(6,4,orange).
dirt(5,1,green).

agent(0,3,'9af04778-08d6-4e40-8c6f-ba123d292a22',orange).
agent(4,0,'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',green).

% boundary walls derived from grid size
wall(X,Y,north) :-
    grid_size(_,H),
    Y =:= 0,
    X >= 0,
    X < H.

wall(X,Y,south) :-
    grid_size(_,H),
    Y =:= H-1,
    X >= 0,
    X < H.

wall(X,Y,west) :-
    grid_size(W,_),
    X =:= 0,
    Y >= 0,
    Y < W.

wall(X,Y,east) :-
    grid_size(W,_),
    X =:= W-1,
    Y >= 0,
    Y < W.