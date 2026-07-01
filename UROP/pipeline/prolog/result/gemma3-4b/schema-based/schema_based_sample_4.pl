grid_size(5).
grid(X, Y) :- X in [0..4], Y in [0..4].
seen(dirt(X, Y), Colour) :- X in [0..4], Y in [0..4], Colour in {'orange', 'green'}.
seen(agent(Id, X, Y), Colour) :- Id in {'9af04778-08d6-4e40-8c6f-ba123d292a22', '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'}, X in [0..4], Y in [0..4], Colour in {'orange', 'green'}.
empty_location(X, Y) :- X in [0..4], Y in [0..4].
wall(north, X, Y) :- X = 0, Y in [0..4].
wall(south, X, Y) :- X = 0, Y = 4.
wall(east, X, Y) :- X = 4, Y in [0..4].
wall(west, X, Y) :- X = 0, Y in [0..4].
wall(south, X, Y) :- X in [0..3], Y = 4.