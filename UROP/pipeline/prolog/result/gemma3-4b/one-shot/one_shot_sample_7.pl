grid_size(8).
grid(loc(X,Y)) :- X in [0..7], Y in [0..7].
seen(dirt(loc(X,Y), Colour)) :- X in [0..7], Y in [0..7], Colour in ['green', 'orange'].
seen(agent(Id, loc(X,Y), Colour)) :- X in [0..7], Y in [0..7], Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green'.
empty_location(loc(X,Y)) :- X in [0..7], Y in [0..7].
wall(loc(X, Y), north) :- X in [0..7], Y in [0..7], Y < 8.
wall(loc(X, Y), south) :- X in [0..7], Y in [0..7], Y > 0.
wall(loc(X, Y), east) :- X in [0..7], Y in [0..7], X < 8.
wall(loc(X, Y), west) :- X in [0..7], Y in [0..7], X > 0.