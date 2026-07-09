grid(N) :-
    N is 8.

walls([north, south, east, west]).

dirt([orange, green]).

agent(id1) :- id1 = '9af04778-08d6-4e40-8c6f-ba123d292a22'.

agent(id2) :- id2 = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.

observe(X, Y, Wall, Dirt, Agent) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    wall_present(X, Y, Wall),
    dirt_present(X, Y, Dirt),
    agent_present(X, Y, Agent).

wall_present(X, Y, north) :-
    Y = 0, X < N.

wall_present(X, Y, south) :-
    Y = N - 1, X < N.

wall_present(X, Y, east) :-
    X = N - 1, Y < N.

wall_present(X, Y, west) :-
    X = 0, Y < N.

dirt_present(X, Y, orange) :-
    X >= 0, X < N, Y >= 0, Y < N,
    ((X == 3), (Y == 0)), true.

dirt_present(X, Y, orange) :-
    X >= 0, X < N, Y >= 0, Y < N,
    ((X == 6), (Y == 4)).

dirt_present(X, Y, green) :-
    X >= 0, X < N, Y >= 0, Y < N,
    ((X == 5), (Y == 1)).

agent_present(X, Y, id) :-
    X >= 0, X < N, Y >= 0, Y < N,
    (id = '9af04778-08d6-4e40-8c6f-ba123d292a22'),
    (X == 0), (Y == 0).

agent_present(X, Y, id) :-
    X >= 0, X < N, Y >= 0, Y < N,
    (id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'),
    (X == 1), (Y == 0).

% Define the grid as a set of observations
observe_all :-
    [
        observe(0, 0, [north, west], null, fail),
        observe(1, 0, [], null, fail),
        observe(2, 0, [], null, fail),
        observe(0, 1, [south, west], null, fail),
        observe(1, 1, [south], null, fail),
        observe(2, 1, [south], null, fail),
        observe(0, 2, [west], null, fail),
        observe(1, 2, [], null, fail),
        observe(2, 2, [], null, fail),
        observe(0, 3, [west], {'agent': '9af04778-08d6-4e40-8c6f-ba123