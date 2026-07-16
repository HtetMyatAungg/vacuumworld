grid_size(11).
at(1, 4, dirt(orange)).
at(3, 3, dirt(orange)).
at(3, 6, dirt(orange)).
at(5, 7, dirt(orange)).
at(7, 5, dirt(green)).
at(9, 2, dirt(green)).
at(9, 7, dirt(green)).
at(1, 0, agent(d3af9897-9139-4ffe-8a15-2e9c6f06e71a, orange)).
at(5, 0, agent(d6428e63-73b7-40a5-9cc9-ea3b5e61a86d, green)).
wall(X, Y, Direction) :- grid_size(N), Limit is N - 1, (
  (X = 0, Direction = west) ;
  (X = Limit, Direction = east) ;
  (Y = 0, Direction = north) ;
  (Y = Limit, Direction = south)
).