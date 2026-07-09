edge(X, Y) :- between(0, N), X =:= Y.
edge(X, Y) :- between(0, N), X \= Y.

grid_size(N) :-
    N > 0,
    integer(N).

cell(X, Y) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N.

wall(X, Y) :-
    cell(X, Y),
    not (edge(X, Y)).

dirt(X, Y) :-
    cell(X, Y),
    not (wall(X, Y)),
    (   atom('orange', dirt_type)
    ->  dirt_type == 'orange'
    ;   dirt_type == null
    ).

agent(X, Y) :-
    cell(X, Y),
    not (wall(X, Y)),
    (   atom('9af04778-08d6-4e40-8c6f-ba123d292a22', agent_id)
    ->  agent_id == '9af04778-08d6-4e40-8c6f-ba123d292a22'
    ;   atom('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', agent_id)
        == '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'
    ).

boundary(X, Y) :-
    (X == 0) ;
    (X == N - 1) ;
    (Y == 0) ;
    (Y == N - 1).