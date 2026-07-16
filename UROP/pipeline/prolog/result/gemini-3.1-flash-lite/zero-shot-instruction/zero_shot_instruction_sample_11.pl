size(11).
at(1, 4, dirt(orange)).
at(3, 3, dirt(orange)).
at(3, 6, dirt(orange)).
at(5, 7, dirt(orange)).
at(7, 5, dirt(green)).
at(9, 2, dirt(green)).
at(9, 7, dirt(green)).
agent(1, 0, 'd3af9897-9139-4ffe-8a15-2e9c6f06e71a', orange).
agent(5, 0, 'd6428e63-73b7-40a5-9cc9-ea3b5e61a86d', green).
is_wall(X, Y, north) :- Y = 0, X >= 0, X < 11.
is_wall(X, Y, south) :- Y = 10, X >= 0, X < 11.
is_wall(X, Y, west) :- X = 0, Y >= 0, Y < 11.
is_wall(X, Y, east) :- X = 10, Y >= 0, Y < 11.