grid_size(3).
grid(X,Y) :- X in [0,1,2], Y in [0,1,2].
seen(dirt(X,Y,Colour)) :- X in [0..2], Y in [0..2], Colour insitu(['orange', 'green']).
seen(agent(ID,X,Y,Colour)) :- X in [0..2], Y in [0..2], ID = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour insitu(['green']).
empty_location(X,Y) :- X in [0..2], Y in [0..2].
wall(loc(X,Y),north) :- X = 0, Y in [0,1,2].
wall(loc(X,Y),south) :- X = 2, Y in [0,1,2].
wall(loc(X,Y),east) :- Y = 0, X in [1,2].
wall(loc(X,Y),west) :- Y = 2, X in [1,2].