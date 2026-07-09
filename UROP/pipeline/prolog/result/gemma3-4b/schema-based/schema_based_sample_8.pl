grid_size(8).
grid(X,Y) :- X is X, Y is Y, X in [0..7], Y in [0..7].
dirt(X,Y,Colour) :- X is X, Y is Y, Colour ins ['orange','green'], X in [0..7], Y in [0..7].
agent(Id,X,Y,Colour) :- X is X, Y is Y, Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour ins ['orange','green'], X in [0..7], Y in [0..7].
empty(X,Y) :- X is X, Y is Y, X in [0..7], Y in [0..7].

wall(X,Y,west) :- X = 0, Y in [0..7].
wall(X,Y,south) :- Y = 0, X in [0..7].
wall(X,Y,east) :- X = 7, Y in [0..7].
wall(X,Y,north) :- Y = 7, X in [0..7].