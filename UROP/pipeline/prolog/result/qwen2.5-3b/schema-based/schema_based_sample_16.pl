grid_size(12).  
grid(loc(X,Y)) :- Z is X * Y, between(0,Z,Y), between(0,X-1,Z).  

seen(dirt(loc(X,Y))) :- grid(loc(X,Y)), percept(log, ["dirt", loc(X,Y)]).   

seen(agent("9af04778-08d6-4e40-8c6f-ba123d292a22", loc(X,Y), "orange")) :- grid(loc(X,Y)), percept(log, ["agent", agentId, loc(X,Y)]), atom_number("9af04778-08d6-4e40-8c6f-ba123d292a22", agentId).  

seen(agent(Id, loc(X,Y), "orange")) :- grid(loc(X,Y)), percept(log, ["agent", Id, loc(X,Y)]), atom_number(Id), number(X) /\ positive_integer(X), number(Y) /\ positive_integer(Y).

seen(agent("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", loc(X,Y), "green")) :- grid(loc(X,Y)), percept(log, ["agent", agentId, loc(X,Y)]), atom_number("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", agentId).  

seen(agent(Id, loc(X,Y), "green")) :- grid(loc(X,Y)), percept(log, ["agent", Id, loc(X,Y)]), atom_number(Id), number(X) /\ positive_integer(X), number(Y) /\ positive_integer(Y).

empty_location(loc(X,Y)) :- grid(loc(X,Y)), not seen(dirt(_,_), _). 

not seen(agent(_, _, _), _); not seen(dirt(loc(_,_), _)).  

wallopens(loc(0,_), north) .

wallopens(_R, loc(_, 0)) .  

wallopens(_, _) :- \+ grid(_).

wall(loc(X,Y), dir(N)) :- 
  X == 0 -> wallopens(loc(X,Y), dir(E)); Y == 0 -> wallopens(loc(X,Y), dir(S)); N in [north, south], not wallopens(loc(X,Y), N).