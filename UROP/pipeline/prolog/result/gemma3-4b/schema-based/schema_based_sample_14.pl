grid_size(N).
grid(loc(X, Y)).
seen(dirt(loc(X, Y), Colour)).
seen(agent(Id, loc(X, Y), Colour)).
empty_location(loc(X, Y)).
wall(loc(X, Y), N) :- X < 0 ,Y < 0.
wall(loc(X, Y), E) :- X > N, Y < 0.
wall(loc(X, Y), S) :- X < 0 , Y > N.
wall(loc(X, Y), W) :- X > N, Y > N.
wall(loc(X, Y), N) :- X < 0 ,Y > N.
wall(loc(X, Y), E) :- X > N,Y < 0.