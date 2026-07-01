grid_size(8).
grid(X, Y) :- X in [0..7], Y in [0..7].
empty_location(loc(X, Y)) :- X in [0..7], Y in [0..7].
seen_dirt(dirt(loc(X,Y), Colour)) :- X in [0..7], Y in [0..7], Colour = null.
seen_dirt(dirt(loc(0, 7), null)).
seen_dirt(dirt(loc(1, 7), null)).
seen_dirt(dirt(loc(2, 7), null)).
seen_dirt(dirt(loc(0, 5), null)).
seen_dirt(dirt(loc(1, 5), null)).
seen_dirt(dirt(loc(2, 5), null)).
seen_dirt(dirt(loc(0, 4), null)).
seen_dirt(dirt(loc(1, 4), null)).
seen_dirt(dirt(loc(2, 4), null)).
seen_dirt(dirt(loc(0, 3), null)).
seen_dirt