grid_size(8).
grid(X,Y) :- between(0,7,X), between(0,7,Y).
dirt(X,Y,Color) :- between(0,7,X), between(0,7,Y), (Color = null or Color = 'green' or Color = 'orange').
agent(Id,X,Y,Color) :- between(0,7,X), between(0,7,Y), Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Color = 'green'.
empty(X,Y) :- between(0,7,X), between(0,7,Y).
wall(X, Y, north) :- X in [0..7], Y = 7.
wall(X, Y, south) :- X in [0..7], Y < 8, Y > 0.
wall(X, Y, west) :- X > 0, X < 8, Y in [0..7].
wall(X, Y, east) :- X >= 0, X < 8, Y in [0..7].