grid_size(8).

grid(X,Y):- grid(X,Y,0,0),  Y1 is X+Y*8,  X1 is X+8*(X>6).

dirt(X,Y,Clr):-
  member(dirt(X,Y,_), List),
  Colr = Clr.

agent(Id,X,Y,Cls):-
  member(agent(Id,X,Y,Cls),List),
  Colour = Clrs.

empty(X,Y) :- \+member(dirt(_,_,_),List), \+member(agent(_,_,_,_),List).

wall(X,X2,Y,Y2,D):- (X<X2;X=X2),(Y=Y2);\+(Y>Y2;\+(X>Y;X < Y2)),
   wall(X1,Y1,X2,Y2,_D).

wall(0,0,N,8,N,_).
empty(_,_).