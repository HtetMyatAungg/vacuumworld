grid_size(9).
grid(loc(X,Y)) :- X in [0..8], Y in [0..8].
seen(dirt(loc(X,Y), Colour)) :- X in [0..8], Y in [0..8], Colour ins ['orange', 'green'].
seen(agent(Id, loc(X,Y), Colour)) :- X in [0..8], Y in [0..8], Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = green.
empty_location(loc(X,Y)) :- X in [0..8], Y in [0..8], not (seen(dirt(loc(X,Y), _)) or seen(agent(_, loc(X,Y), _))).
wall(loc(X, Y), north) :- X = 0, Y in [1..8].
wall(loc(X, Y), south) :- X = 8, Y in [1..8].
wall(loc(X, Y), east) :- Y = 0, X in [1..8].
wall(loc(X, Y), west) :- Y = 8, X in [1..8].