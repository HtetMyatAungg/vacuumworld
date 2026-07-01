grid_size(5).
grid(loc(X, Y)) :- X >= 0, X < 5, Y >= 0, Y < 5.
seen(dirt(loc(X, Y), Colour)) :- X >= 0, X < 5, Y >= 0, Y < 5, Colour = 'orange' | Colour = 'green'.
seen(agent(Id, loc(X, Y), Colour)) :- X >= 0, X < 5, Y >= 0, Y < 5, Id = '9af04778-08d6-4e40-8c6f-ba123d292a22' | Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
empty_location(loc(X, Y)) :- X >= 0, X < 5, Y >= 0, Y < 5.
wall(loc(X, Y), west) :- X = 0, Y >= 0, Y < 5.
wall(loc(X, Y), east) :- X = 4, Y >= 0, Y < 5.
wall(loc(X, Y), north) :- Y = 0, X >= 0, X < 5.
wall(loc(X, Y), south) :- Y = 4, X >= 0, X < 5.
wall(loc(X, Y), south) :- Y = 4, X = 2, true.
wall(loc(X, Y), north) :- Y = 0, X = 2, true.
wall(loc(X, Y), west) :- X = 0, Y = 6, true.
wall(loc(X, Y), east) :- X = 4, Y = 6, true.
wall(loc(X, Y), south) :- Y = 4, X = 3, true.