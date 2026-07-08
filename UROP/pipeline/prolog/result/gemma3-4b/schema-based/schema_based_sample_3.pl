grid_size(9).
grid(X,Y) :- X >= 0, X < 9, Y >= 0, Y < 9.
dirt(X,Y, 'orange') :- X >= 0, X < 9, Y >= 0, Y < 9.
dirt(X,Y, 'green') :- X >= 0, X < 9, Y >= 0, Y < 9.
agent(Id, X, Y, 'orange') :- X >= 0, X < 9, Y >= 0, Y < 9.
agent(Id, X, Y, 'green') :- X >= 0, X < 9, Y >= 0, Y < 9.
empty(X,Y) :- X >= 0, X < 9, Y >= 0, Y < 9.

wall(X,Y, west) :- X = 0, Y >= 0, Y < 9.
wall(X,Y, south) :- Y = 0, X >= 0, X < 9.
wall(X,Y, east) :- X = 8, Y >= 0, Y < 9.
wall(X,Y, north) :- Y = 8, X >= 0, X < 9.
wall(X,Y, west) :- X = 0, Y = 7, X < 9, Y < 9.
wall(X,Y, south) :- X = 2, Y = 6, X < 9, Y < 9.
wall(X,Y, north) :- X = 5, Y = 0, X < 9, Y < 9.
wall(X,Y, east) :- X = 7, Y = 2, X < 9, Y < 9.
wall(X,Y, west) :- X = 0, Y = 3, X < 9, Y < 9.
wall(X,Y, south) :- X = 1, Y = 6, X < 9, Y < 9.
wall(X,Y, north) :- X = 4, Y = 1, X < 9, Y < 9.
wall(X,Y, east) :- X = 6, Y = 5, X < 9, Y < 9.
wall(X,Y, west) :- X = 0, Y = 5, X < 9, Y < 9.
wall(X,Y, north) :- X = 2, Y = 2, X < 9, Y < 9.
wall(X,Y, south) :- X = 1, Y = 3, X < 9, Y < 9.
wall(X,Y, east) :- X = 3, Y = 4, X < 9, Y < 9.
wall(X,Y, west) :- X = 0, Y = 4, X < 9, Y < 9.
wall(X,Y, north) :- X = 1, Y = 2, X < 9, Y < 9.
wall(X,Y, south) :- X = 4, Y = 0, X < 9, Y < 9.
wall(X,Y, east) :- X = 5, Y = 1, X < 9, Y < 9.
wall(X,Y, west) :- X = 0, Y = 1, X < 9, Y < 9.
wall(X,Y, south) :- X = 5, Y = 4, X < 9, Y < 9.
wall(X,Y, east) :- X = 6, Y = 6, X < 9, Y < 9.
wall(X,Y, west) :- X = 0, Y = 6, X < 9, Y < 9.
wall(X,Y, south) :- X = 7, Y = 5, X < 9, Y < 9.
wall(X,Y, east) :- X = 7, Y = 7, X < 9, Y < 9.