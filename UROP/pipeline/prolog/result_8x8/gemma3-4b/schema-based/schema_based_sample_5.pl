grid_size(8).
grid(X, Y) :- X >= 0, X < 8, Y >= 0, Y < 8.
dirt(X, Y, 'orange') :- X >= 0, X < 8, Y >= 0, Y < 8.
dirt(X, Y, 'green') :- X >= 0, X < 8, Y >= 0, Y < 8.
agent(Id, X, Y, 'orange') :- X >= 0, X < 8, Y >= 0, Y < 8.
agent(Id, X, Y, 'green') :- X >= 0, X < 8, Y >= 0, Y < 8.
empty(X, Y) :- X >= 0, X < 8, Y >= 0, Y < 8.

wall(X, Y, west) :- X > 0, X < 8, Y = 0.
wall(X, Y, south) :- Y > 0, Y < 8, X = 0.
wall(X, Y, east) :- X > 0, X < 8 , Y = 7.
wall(X, Y, north) :- Y > 0, Y < 8, X = 7.
wall(X,Y,south) :- Y = 7, X >= 0, X < 8.
wall(X,Y,north) :- Y = 0, X >= 0, X < 8.