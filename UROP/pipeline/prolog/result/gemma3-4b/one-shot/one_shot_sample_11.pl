grid_size(9).
grid(X,Y) :- between(0,8,X), between(0,8,Y).
seen(dirt(X, Y, Colour)) :- X in [0..8], Y in [0..8], Colour ins ['orange','green'].
seen(agent(ID, X, Y, Colour)) :- X in [0..8], Y in [0..8], ID = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = green.
empty_location(X,Y) :- X in [0..8], Y in [0..8].
wall(north, loc(X, Y)) :- X = 0, between(0, 8, Y).
wall(south, loc(X, Y)) :- X = 8, between(0, 8, Y).
wall(east, loc(X, Y)) :- Y = 0, between(0, 8, X).
wall(west, loc(X, Y)) :- Y = 8, between(0, 8, X).
wall(north,loc(7,7)) :- true.
wall(south, loc(7,7)) :- true.
wall(east,loc(7,0)) :- true.
wall(west, loc(7,8)) :- true.