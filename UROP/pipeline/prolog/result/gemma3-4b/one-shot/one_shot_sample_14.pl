grid_size(8).
grid(loc(X, Y)) :- X is 0..(7), Y is 0..(7).
seen(dirt(loc(X, Y), Colour)) :- X is 0..(7), Y is 0..(7), Colour = dirt, X >= 0, X <= 7, Y >= 0, Y <= 7.
seen(agent(Id, loc(X, Y), Colour)) :- X is 0..(7), Y is 0..(7), Id in agents, Colour = green, X >= 0, X <= 7, Y >= 0, Y <= 7.
empty_location(loc(X, Y)) :- X is 0..(7), Y is 0..(7), not (seen(dirt)(X, Y) or seen(agent)(X, Y)).
wall(loc(X, Y), north) :- X is 0..(7), Y is 0.
wall(loc(X, Y), south) :- X is 0..(7), Y is 7.
wall(loc(X, Y), east) :- Y is 0..(7), X is 7.
wall(loc(X, Y), west) :- Y is 0..(7), X is 0.