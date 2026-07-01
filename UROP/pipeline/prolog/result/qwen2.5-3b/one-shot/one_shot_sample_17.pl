grid_size(10).

seen(dirt(loc(X,Y), green)) :-
  elementof(X, [0..8]),
  elementof(Y, [0..9]).

seen(dirt(loc(X,Y), orange)) :-
  elementof(X, [0..8]),
  elementof(Y, [0..9]),
  not(grid(loc(X,Y)), seen(agent(_,loc(X,Y),_))).

seen(agent(Id, loc(X,Y), green)) :-
  elementof(X, [0..8]),
  elementof(Y, [0..9]).

seen(agent(Id, loc(X,Y), orange)) :-
  elementof(X, [0..8]),
  elementof(Y, [0..9]),
  not(grid(loc(X,Y)), seen(dirt(loc(X,Y),_)), not(seen(agent(_,loc(X,Y), green)))).

seen_empty(loc(X,Y)) :-
  elementof(X, [0..8]),
  elementof(Y, [0..9]),
  not(grid(loc(X,Y)), seen(dirt(loc(X,Y),_), seen(agent(_,loc(X,Y),_), _))).

walon(loc(I,J), north).
walon(loc(I,J), south).
walon(loc(I,J), west).