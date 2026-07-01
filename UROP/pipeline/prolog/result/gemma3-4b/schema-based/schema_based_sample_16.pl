grid_size(5).
grid(loc(X,Y)) :- X in [0..4], Y in [0..4].
seen(dirt(loc(X,Y), Colour)) :- X in [0..4], Y in [0..4], Colour ins ('orange', 'green').
seen(agent(Id, loc(X,Y), Colour)) :- X in [0..4], Y in [0..4], Id like '0*.*', Colour ins ('orange', 'green').
empty_location(loc(X,Y)) :- X in [0..4], Y in [0..4].
wall(loc(X, Y), north) :- X in [0..3], Y = 0.
wall(loc(X, Y), south) :- X in [0..3], Y = 4.
wall(loc(X, Y), east) :- Y in [0..3], X = 4.
wall(loc(X, Y), west) :- Y in [0..3], X = 0.