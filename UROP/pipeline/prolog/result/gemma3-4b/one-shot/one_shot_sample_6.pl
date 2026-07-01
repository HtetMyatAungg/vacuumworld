grid_size(9).
grid(Loc) :- Loc in [0..8, 0..8].
seen(dirt(Loc, Colour)) :- Loc in [0..8, 0..8], Colour `in` ['orange', 'green'].
seen(agent(Id, Loc, Colour)) :- Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green', Loc in [0..8, 0..8].
empty_location(Loc) :- Loc in [0..8, 0..8].
wall(loc(X, Y), north) :- X in [0..8], Y = 0.
wall(loc(X, Y), south) :- X in [0..8], Y = 8.
wall(loc(X, Y), east) :- Y in [0..8], X = 8.
wall(loc(X, Y), west) :- Y in [0..8], X = 0.