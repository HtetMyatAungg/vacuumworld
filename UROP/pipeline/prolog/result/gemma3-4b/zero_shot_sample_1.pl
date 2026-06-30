grid_size(5).
grid(loc(X, Y)) :- X >= 0, X < 5, Y >= 0, Y < 5.
seen(dirt(loc(X, Y), Colour)) :- X >= 0, X < 5, Y >= 0, Y < 5, Colour = 'orange' | Colour = 'green'.
seen(agent(Id, loc(X, Y), Colour)) :- X >= 0, X < 5, Y >= 0, Y < 5, Id = '9af04778-08d6-4e40-8c6f-ba123d292a22' | Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
empty_location(loc(X, Y)) :- X >= 0, X < 5, Y >= 0, Y < 5, not (seen(dirt(loc(X, Y), _)) or seen(agent( _, loc(X, Y), _))).

wall(loc(0, 0), 'west') :- loc(0, 0) = loc(0, 0).
wall(loc(0, 1), 'west') :- loc(0, 1) = loc(0, 1).
wall(loc(0, 2), 'west') :- loc(0, 2) = loc(0, 2).
wall(loc(0, 3), 'west') :- loc(0, 3) = loc(0, 3).
wall(loc(0, 4), 'west') :- loc(0, 4) = loc(0, 4).
wall(loc(0, 5), 'west') :- loc(0, 5) = loc(0, 5).
wall(loc(0, 6), 'west') :- loc(0, 6) = loc(0, 6).
wall(loc(0, 7), 'west') :- loc(0, 7) = loc(0, 7).

wall(loc(1, 0), 'north') :- loc(1, 0) = loc(1, 0).
wall(loc(1, 1), 'north') :- loc(1, 1) = loc(1, 1).
wall(loc(1, 2), 'north') :- loc(1, 2) = loc(1, 2).
wall(loc(1, 3), 'north') :- loc(1, 3) = loc(1, 3).
wall(loc(1, 4), 'north') :- loc(1, 4) = loc(1, 4).
wall(loc(1, 5), 'north') :- loc(1, 5) = loc(1, 5).
wall(loc(1, 6), 'north') :- loc(1, 6) = loc(1, 6).

wall(loc(2, 0), 'north') :- loc(2, 0) = loc(2, 0).
wall(loc(2, 1), 'north') :- loc(2, 1) = loc(2, 1).
wall(loc(2, 2), 'north') :- loc(2, 2) =