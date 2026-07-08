grid_size(8).
grid(X, Y) :- X >= 0, X < 8, Y >= 0, Y < 8.
dirt(X, Y, 'orange') :- X >= 0, X < 8, Y >= 0, Y < 8, X = 3, Y = 3.
dirt(X, Y, 'green') :- X >= 0, X < 8, Y >= 0, Y < 8, X = 5, Y = 1.
dirt(X, Y, 'orange') :- X >= 0, X < 8, Y >= 0, Y < 8, X = 6, Y = 4.
empty(X, Y) :- X >= 0, X < 8, Y >= 0, Y < 8.

wall(X, Y, west) :- X > 0, X < 8, Y >= 0, Y < 8, X = 0, Y >= 3.
wall(X, Y, west) :- X > 0, X < 8, Y >= 0, Y < 8, X = 1, Y >= 3.
wall(X, Y, west) :- X > 0, X < 8, Y >= 0, Y < 8, X = 2, Y >= 3.
wall(X, Y, west) :- X > 0, X < 8, Y >= 0, Y < 8, X = 3, Y >= 3.
wall(X, Y, west) :- X > 0, X < 8, Y >= 0, Y < 8, X = 4, Y >= 3.
wall(X, Y, west) :- X > 0, X < 8, Y >= 0, Y < 8, X = 5, Y >= 3.
wall(X, Y, west) :- X > 0, X < 8, Y >= 0, Y < 8, X = 6, Y >= 3.
wall(X, Y, south) :- X >= 0, X < 8, Y > 0, Y < 8, X = 7, Y = 0.
wall(X, Y, south) :- X >= 0, X < 8, Y > 0, Y < 8, X = 7, Y = 1.
wall(X, Y, south) :- X >= 0, X < 8, Y > 0, Y < 8, X = 7, Y = 2.
wall(X, Y, south) :- X >= 0, X < 8, Y > 0, Y < 8, X = 7, Y = 3.
wall(X, Y, south) :- X >= 0, X < 8, Y > 0, Y < 8, X = 7, Y = 4.
wall(X, Y, east) :- X < 7, X >= 0, Y >= 0, Y < 8, X = 7, Y >= 3.
wall(X, Y, north) :- X >= 0, X < 8, Y < 7, Y >= 0, X = 7 ,Y= 0.
