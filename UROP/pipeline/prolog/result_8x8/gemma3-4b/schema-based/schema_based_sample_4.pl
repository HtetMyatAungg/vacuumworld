grid_size(9).
grid(X, Y) :- X > 0 , X < 9 , Y > 0 , Y < 9.
dirt(X, Y, 'orange') :- X >= 0, X < 9, Y >= 0, Y < 9, (X = 3, Y = 0).
dirt(X, Y, 'green') :- X >= 0, X < 9, Y >= 0, Y < 9, (X = 5, Y = 1).
dirt(X, Y, 'orange') :- X >= 0, X < 9, Y >= 0, Y < 9, (X = 6, Y = 4).
empty(X, Y) :- X > 0 , X < 9 , Y > 0 , Y < 9.

wall(X, Y, 'west') :- X = 0, Y >= 0, Y < 9.
wall(X, Y, 'east') :- X = 8, Y >= 0, Y < 9.
wall(X, Y, 'north') :- Y = 0, X >= 0, X < 9.
wall(X, Y, 'south') :- Y = 8, X >= 0, X < 9.
wall(X, Y, 'west') :- X = 0, Y = 0 .
wall(X, Y, 'south') :- Y = 8, X = 2.
wall(X, Y, 'north') :- Y = 0, X = 3.
wall(X, Y, 'east') :- X = 7, Y = 7.