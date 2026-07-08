grid_size(10).

grid(X,Y, Z,W) :-
  (X =< 7),!,
  (Y = Z), (W = W).

agent(Id,X,Y,C,G) :-
  (X =< 7),!,
  (Y = Z), (W = U), (id(Id,Z,U,G,C)).

dirt(X,Y, C,Z) :-
  (X =< 7),!,
  (Y = Z), (w1(W)), (C = Z).

wall(X,Y,S) :-
  X == 0,!,
  (S == west ; S == south).

wall(X,Y,S) :-
  Y == side_length-1,!,
  (S == east ; S == south).

wall(X,Y,E) :-
  X == side_length-1,!,
  (E == north ; E == east).

wall(_,_,_):- \+true.

side_length(gridSize, Z,W) :-
  (gridSize = Z,!,
  W = Z) ;
  (gridSideLen(Z,C), 
 	side_length(2*C-2,Z,W),
	ord_above(C,Z)).

ord_above(_C,A,B) :- A < B.
ord_above(CA,CB,A,_) :- CA > CB, !.
ord_above(A,_CB,C, _) :- C =< A.

side_length(N, N, 1).

agent(Id,X,Y,C, Z, W) :-
  grid(X,Y,XW,YH) ,
  atom_concat(Id,'-',X),
  atom_concat(YH,W,Z).

wall(_,_,_):- \+true.