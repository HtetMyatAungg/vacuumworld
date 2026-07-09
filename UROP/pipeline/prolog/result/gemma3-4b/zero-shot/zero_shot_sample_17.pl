edge(X, Y) :- between(0, N), X = Y.
grid(N) :-
    N > 0,
    between(0, N).

cell(X, Y, dirt) :-
    X >= 0, X #< N,
    Y >= 0, Y #< N,
    edge(X, Y),
    !.

cell(X, Y, agent) :-
    X >= 0, X #< N,
    Y >= 0, Y #< N,
    edge(X, Y),
    agent_id = id(agent).

agent_id(agent) :- member(agent_data, agents), agent_data = id(agent).

walls(X, Y) :-
    X >= 0, X #< N,
    Y >= 0, Y #< N,
    edge(X, Y).

boundary_wall(X, Y) :-
    X = 0, Y >= 0, Y #< N, edge(X, Y).
boundary_wall(X, Y) :-
    X = N, Y >= 0, Y #< N, edge(X, Y).
boundary_wall(X, Y) :-
    Y = 0, X >= 0, X #< N, edge(X, Y).
boundary_wall(X, Y) :-
    Y = N, X >= 0, X #< N, edge(X, Y).

agents := [
  {id: "9af04778-08d6-4e40-8c6f-ba123d292a22", colour: orange},
  {id: "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c