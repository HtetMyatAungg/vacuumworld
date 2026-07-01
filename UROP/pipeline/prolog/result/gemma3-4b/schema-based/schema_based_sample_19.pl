grid_size(N).
grid(X, Y).
seen(Dirt, X, Y, Colour).
seen(Agent, X, Y, Colour).
empty_location(X, Y).
wall(loc(X, Y), North).
wall(loc(X, Y), South).
wall(loc(X, Y), East).
wall(loc(X, Y), West).