grid_size(14).
grid(loc(N,X)) :- between(0,N-1,X).
seen(dirt(loc(X,Y,C))).
seen(agent(Id, loc(X,Y), C)).
empty_location(loc(X,Y)).