agent(d3af9897-9139-4ffe-8a15-2e9c6f06e71a, orange, 1, 0).
agent(d6428e63-73b7-40a5-9cc9-ea3b5e61a86d, green, 5, 0).

dirt(orange, 1, 4).
dirt(orange, 3, 3).
dirt(orange, 3, 6).
dirt(orange, 5, 7).
dirt(green, 7, 5).
dirt(green, 9, 2).
dirt(green, 9, 7).

wall(0, Y, west) :- between(0, 10, Y).
wall(X, 0, north) :- between(0, 10, X).
wall(X, 10, south) :- between(0, 10, X).
wall(10, Y, east) :- between(0, 10, Y).

between(Low, High, Val) :-
    integer(Val),
    Val >= Low,
    Val =< High.