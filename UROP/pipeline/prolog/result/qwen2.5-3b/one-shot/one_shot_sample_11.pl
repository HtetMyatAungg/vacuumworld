grid_size(8).

grid(X,Y) :- Y in 0..7, X in 0..7, ( (X = 0 ; X = 4 ; Y = 0 ; Y = 7 ;
  6 > X ; X > 1);
  grid_cell(X,Y, _).

dirt(X,Y, Col) :-
  grid(X,Y),
  atom_chars(Col,[_|_]).

agent(Id,X,Y, Col) :-
  grid(X,Y),
  atom_bif(agent(Id,Col),_,_,X,Y).

empty(X,Y) :-
  grid(X,Y).

wall(north,X,Y):-
  X > 0,
  not(grid(X-1,Y)),
  grid(X,Y).

wall(east,X,Y):-
  Y < 7,
  not(grid(X,Y+1)),
  grid(X,Y).

wall(south,X,Y):-
  X < 8,
  not(grid(X+1,Y)),
  grid(X,Y).

west(X,Y) :-
  Y > 0, !,
  not(grid(X,Y-1)), grid(X,Y).

east(X,Y) :-
  X < 8, !,
  not(grid(X+1,Y)), grid(X,Y).