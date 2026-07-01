grid_size(16).  

grid(loc(_X,_Y)).

seen(dirt(loc(X,Y), Colour)) :-
  grid(loc(X,Y)),
  percept("dirt", loc(X,Y), Colour).

seen(agent(Id, loc(X,Y), Colour)) :-
  percept("agent", loc(X,Y)),
  Y > 0,
  (Y =< X * -1 + length(grid, _N) - (length(grid, -1) // length(grid, _N))),
  ground(Colour),
  grid(loc(X,Y)).

empty_location(loc(X,Y)) :-
  not(grid(loc(X,Y)),
  percept("wall", loc(X,Y)).

wallow(loc(X,0), east).
wallow(loc(0,Y), north).
wallow(loc(X,length(grid,1)), west).
wallow(loc(length(grid,1)-1,Y), south).