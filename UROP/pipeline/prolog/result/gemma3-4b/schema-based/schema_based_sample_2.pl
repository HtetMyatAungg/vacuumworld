grid_size(8).
grid(X,Y) :- X in [0..7], Y in [0..7].
dirt(X,Y,orange) :- X in [3..7], Y in [0..7].
dirt(X,Y,green) :- X in [5..7], Y in [1..7].
agent(Id,X,Y,orange) :- X in [3..7], Y in [0..7], Id = '9af04778-08d6-4e40-8c6f-ba123d292a22'.
agent(Id,X,Y,green) :- X in [5..7], Y in [0..7], Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
empty(X,Y) :- X in [0..7], Y in [0..7].
wall(X,Y,west) :- X > 0.
wall(X,Y,south) :- Y > 0.
wall(X,Y,east) :- X < 7.
wall(X,Y,north) :- Y < 7.