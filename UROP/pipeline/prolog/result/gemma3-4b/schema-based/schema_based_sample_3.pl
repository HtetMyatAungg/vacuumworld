grid_size(9).
grid(loc(X, Y)) :- X in [0..8], Y in [0..8].
seen(dirt(loc(X, Y), Colour)) :- X in [0..8], Y in [0..8], Colour = 'orange' ; seen(dirt(loc(X,Y),Colour)) :- X in [0..8], Y in [0..8], Colour = 'green'.
seen(agent(Id, loc(X, Y), Colour)) :- X in [0..8], Y in [0..8], Id = '9af04778-08d6-4e40-8c6f-ba123d292a22', Colour = 'orange' ; seen(agent(Id, loc(X,Y),Colour)) :- X in [0..8], Y in [0..8], Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green'.
empty_location(loc(X, Y)) :- X in [0..8], Y in [0..8].
wall(north, loc(X, Y