grid_size(8).

grid(X,Y).
empty(X,Y).

dirt(0,6, null).
dirt(1,6, null).
dirt(2,6, null).
dirt(0,7, null).
dirt(1,7, null).
dirt(2,7, null).
dirt(0,5, null).
dirt(2,5, null).
dirt(0,4, null).
dirt(1,4, null).
dirt(2,4, null).

agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 2,0, orange).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4,0, green).

wall(X,Y,north) :- X > 0, grid(X,Y), not(grid(X-1,Y)).
wall(X,Y,south) :- X < (grid_size(8)-1), grid(X,Y), not(grid(X+1,Y)).
wall(X,Y,east) :- Y < (grid_size(8)-1), grid(X,Y), not(grid(X,Y+1)).
wall(X,Y,west) :- Y > 0, grid(X,Y), not(grid(X,Y-1)).