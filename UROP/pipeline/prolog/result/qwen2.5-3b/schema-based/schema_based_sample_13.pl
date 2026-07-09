grid_size(8),
grid(X,Y) :-
  X1 is floor((X / 8)) - int(Y=7/8),
  X2 is Y + X * 8,
  grid(X1, Y1), grid(Y1, X1); empty(X,Y).
dirt(6,3,orange) :-
  dirt(_,_,_,Id,_Y,"orange"), agent(Id, _, _, _Colour).
empty(X,Y) :-
  X < 8, Y < 8, \+ grid(X, Y).
wall(EastNorth,X,Y,north).
walld(SouthEast,EastSouth,X,Y,south).
walld(NorthWest,EastNortheast,X,Y,north).
empty(EastWest,WestEast,X,Y,west).
walld(WestNortheast,NorthwestNortheast,Y,northeast).