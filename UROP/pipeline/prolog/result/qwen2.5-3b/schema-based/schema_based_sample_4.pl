grid_size(8).

grid(X,Y) :-
  grid_dim(Dim),
  X between 0, Dim-1,
  Y between 0, Dim-1,
  wall(NW,NSE).

dirt(X,Y,Colour) :-
  grid(X, Y),
  percept(dirt(_, X, Y, Colour)).

agent(Id, X, Y, Colour) :-
  grid(X, Y),
  percept(agent(Id,_)),
  colour(Colour).

empty(X:Y) :-
  grid_dim(Dim),
  X between 0, Dim-1,
  Y between 0, Dim-1,
  \+ percept(grid_state(_, _, _)),
  not percept(wall(X:Y,_)).

not_wall(NW:NSE).
  
wall(NW:NSE) :- \+ grid(NW,Y), !.
   
wall((NW:NSE);(N,W:Y,N)).