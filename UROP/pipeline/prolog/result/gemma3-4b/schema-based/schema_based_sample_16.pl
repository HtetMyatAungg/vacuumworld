grid_size(5).
grid(X, Y) :- X in [0..4], Y in [0..4].
dirt(X, Y, Colour) :- X in [0..4], Y in [0..4], Colour insitu('orange', 'green').
agent(Id, X, Y, Colour) :- X in [0..4], Y in [0..4], Id isa string, Colour insitu('orange','green').
empty(X,Y) :- X in [0..4], Y in [0..4].

wall(X, Y, west) :- X = 0, Y in [0..4].
wall(X, Y, south) :- Y = 0, X in [0..4].
wall(X, Y, east) :- X = 4, Y in [0..4].
wall(X, Y, north) :- Y = 4, X in [0..4].