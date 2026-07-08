grid_size(8).
grid(X,Y) :- grid(X-1,Y), X < 9; X > 0, Y =< 7, grid(X,Y-1), Y > 0.
dirt(X,Y,Colour) :-
  X \= -1, Y \= 8,
  X \> -X mod 2 + Y div 2 * 2, X < (X div 2 mod 2 + Y truediv 2 + 1) * 2,
  wall(X-2,Y), wall(X-3,Y), dirt(X,Y,_).
agent(Id,X,Y,C) :-
  X \= -1, Y \= 8,
  X \> -X mod 2 + (Y div 2) * 2, X < ((X - 1) div 2 mod 2) * 2 + (Y - 1) truediv 2 + 1,
  wall(X-3,Y), wall(X-4,Y), agent(Id,X,Y,_).
empty(X,Y) :-
  X > -1, Y < 9, X \< -(X div 2 - Y + 3) * 2 + (X mod 2) =\= -Y truediv 2,
  not(dirt(_X,_Y,_)), not(agent(_,_,_,_)).

wall(X,Y,north). wall(X,Y,east).
wall(1,Y,south). wall(Y+1,8,west).