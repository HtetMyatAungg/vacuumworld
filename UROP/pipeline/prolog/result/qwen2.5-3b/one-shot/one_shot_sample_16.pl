grid_size(16).

grid(loc(X,Y)) :- grid_size(16), (X=0; X=15; Y=0; Y=15).

seen(dirt(loc(X,Y,Colour)), C) :- seen(dirt(loc(X,Y,_)), DirtObs), seen(C, AgentObs), seen(agent(Id,ELoc,Colour), AgentObs).
seen(C, Agent) :-
  grid_size(N), (X is N-X; Y is N-Y),
  seen(agent(Id,ELOC,Color), AgentObs),
  loc(ELOC,X,Y).
seen(C, DirtObs) :-
  grid_size(N), (X is N-X; Y is N-Y),
  seen(dirt(D,Color), DirtObs),
  loc(D,X,Y).

empty_location(loc(X,Y)) :- seen(loc(X,Y)).
grid_size(N).