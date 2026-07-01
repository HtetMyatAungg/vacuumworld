grid(N) :-
    n(N),
    create_grid(0, 0, N).

n(5).

create_grid(X, Y, 0) :- !.
create_grid(X, Y, N) :-
    (X < N),
    create_wall(X, Y, N),
    create_dirt(X, Y, N),
    create_agent(X, Y, N),
    create_grid(X + 1, Y, N).

create_wall(X, Y, N) :-
    write('wall(' , X , ',' , Y , ')'), nl.

create_dirt(X, Y, N) :-
    write('dirt(' , X , ',' , Y , ')'),nl.

create_agent(X, Y, N) :-
    write('agent(' , X , ',' , Y , ')'), nl.