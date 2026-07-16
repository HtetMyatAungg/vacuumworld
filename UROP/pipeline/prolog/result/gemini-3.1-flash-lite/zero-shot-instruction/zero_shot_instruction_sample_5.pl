grid_size(11).
at(1, 4, dirt(orange)).
at(3, 3, dirt(orange)).
at(3, 6, dirt(orange)).
at(5, 7, dirt(orange)).
at(7, 5, dirt(green)).
at(9, 2, dirt(green)).
at(9, 7, dirt(green)).
at(1, 0, agent(d3af9897, orange)).
at(5, 0, agent(d6428e63, green)).
wall(X, Y, north) :- Y = 0, X >= 0, X =< 10.
wall(X, Y, south) :- Y = 10, X >= 0, X =< 10.
wall(X, Y, west) :- X = 0, Y >= 0, Y =< 10.
wall(X, Y, east) :- X = 10, Y >= 0, Y =< 10.