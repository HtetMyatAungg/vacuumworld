grid_size(14).

grid(X,Y) :-
    (Y == 0 -> X between(0,7); X between(-1,8), (X \= -1 -> X+2; true)), Y between(0,N)
assert(grid(0,0)).
assert(grid(N+1,M)) :- grid(N,M).
assert(agent(I,J,C)) :-
    I == K -> J = L, C = O; assert(agent(K,L,O)), K \== I.
grid_empty(X,Y) :-
    ground(dirt(X,Y,_)); ground(agent(_,X,Y)).