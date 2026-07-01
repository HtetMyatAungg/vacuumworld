grid_size(N).
grid(loc(X,Y)).
seen(dirt(loc(X,Y), Colour)).
seen(agent(Id, loc(X,Y), Colour)).
empty_location(loc(X,Y)).
wall(loc(X,Y), north) :- X < 5.
wall(loc(X,Y), south) :- X > 0.
wall(loc(X,Y), east) :- Y < 7.
wall(loc(X,Y), west) :- Y > 0.