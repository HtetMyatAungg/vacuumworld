grid_size(9).
grid(X,Y) :- between(0, 8, X), between(0, 8, Y).
dirt(X,Y,orange) :- X in [0..8], Y in [0..8], X < 3, Y < 7.
dirt(X,Y,green) :- X in [1..4], Y in [1..7].
agent(Id,X,Y,orange) :- Id = '9af04778-08d6-4e40-8c6f-ba123d292a22', X in [0..8], Y in [0..8], X < 3, Y < 7.
agent(Id,X,Y,green) :- Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', X in [4..7], Y in [0..7].
empty(X,Y) :- X in [0..8], Y in [0..8].
wall(X,Y,west) :- X == 0, Y in [0..8].
wall(X,Y,south) :- Y == 0, X in [0..8].
wall(X,Y,east) :- X == 8.
wall(X,Y,north) :- Y == 8.