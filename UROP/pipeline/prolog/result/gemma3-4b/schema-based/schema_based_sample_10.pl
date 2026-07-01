grid_size(9).
grid(loc(X, Y)) :- X in [0..8], Y in [0..8].
seen(dirt(loc(X, Y), Colour)) :- X in [0..8], Y in [0..8], Colour ins ['orange', 'green'].
seen(agent(Id, loc(X, Y), Colour)) :- Id in {'9af04778-08d6-4e40-8c6f-ba123d292a22', '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'}, X in [0..8], Y in [0..8], Colour ins ['orange', 'green'].
empty_location(loc(X, Y)) :- X in [0..8], Y in [0..8].
wall(loc(X, Y), north) :- X in [0..8], Y = 0.
wall(loc(X, Y), south) :- X in [0..8], Y = 8.
wall(loc(X, Y), east) :- Y in [0..8], X = 8.
wall(loc(X, Y), west) :- Y in [0..8], X = 0.