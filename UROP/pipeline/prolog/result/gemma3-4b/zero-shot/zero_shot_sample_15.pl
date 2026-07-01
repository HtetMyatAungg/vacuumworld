grid(N) :-
    N >= 0,
    assertz(size(N)).

wall(X, Y) :-
    between(0, N-1, X),
    between(0, N-1, Y).

agent(X, Y) :-
    between(0, N-1, X),
    between(0, N-1, Y).

dirt(X, Y) :-
    between(0, N-1, X),
    between(0, N-1, Y).