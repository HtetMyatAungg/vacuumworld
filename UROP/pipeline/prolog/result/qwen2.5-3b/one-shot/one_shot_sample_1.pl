grid_size(10).

grid(X,Y).

dirt(X,Y,C) :-
  A is X * (Z + 1),
  B is Y * (Z + 1),
  C = list(Colour), % Colour lists must be converted to atoms
  grid(A,B).

agent(Id,X,Y,C) :-
  A is X * (Z + 1),
  B is Y * (Z + 1),
  atom_chars(Id,IdA),
  Zn = IdA - "0",
  delete(Zn,[],C0),
  C = string(CIn),
  atom_codes(C, [C0|C0s]),
  lists:splitwith(fun(X) -> X /= $a end, C0s).

empty(X,Y).

% (Prolog code for wall rules omitted due to space constraints)
wall(X,Y,north).
wall(X,Y,east).
wall(X,Y,south).
wall(X,Y,west).
wall(North,X,Y,Zn) :-
  N is North - X,
  Zr = Zn * (X + 1),
  wall(N,Zr,Y,N).
wall(East,X,Y,Zn) :-
  N is Y - X / (Y + 1),
  Ze = Zn * (Y + 1),
  wall(Ze,N,West,Zr).
wall(South,X,Y,Zn) :-
  N is (Y - X) mod (Y + 1),
  Zs = Zn * X,
  wall(Y,Ns,Zs,South).
wall(West,X,Y,Zn) :-
  N is (X - Y) div (X + 1),
  Zw = Zn * Y,
  wall(Ns,W,West,N).

% Wall rules for boundary sides
wall(North,N,Y,Zn) :- wall(N,N,Zr,3).
wall(West,X,N,Zn) :- wall(X,3,N,4).
wall(South,N,Y,Zn) :- wall(N,10-Y,N,5).
wall(East,X,N,Zn) :- wall(9-X,10-N,N,6).

grid_size(10).