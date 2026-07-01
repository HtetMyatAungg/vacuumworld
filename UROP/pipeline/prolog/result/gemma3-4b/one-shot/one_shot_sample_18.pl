grid_size(9).
grid(Loc) :- Loc in [0..8,0..8].
seen(dirt(Loc, Colour)) :- Loc in [0..8,0..8], Colour ins ['orange', 'green'].
seen(agent(Id, Loc, Colour)) :- Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green', Loc in [0..8,0..8].
empty_location(Loc) :- Loc in [0..8,0..8].
wall(loc(X, Y), north) :- X = 0, Y in [1..8].
wall(loc(X, Y), south) :- X = 8, Y in [1..8].
wall(loc(X, Y), east) :- Y = 0, X in [1..8].
wall(loc(X, Y), west) :- Y = 8, X in [1..8].