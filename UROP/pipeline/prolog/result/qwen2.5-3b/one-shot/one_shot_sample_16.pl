grid_size(32).  
grid(X,Y) :-  
    member(Y, [0..31]),
    member(X, [0..31]).  

dirt(X,Y,C) :-
    grid(X,Y),
    C \= null.  

empty(X,Y) :-
    grid(X,Y).

wall(_X,_Y,north).  
walk(X,_Y,south) :- 
   X > 0,
   X < 32,
   Y > 0.
   
walk(_X,0,north).
walk(_X,Y,south) :-
   Y > 0,
   Y < 32,
   grid(Y,X).