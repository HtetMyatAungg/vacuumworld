grid_size(N).
grid(X, Y) :- X >= 0, X < N, Y >= 0, Y < N.
dirt(X, Y, Colour) :- X >= 0, X < N, Y >= 0, Y < N, Colour = 'orange' | Colour = 'green'.
agent(Id, X, Y, Colour) :- X >= 0, X < N, Y >= 0, Y < N, Colour = 'orange' | Colour = 'green'.
empty(X,Y) :- X>=0, X<N, Y>=0, Y<N.

wall(X, Y, west) :- X > 0, X < N, Y = 0.
wall(X, Y, south) :- Y > 0, Y < N, X = 0.
wall(X, Y, east) :- X > 0, X < N, Y = N - 1.
wall(X, Y, north) :- Y > 0, Y < N, X = N - 1.