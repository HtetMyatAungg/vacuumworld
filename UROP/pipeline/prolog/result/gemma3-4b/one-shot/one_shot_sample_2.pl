grid_size(8).
grid(loc(X,Y)) :- X in [0..7], Y in [0..7].
seen(dirt(loc(X,Y), Colour)) :- X in [0..7], Y in [0..7], Colour insitu[dirt].
seen(agent(Id, loc(X,Y), Colour)) :- X in [0..7], Y in [0..7], Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour insitu[agent].
empty_location(loc(X,Y)) :- X in [0..7], Y in [0..7].
wall(loc(X,Y), north) :- X = 0, Y in [0..7].
wall(loc(X,Y), south) :- X = 7, Y in [0..7].
wall(loc(X,Y), east) :- Y = 0, X in [0..7].
wall(loc(X,Y), west) :- Y = 7, X in [0..7].