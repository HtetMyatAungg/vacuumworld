edge(X, Y, 'north') :-
    X >= 0,
    X < 8,
    Y = 0,
    Y >= 0.

edge(X, Y, 'south') :-
    X >= 0,
    X < 8,
    Y = 7,
    Y >= 0.

edge(X, Y, 'east') :-
    X = 7,
    Y >= 0,
    Y < 8.

edge(X, Y, 'west') :-
    X = 0,
    Y >= 0,
    Y < 8.

grid(X, Y, clear) :-
    X in [0..7],
    Y in [0..7].

cell(X, Y, dirt) :-
    X in [0..7],
    Y in [0..7],
    not(wall(X,Y, 'east')).

cell(X, Y, agent) :-
    X in [0..7],
    Y in [0..7],
    not(wall(X,Y, 'west')).

wall(X, Y, direction) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    (   direction = 'north' ->
        Y = 0
    ;   direction = 'south' ->
        Y = 7
    ;   direction = 'east' ->
        X = 7
    ;   direction = 'west' ->
        X = 0
    ).

agent_id(9af04778-08d6-4e40-8c6f-ba123d292a22, orange).
agent_id(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c, green).