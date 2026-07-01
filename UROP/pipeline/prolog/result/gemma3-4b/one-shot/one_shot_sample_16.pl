grid_size(8).
grid(X,Y) :- X in [0..7], Y in [0..7].
seen(dirt(X,Y), orange) :- X in [4..7], Y in [6..7].
seen(dirt(X,Y), green) :- X in [5..7], Y in [1..7].
seen(agent(id, X,Y), green) :- X = 0, Y = 0, id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
empty_location(X,Y) :- X in [0..7], Y in [0..7].
wall(loc(X,Y), north) :- X in [0..7], Y = 0.
wall(loc(X,Y), south) :- X in [0..7], Y = 7.
wall(loc(X,Y), east) :- Y in [0..7], X = 7.
wall(loc(X,Y), west) :- Y in [0..7], X = 0.