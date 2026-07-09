grid_size(8).

grid(X,Y) :-
    Between(0,7,X),
    Between(0,7,Y).

dirt(X,Y,C) :-
    grid(X,Y),
    percept_log(dirt(X,Y,_)).

agent(Id,X,Y,C) :-
    percept_log(agent(_,X,Y,_)),
    Id \= undefined,
    C = percept_log(colour(Id)).

empty(X,Y) :-
    \+ grid(X,Y),
    \+ dirt(X,Y, _),
    \+ agent(_,_X,_Y,_).

wall(N,E) :-
    Between(0,N,X),
    Between(0,N,Y1),
    \+ grid(Y1,X),
    \+ percept_log(wall(N,E)).

wall_top_rnd(N) :-
    N > 0,
    N < 8,
    N1 is N-1,
    between(0,7,M),
    wall_top_rnd(M).

wall_bot_rnd(N) :-
    Between(0,N,X),
    X1 is X+1,
    Between(0,7,Y2),
    Between(0,7,Y1),
    \+ grid(Y1,Y2),
    \+ percept_log(walk(N,E)), !,
    empty(E).

empty(X,Y) :-
    \+ grid(X,Y),
    \+ dirt(X,Y,_),
    \+ agent(_,_X,_Y,_).