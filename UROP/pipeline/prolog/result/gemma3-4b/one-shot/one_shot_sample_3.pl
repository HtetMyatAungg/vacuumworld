grid_size(8).
grid(X,Y) :- X in [1..8], Y in [1..8].
dirt(4,7,'orange').
dirt(5,1,'green').
dirt(7,0,'orange').
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',4,0,'green').
empty(X,Y) :- X in [1..8], Y in [1..8].
wall(X,Y,N) :- X in [1..8], Y in [1..8], Y == 1, X > 0, X < 8.
wall(X,Y,S) :- X in [1..8], Y in [1..8], Y == 8, X > 0, X < 8.
wall(X,Y,E) :- X in [1..8], Y in [1..8], X == 8, Y > 0, Y < 8.
wall(X,Y,W) :- X in [1..8], Y in [1..8], X == 1, Y > 0, Y < 8.