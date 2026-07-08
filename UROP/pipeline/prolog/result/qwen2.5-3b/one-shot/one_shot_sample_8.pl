grid_size(11).

grid(X,Y) :-
  between(0,X,10), between(0,Y,10).

dirt(X,Y, Colour) :-
  grid(X,Y),
  nonvar(Colour),
  memberchk(dirt(X,Y,_Color), _),

agent(Id,X,Y,Colour) :-
  \+ nonvar(Id),
  \+ nonvar(Colour),
  grid(X,Y),
  memberchk(agent(Id,X,Y,_Color), _).

empty(X,Y) :-
  \+ grid_size(11), (between(0,X,10), between(0,Y,10); grid(X,Y)),
  \+ dirt(_,_,_),
  \+ agent(_,_,_).

wall(North,X,Y) :- Y == 0, not((X == N or X == N-1)).
wall(South,N,X,Y) :- Y == size, not((X == S or X == S-1)).

wall(West,X,Y) :- X == 0.
wall(East,N,X,Y) :- X == N, not(X == N-1).

The last Prolog fact is:
wall(South,Nb,M,Y).