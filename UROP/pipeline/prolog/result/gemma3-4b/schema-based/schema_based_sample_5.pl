grid_size(9).
grid(X, Y) :- X in [0..8], Y in [0..8].
dirt(X, Y, Colour) :- X in [0..8], Y in [0..8], Colour in {'orange', 'green'}.
agent(Id, X, Y, Colour) :- X in [0..8], Y in [0..8], Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green' ;
                            X in [0..8], Y in [0..8], Id = '9af04778-08d6-4e40-8c6f-ba123d292a22', Colour = 'orange'.
empty(X, Y) :- X in [0..8], Y in [0..8].
wall(X, Y, west) :- X = 0, Y in [0..8].
wall(X, Y, south) :- Y = 0, X in [0..8].
wall(X, Y, east) :- X = 8, Y in [0..8].
wall(X, Y, north) :- Y = 8, X in [0..8].
wall(X,Y,Dir) :- X in [0..8], Y in [0..8], X = X, Y = Y, Dir in ['north', 'south', 'east', 'west'].