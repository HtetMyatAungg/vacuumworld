
initiatesAt(move(north), at(X,Y1), T) :- holdsAt(at(X,Y),T), \+ wallAt(X,Y,north), Y1 is Y - 1.
terminatesAt(move(north), at(X,Y),  T) :- holdsAt(at(X,Y),T), \+ wallAt(X,Y,north).

initiatesAt(move(south), at(X,Y1), T) :- holdsAt(at(X,Y),T), \+ wallAt(X,Y,south), Y1 is Y + 1.
terminatesAt(move(south), at(X,Y),  T) :- holdsAt(at(X,Y),T), \+ wallAt(X,Y,south).

initiatesAt(move(east),  at(X1,Y), T) :- holdsAt(at(X,Y),T), \+ wallAt(X,Y,east),  X1 is X + 1.
terminatesAt(move(east),  at(X,Y),  T) :- holdsAt(at(X,Y),T), \+ wallAt(X,Y,east).

initiatesAt(move(west),  at(X1,Y), T) :- holdsAt(at(X,Y),T), \+ wallAt(X,Y,west),  X1 is X - 1.
terminatesAt(move(west),  at(X,Y),  T) :- holdsAt(at(X,Y),T), \+ wallAt(X,Y,west).