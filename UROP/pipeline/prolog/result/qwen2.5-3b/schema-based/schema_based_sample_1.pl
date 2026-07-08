grid_size(8).

% Section A - Translation of percept log into ground facts

grid(X,Y) :-
  X >= 0, Y >= 0, X =< 7, Y =< 7, !,
  ( dirt(X,Y,_),
    agent(Id,X,Y,_), 
    empty(_) ;
    wall(X,Y,north),
    grid(X+1,Y),
    wall(X+Y-3,Y,east),
    wall(X,Y,south),
    grid(X,Y+1),
    wall(X-2\0<Y,west)
  ).
  
dirt(4,5,_).
agent(Id,X,Y,B) :-
    Id = "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", Y > 1, X < 4, (X \=2 \-> B = green; B = orange),
    writeq(Id,!), !.

empty(0,6) :- 
  counter(0, _).

counter(Num, Num).  
counter(Num, Acc) :-
  Num1 is Num-1,
  Num1 > 1,
  counter(Num1, RestAcc),
  (RestAcc \= 7 -> NewAcc is Acc+2, writeq(NewAcc); NewAcc = Acc).
  
% Section B - Wall rules

wall(X,Y,north).

wall(X,Y,east).

wall(X,Y,south).

wall(X,Y,west).