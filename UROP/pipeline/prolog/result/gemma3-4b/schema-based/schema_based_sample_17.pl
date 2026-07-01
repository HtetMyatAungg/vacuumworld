grid_size(8).
grid(X, Y) :- X in [0..7], Y in [0..7].
seen(dirt(X, Y, C)) :- X in [0..7], Y in [0..7], C = 'orange' | C = 'green', Z in [0..7], Y in [0..7], Z in [0..7], Y in [0..7].
seen(agent(ID, X, Y, C)) :- ID = '9af04778-08d6-4e40-8c6f-ba123d292a22', C = 'orange' | C = 'green', X in [0..7], Y in [0..7].
seen(empty_location(X, Y)) :- X in [0..7], Y in [0..7].
wall(north, loc(0, Y)) :- Y in [0..7].
wall(south, loc(0, Y)) :- Y in [0..7].
wall(east, loc(X, 7)) :- X in [0..7].
wall(west, loc(X, 0)) :- X in [0..7].