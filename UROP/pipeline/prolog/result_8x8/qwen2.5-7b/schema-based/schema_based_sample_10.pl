grid_size(8).

grid(X,Y) :- between(0,7,X), between(0,7,Y).

wall(X,Y,north) :- X + 1 =< 7, Y =< 7, grid(X+1,Y).
wall(X,Y,east) :- X =< 7, Y > 0, grid(X,Y-1).
wall(X,Y,south) :- X >= 0, Y < 7, grid(X,Y+1).
wall(X,Y,west) :- X > 0, Y =< 7, grid(X-1,Y).

dirt(0,4,orange).
dirt(0,1,orange).
dirt(3,4,orange).
dirt(6,4,orange).
dirt_goal(0,7,south).
dirt_goal(0,7,west).
dirt_goal(2,7,south).
dirt_goal(1,7,south).

agent('9af04778-08d6-4e40-8c6f-ba123d292a22',2,3,orange).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',4,0,green).

empty(X,Y) :- \+ dirt(X,Y,_), \+ agent(_,X,Y,_).