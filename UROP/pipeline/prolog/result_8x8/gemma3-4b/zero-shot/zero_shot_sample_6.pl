edge(X, Y) :-
        X is Y,
        Y >= 0,
        Y < 8.

dirt(X, Y) :-
    X is Y,
    Y >= 0,
    Y < 8,
    (   (X mod 2 = 0) -> dirt([X], Y) ; dirt([X], Y) ).

walls(X, Y) :-
    X is Y,
    Y >= 0,
    Y < 8,
    ((Y == 0) -> walls([X], Y) ; ((Y == 7) -> walls([X], Y)) ; false).