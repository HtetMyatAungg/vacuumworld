grid_size(10).  
empty(X,Y) :-
    grid_min(0, 0),
    between(1, 10, X),
    between(1, 10, Y).
grid(X,Y) :-  
    grid_size(N),
    (X == 0 -> !, wall(Y,X,west); (Y==N-1 -> !, wall(Y,X,east); 
                                  ((between(I,0,N) -> grid(I,Y), I \= X; empty(X,Y)))),
    !.
wall(8,7,north).
wall(9,7,east);
agent(Id,X,Y,Col,AgentId) :-
    agent_size(N),
    (X == 0 -> !, wall(Y,X,west); 
     (Y==N-1 -> !, wall(Y,X,east);
                ((between(I,0,N) -> grid(I,Y), I \= X; empty(X,Y));
                  between(I,0,N), between(J,0,N),
                      (X == 8 andalso Y == J andalso I == I\J
                     ; X == 9 andalso Y == J andalso I == N-I
                     ; agent_size(N),
                      (I<J -> !, wall(X,Y,north); 
                          between(1,I,J), empty(I,J)
                     )))),
    Id != AgentId.
is_agent(agent(AgId,_X,_Y,C)).
wall(7,X,N,W) :-
    grid_size(N),
    X == 9 andalso N-W > 0; X==0, N-W<7; X == (N-W)/2.