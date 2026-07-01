grid_size(9).
grid(X,Y) :- X in [0..8], Y in [0..8].
seen(dirt(X,Y,Colour)) :- X in [0..8], Y in [0..8], Colour in {'red', 'orange', 'green'}.
seen(agent(ID,X,Y,Colour)) :- X in [0..8], Y in [0..8], ID = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour in {'green'}.
empty_location(X,Y) :- X in [0..8], Y in [0..8].
wall(loc(X,Y),north) :- X = 0, Y in [1..8].
wall(loc(X,Y),south) :- X = 8, Y in [1..8].
wall(loc(X,Y),east) :- Y = 0, X in [1..8].
wall(loc(X,Y),west) :- Y = 8, X in [1..8].