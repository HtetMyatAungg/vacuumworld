edge(X, Y) :- between(0, N), X == Y.
edge(X, Y) :- between(0, N), X \= Y.

grid(N) :-
    N > 0,
    integer(N).

cell(X, Y) :-
    between(0, N),
    X >= 0,
    X < N,
    Y >= 0,
    Y < N.

wall(X, Y) :-
    cell(X, Y),
    (X == 0, wall_north(X, Y)).
wall(X, Y) :-
    cell(X, Y),
    (X == N, wall_south(X, Y)).
wall(X, Y) :-
    cell(X, Y),
    (Y == 0, wall_west(X, Y)).
wall(X, Y) :-
    cell(X, Y),
    (Y == N, wall_east(X, Y)).

dirt(X, Y) :-
    cell(X, Y),
    (X == 2, Y == 7, dirt('orange')).
dirt(X, Y) :-
    cell(X, Y),
    (X == 3, Y == 4, dirt('orange')).
dirt(X, Y) :-
    cell(X, Y),
    (X == 5, Y == 1, dirt('green')).

agent(X, Y) :-
    cell(X, Y),
    (X == 3, Y == 3, agent_id('9af04778-08d6-4e40-8c6f-ba123d292a22', 'orange')).
agent(X, Y) :-
    cell(X, Y),
    (X == 4, Y == 0, agent_id('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 'green')).

wall_north(X, Y) :- X == 0.
wall_south(X, Y) :- X == N.
wall_west(X, Y) :- Y == 0.
wall_east(X, Y) :- Y == N.

agent_id(ID, Colour) :-
    ID = '9af04778-08d6-4e40-8c6f-ba123d292a22', Colour = 'orange'.
agent_id(ID, Colour) :-
    ID = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green'.
