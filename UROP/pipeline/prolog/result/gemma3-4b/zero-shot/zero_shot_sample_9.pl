edge(X, Y, X_next, Y_next) :-
    X in [0..7],
    Y in [0..7],
    adjacent(X, X_next),
    adjacent(Y, Y_next).

grid(8) :-
    N >= 0,
    N is 8.

cell(X, Y) :-
    X in [0..7],
    Y in [0..7].

wall(X, Y, Direction) :-
    X in [0..7],
    Y in [0..7],
    (   X == 0,
        Y in [0..7],
        Direction = north
    );
    (   X == 7,
        Y in [0..7],
        Direction = south
    );
    (   Y == 0,
        X in [0..7],
        Direction = west
    );
    (   Y == 7,
        X in [0..7],
        Direction = east
    ).

agent_found(X, Y) :- cell(X, Y), length(walls(X, Y), WallCount) > 0.

dirt_present(X, Y) :- cell(X, Y), (length(walls(X,Y)) == 0 and dirt(X,Y) =="orange" or dirt(X,Y) =="green").

room(X, Y) :-
    cell(X, Y),
    \+ agent_found(X, Y),
    \+ dirt_present(X, Y).