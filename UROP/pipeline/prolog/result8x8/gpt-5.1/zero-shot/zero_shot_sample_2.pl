% grid dimensions
grid_size(8,8).

% adjacency (undirected)
adjacent((X,Y),(X1,Y)) :- X1 is X+1, X1 < 8.
adjacent((X,Y),(X1,Y)) :- X1 is X-1, X1 >= 0.
adjacent((X,Y),(X,Y1)) :- Y1 is Y+1, Y1 < 8.
adjacent((X,Y),(X,Y1)) :- Y1 is Y-1, Y1 >= 0.

% boundary walls derived from coordinates
wall((0,_),west).
wall((7,_),east).
wall((_,0),north).
wall((_,7),south).

% cells with observed explicit walls (duplicates allowed logically)
cell_wall((0,6),west).
cell_wall((0,7),south).
cell_wall((0,7),west).
cell_wall((1,7),south).
cell_wall((2,7),south).
cell_wall((0,5),west).
cell_wall((0,4),west).
cell_wall((0,3),west).
cell_wall((0,2),west).
cell_wall((0,1),west).
cell_wall((0,0),north).
cell_wall((0,0),west).
cell_wall((1,0),north).
cell_wall((2,0),north).
cell_wall((3,0),north).
cell_wall((3,7),south).
cell_wall((4,7),south).
cell_wall((4,0),north).
cell_wall((5,0),north).
cell_wall((5,7),south).
cell_wall((6,7),south).
cell_wall((6,0),north).
cell_wall((7,0),east).
cell_wall((7,0),north).
cell_wall((7,1),east).
cell_wall((7,2),east).
cell_wall((7,3),east).
cell_wall((7,4),east).
cell_wall((7,5),east).
cell_wall((7,6),east).
cell_wall((7,7),east).
cell_wall((7,7),south).

% unify observed walls with boundary rule where applicable
has_wall(Pos,Dir) :- cell_wall(Pos,Dir).
has_wall((X,Y),Dir) :- wall((X,Y),Dir).

% contents: dirt
dirt((2,1),orange).
dirt((3,4),orange).
dirt((4,6),orange).
dirt((5,1),green).
dirt((6,4),orange).

% contents: agents
agent((0,3),'9af04778-08d6-4e40-8c6f-ba123d292a22',orange).
agent((4,0),'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',green).

% occupied locations (dirt or agent)
occupied(Pos) :- dirt(Pos,_).
occupied(Pos) :- agent(Pos,_,_).

% empty locations (within grid, not occupied)
empty((X,Y)) :-
    X >= 0, X < 8,
    Y >= 0, Y < 8,
    \+ occupied((X,Y)).