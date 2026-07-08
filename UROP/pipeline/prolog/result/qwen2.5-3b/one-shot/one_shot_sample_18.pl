grid_size(8).

grid(X,Y):- X between 0,7, Y between 0,7.

dirt(X,Y,Colour):-
    grid_size(N),
    X between 0,N, Y between 0,N,
    observation(log, dirt(X, Y, Colour)).

agent(Id,X,Y,Colour):-
    grid_size(N),
    X between 0,N, Y between 0,N,
    observation(log, agent(_, Id, X, Y, Colour)).

empty(X,Y):-
    grid_size(N),
    X between 0,N, Y between 0,N,
    \+ occurrence(dirt(_,X,Y),log).

wall(X,Y,north):-
    grid_size(N),
    X between 0,N, Y between 0,N-1.

wall(X,Y,south):-
    grid_size(N),
    X between 0,N, Y between Y+1,N.

wall(X,Y,east):-
    grid_size(N),
    X between X+1,N, Y between 0,N.

wall(X,Y,west):-
    grid_size(N),
    X between 0,N-1, Y between 0,N.