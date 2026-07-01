grid_size(8).

grid(loc(_X,_Y)) :-
  L is _X * _Y - 1,
  sum_list(Dims, L),
  (member(a,(Dims), [north|Rest]) -> north_wall(loc(X,Y)); member(n,(Dims), [south|Rest]) -> south_wall(loc(X,Y)); X is mod(_X-1,Ldims); X = 0 ),
  (member(e,(Dims), [east|Rest]) -> east_wall(loc(X,Y)); member(w,(Dims), [west|Rest]) -> west_wall(loc(X,Y)), Y is _Y+1),
  (member(w,(Dims), [west|Rest]) -> Y = _Y; X < _X-1),
  sum_list(DimsOut, Ldims).

sum_list([],0) :- !.
sum_list([H|T],Sum) :-
  H > 0,
  Sum is H + sum_list(T,H).
empty_location(loc(_X,_Y)) :-
  grid(loc(_X,_Y)),
  \+ seen(dirt(loc(_X,_Y),_Colour)),
  \+ seen(agent(_Id,loc(_X,_Y),_Colour)).