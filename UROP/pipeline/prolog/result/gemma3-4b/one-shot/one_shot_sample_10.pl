grid_size(8).
grid(loc(X,Y)) :- \+ (X < 0 | X > 7 | Y < 0 | Y > 7).
seen(dirt(loc(X,Y),Colour)) :- X >= 0, X <= 7, Y >= 0, Y <= 7, Colour `in` {'orange','green'}.
seen(agent(Id,loc(X,Y),Colour)) :- X >= 0, X <= 7, Y >= 0, Y <= 7, Id `= ''`, Colour = 'green'.
empty_location(loc(X,Y)) :- X >= 0, X <= 7, Y >= 0, Y <= 7.
wall(loc(X, Y), north) :- X >= 0, X <= 7, Y = 0.
wall(loc(X, Y), south) :- X >= 0, X <= 7, Y = 7.
wall(loc(X, Y), east) :- Y >= 0, Y <= 7, X = 7.
wall(loc(X, Y), west) :- Y >= 0, Y <= 7, X = 0.