grid_size(9).
grid(Loc) :- Loc ins [(x, y) | x in [0..8], y in [0..8]].
seen(Dirt(Loc, Colour)) :- (Loc ins [(x, y) | x in [0..8], y in [0..8]]), Colour = 'orange'|Colour = 'green'.
seen(Agent(Id, Loc, Colour)) :- Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green'.
empty_location(Loc) :- Loc ins [(x, y) | x in [0..8], y in [0..8]].
wall(loc(X, Y), north) :- X in [0..8], Y = 0.
wall(loc(X, Y), south) :- X in [0..8], Y = 8.
wall(loc(X, Y), east) :- Y in [0..8], X = 8.
wall(loc(X, Y), west) :- Y in [0..8], X = 0.