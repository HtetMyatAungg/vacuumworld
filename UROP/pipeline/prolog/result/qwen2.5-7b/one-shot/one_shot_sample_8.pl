grid_size(8).

grid(0,0).
grid(1,0).
grid(2,0).
grid(3,0).
grid(4,0).
grid(5,0).
grid(6,0).
grid(7,0).
grid(0,1).
grid(1,1).
grid(2,1).
grid(3,1).
grid(4,1).
grid(5,1).
grid(6,1).
grid(7,1).
grid(0,2).
grid(1,2).
grid(2,2).
grid(3,2).
grid(4,2).
grid(5,2).
grid(6,2).
grid(7,2).
grid(0,3).
grid(1,3).
grid(2,3).
grid(3,3).
grid(4,3).
grid(5,3).
grid(6,3).
grid(7,3).
grid(0,4).
grid(1,4).
grid(2,4).
grid(3,4).
grid(4,4).
grid(5,4).
grid(6,4).
grid(7,4).
grid(0,5).
grid(1,5).
grid(2,5).
grid(3,5).
grid(4,5).
grid(5,5).
grid(6,5).
grid(7,5).
grid(0,6).
grid(1,6).
grid(2,6).
grid(3,6).
grid(4,6).
grid(5,6).
grid(6,6).
grid(7,6).
grid(0,7).
grid(1,7).
grid(2,7).
grid(3,7).
grid(4,7).
grid(5,7).
grid(6,7).
grid(7,7).

dirt(1,7, null).
dirt(2,7, null).
dirt(0,4, "orange").
dirt(2,3, null).
dirt(0,2, null).
dirt(1,1, null).
dirt(2,1, "orange").
dirt(0,0, null).
dirt(1,0, null).
dirt(2,0, null).
dirt(3,0, null).
dirt(4,7, "orange").
dirt(6,5, null).
dirt(6,6, null).
dirt(6,1, null).
dirt(6,0, null).

agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 0,3, "orange").
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4,5, "green").

empty(0,1).
empty(1,1).
empty(2,3).
empty(3,2).
empty(4,3).
empty(4,4).
empty(4,2).
empty(4,1).
empty(1,6).
empty(2,6).
empty(3,5).
empty(0,5).
empty(3,6).
empty(4,6).
empty(5,6).
empty(7,5).
empty(7,6).
empty(7,7).

wall(X,Y, "north"):- grid(X,Y), Y > 0, \+ wall(X,Y-1,"south").
wall(X,Y, "south"):- grid(X,Y), Y < 7, \+ wall(X,Y+1,"north").
wall(X,Y, "west"):- grid(X,Y), X > 0, \+ wall(X-1,Y,"east").
wall(X,Y, "east"):- grid(X,Y), X < 7, \+ wall(X+1,Y,"west").