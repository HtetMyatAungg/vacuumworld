grid_size(8).

grid(X,Y) :- X >= 0, X < 8, Y >= 0, Y < 8.

dirt(0,6,"").
dirt(0,7,"").
dirt(2,7,"").
dirt(0,4,"orange").
dirt(2,3,"").
dirt(0,1,"").
dirt(2,1,"orange").
dirt(0,0,"west,north").
dirt(1,0,"north").
dirt(2,0,"north").
dirt(3,0,"north").
dirt(4,0,"north").
dirt(6,0,"north").
dirt(0,5,"west").
dirt(1,5,"").
dirt(2,5,"").
dirt(0,3,"west").
dirt(1,3,"").
dirt(2,3,"").
dirt(4,7,"south").
dirt(6,5,"").
dirt(6,6,"").
dirt(6,7,"south").
dirt(4,5,"").
dirt(4,4,"").
dirt(7,0,"east,north").
dirt(7,1,"east").
dirt(7,2,"east").
dirt(7,3,"east").
dirt(7,4,"east").
dirt(7,5,"east").
dirt(7,6,"east").
dirt(7,7,"east,south").

agent("9af04778-08d6-4e40-8c6f-ba123d292a22",1,3,"orange").
agent("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",4,0,"green").

empty(X,Y) :- grid(X,Y), \+ dirt(X,Y,_), \+ agent(X,Y,_).

wall(X,Y,"north") :- Y > 0, grid(X,Y-1), \+ dirt(X,Y-1,_), \+ agent(X,Y-1,_).
wall(X,Y,"east")  :- X < 7, grid(X+1,Y), \+ dirt(X+1,Y,_), \+ agent(X+1,Y,_).
wall(X,Y,"south") :- Y < 7, grid(X,Y+1), \+ dirt(X,Y+1,_), \+ agent(X,Y+1,_).
wall(X,Y,"west")  :- X > 0, grid(X-1,Y), \+ dirt(X-1,Y,_), \+ agent(X-1,Y,_).