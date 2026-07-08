grid_size(8).

grid(X,Y).
dirt(X1,Y1,_Colour1).
dirt(X2,Y2,_Colour2).
agent(Id1,X1,Y1,_Colour1).
agent(Id2,X2,Y2,_Colour2).
empty(X3,Y3).

wall(X, Y, west).
wall(X, Y, north).
wall(X, Y, east).
wall(X, Y, south).
wall(N-1,Y,N-1,Y,North).
wall(X,N-1,X,N-1,East).
wall(Y,N-1,Y,N-1,South).
wall(X,Y,N,West).
wall(X,N,Y,N,East).
wall(X,N,Y,West).