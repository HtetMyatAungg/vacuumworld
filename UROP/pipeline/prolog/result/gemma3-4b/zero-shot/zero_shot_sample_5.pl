edge(X, Y) :-
    between(0, 8, X),
    between(0, 8, Y).

cell(X, Y) :-
    X >= 0, X < 9,
    Y >= 0, Y < 9.

wall(X, Y) :-
    (X in [0..2], Y in [0..7]),
    (X in [3], Y in [0..7]),
    (X in [4], Y in [0..7]),
    (X in [5], Y in [0..7]),
    (X in [6], Y in [0..7]),
    (X in [7], Y in [3..7]).

dirt(X, Y) :-
   X >= 0, X < 9,
   Y >= 0, Y < 9.

agent(X, Y, id) :-
    X >= 0, X < 9,
    Y >= 0, Y < 9,
    (X = 0, Y = 0, id = '9af04778-08d6-4e40-8c6f-ba123d292a22'),
    (X = 1, Y = 0, id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'),
   (X = 2, Y = 0, id = null),
    (X = 3, Y = 0, id = null),
     (X = 4, Y = 0