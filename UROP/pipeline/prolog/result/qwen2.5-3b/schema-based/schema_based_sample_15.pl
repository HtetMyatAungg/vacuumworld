grid_size(8).

% Section A — Translation facts:
grid(loc(_,0)).
grid(loc(0,_)).

seen(dirt(loc(X,Y), "green")) :-
  X > -1, X < 8, Y > -1, Y < 8.

seen(dirt(loc(X,Y), "orange")) :-
  X > -1, X < 8, Y > -1, Y < 8.

seen(agent(Id, loc(X,Y), "green")) :-
  seen(agent(Id2, _, _) ),
  Id \= Id2,
  X > -1, X < 8, Y > -1, Y < 8,
  grid(loc(X,Y)).

seen(agent(Id, loc(X,Y), "orange")) :-
  seen(agent(Id2, _, _)),
  Id \= Id2,
  X > -1, X < 8, Y > -1, Y < 8,
  grid(loc(X,Y)).

empty_location(loc(X,Y)) :-
  \+ seen(dirt(loc(X,Y),_)),
  \+ seen(agent(_,loc(X,Y)),_),
  X > -1, X < 8, Y > -1, Y < 8.

% Section B — Wall rules:
walk_west(walk(loc(X,0), "west") ) :-
  X > -1, X < 8, grid(loc(X,0)).

walk_east(walk(loc(7,Y), "east")) :-
  Y > -1, Y < 8, grid(loc(7,Y)).

wall_south(wall(loc(X,Y),"south")) :-
  X > -1, X < 8.

wall_north(walk(loc(X,Y),"north")) :-
  Y > -1, Y < 8.