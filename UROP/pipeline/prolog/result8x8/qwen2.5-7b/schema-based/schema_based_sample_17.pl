grid_size(8).
grid(X,Y) :- X >= 0, X < 8, Y >= 0, Y < 8.
dirt(0,7,_).
dirt(1,7,_).
dirt(2,7,_).
dirt(0,3,"orange").
dirt(2,1,"orange").
dirt(3,4,"orange").
dirt(6,4,"orange").
agent("9af04778-08d6-4e40-8c6f-ba123d292a22", 0,3,"orange").
agent("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", 4,0,"green").
empty(X,Y) :- grid(X,Y), \+ dirt(X,Y,_), \+ agent(_,X,Y, _).
wall(X,Y,D) :- X > 0, Y >= 0, Y < 8, D = west.
wall(X,Y,_D) :- X >= 0, X < 7, Y = 0, D = north.
wall(X,Y,_D) :- X >= 0, X < 8, Y > 0, Y < 8, D = south.
wall(3,Y,null) :- Y >= 1, Y =< 6.