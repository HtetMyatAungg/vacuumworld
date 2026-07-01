grid_size(8).
grid(loc(x, y)) :- x in [0..7], y in [0..7].
seen(dirt(loc(x,y), c)) :- x in [0..7], y in [0..7], c = 'orange' | c = 'green'.
seen(agent(id, loc(x,y), c)) :- x in [0..7], y in [0..7], c = 'green'.
empty_location(loc(x, y)) :- x in [0..7], y in [0..7].

wall(loc(x, y), north)     :- x in [0..7], y in [0..7], y < 8.
wall(loc(x, y), south)      :- x in [0..7], y in [0..7], y > 0.
wall(loc(x, y), east)       :- x in [0..7], y in [0..7], x < 8.
wall(loc(x, y), west)       :- x in [0..7], y in [0..7], x > 0.