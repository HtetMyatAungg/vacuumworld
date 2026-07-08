grid(N,N).

wall(X,Y,north) :- X > 0, Y = 0.
wall(X,Y,east) :- X < N-1, Y = 7.
wall(X,Y,south) :- X > 0, Y = 7.
wall(0,Y,west) :- Y > 0.

dirt(X,Y,orange) :- (X = 3,Y = 4; X = 0,Y = 3; X = 6,Y = 4).
dirt(X,Y,green) :- X = 4, Y = 0.