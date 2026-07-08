edge(X, Y) :- between(0, N), X == Y.
edge(X, Y) :- between(0, N), X > Y.
edge(X, Y) :- between(0, N), X < Y.

grid(N) :-
    N >= 0,
    integer(N).

cell(X, Y) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N.

wall(X, Y) :-
    cell(X, Y),
    not(edge(X, Y)).

dirt(X, Y) :-
    cell(X, Y),
    not(wall(X, Y)),
    not([]).
agent(X, Y) :-
    cell(X, Y),
    not(wall(X, Y)),
    not([]).

/*
edge(0, 0) :- true.
*/