grid_size(8).
grid(Loc) :- Loc in [0..7], Loc in [0..7].
seen(dirt(Loc, Colour)) :- Loc in [0..7], Loc in [0..7], Colour ins [red, orange, green].
seen(agent(Id, Loc, Colour)) :- Id in ['02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'], Loc in [0..7], Loc in [0..7], Colour ins [green].
empty_location(Loc) :- Loc in [0..7], Loc in [0..7], not (seen(dirt(Loc,_)) or seen(agent(_,Loc,_))).
wall(loc(X,Y), north) :- X in [0..6], Y in [0..7].
wall(loc(X,Y), south) :- X in [0..6], Y in [1..7].
wall(loc(X,Y), east) :- X in [1..7], Y in [0..7].
wall(loc(X,Y), west) :- X in [0..6], Y in [0..7].