grid_size(9).
grid(X,Y) :- X >= 0, X < 9, Y >= 0, Y < 9.
seen(dirt(X,Y), Colour) :- X in [0..8], Y in [0..8], (mod(X,2) = 0 and mod(Y,2) = 0 -> Colour = 'orange'; Colour = 'green').
seen(agent(Id, X, Y), Colour) :- Id = "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", X in [0..8], Y in [0..8], Colour = 'green'.
empty_location(X,Y) :- X in [0..8], Y in [0..8], not (seen(dirt(_,X), _ ) and seen(agent(_,X,_), _) ).

wall(X,Y,North) :- X in [0..8], Y = 8.
wall(X,Y,South) :- X in [0..8], Y in [0..7].
wall(X,Y,East) :- Y in [0..8], X = 8.
wall(X,Y,West) :- Y in [0..8], X in [0..7].