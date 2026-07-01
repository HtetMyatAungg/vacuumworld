grid_size(8).
grid(Loc) :- Loc ins [0..7, 0..7].
seen(dirt(Loc, Colour)) :- Loc ins [0..7, 0..7], Colour in {'orange', 'green'}.
seen(agent(Id, Loc, Colour)) :- Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = green, Loc ins [0..7, 0..7].
empty_location(Loc) :- Loc ins [0..7, 0..7].
wall(loc(X, Y), north) :- X in [1..7], Y in [0..7].
wall(loc(X, Y), south) :- X in [1..7], Y in [1..7].
wall(loc(X, Y), east) :- X in [0..7], Y in [1..7].
wall(loc(X, Y), west) :- X in [1..7], Y in [0..7].