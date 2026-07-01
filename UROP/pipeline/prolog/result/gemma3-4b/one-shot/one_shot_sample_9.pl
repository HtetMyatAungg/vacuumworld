grid_size(8).
grid(loc(X,Y)) :- X in [0..7], Y in [0..7].
seen(dirt(loc(X,Y),Colour)) :- X in [0..7], Y in [0..7], Colour in [1..6], Colour = Colour.
seen(agent(Id, loc(X,Y), Colour)) :- X in [0..7], Y in [0..7], Id == '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour in [1..6], Colour = Colour.
empty_location(loc(X,Y)) :- X in [0..7], Y in [0..7], not (seen(dirt(loc(X,Y), _)) or seen(agent(_, loc(X,Y), _))).
wall(loc(X,Y), north) :- X in [0..7], Y = 0.
wall(loc(X,Y), south) :- X in [0..7], Y = 7.
wall(loc(X,Y), east) :- Y in [0..7], X = 7.
wall(loc(X,Y), west) :- Y in [0..7], X = 0.