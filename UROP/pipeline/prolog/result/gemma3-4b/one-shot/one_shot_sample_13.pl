grid_size(8).
grid(Loc) :- Loc ins [(X, Y) | (X, Y) <- [0..7] * [0..7]].
seen(dirt(Loc, orange)) :- X in [0..7], Y in [0..7], X >= 0, X <= 7, Y >= 0, Y <= 7, Loc = (X,Y).
seen(dirt(Loc, green)) :- X in [0..7], Y in [0..7], X >= 0, X <= 7, Y >= 0, Y <= 7, Loc = (X,Y).
seen(agent(Id, Loc, green)) :- X in [0..7], Y in [0..7], X >= 0, X <= 7, Y >= 0, Y <= 7, Id = "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", Loc = (X,Y).
empty_location(Loc) :- X in [0..7], Y in [0..7], not (seen(dirt(X, Y), _) or seen(agent(_, X, Y), _)).
wall(loc(X,Y), north) :- X = 0, Y in [0..7].
wall(loc(X,Y), south) :- X = 7, Y in [0..7].
wall(loc(X,Y), east) :- Y = 0, X in [1..7].
wall(loc(X,Y), west) :- Y = 7, X in [1..7].