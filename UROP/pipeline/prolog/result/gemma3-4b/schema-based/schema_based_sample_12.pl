grid_size(8).
grid(X, Y) :- X in [0..7], Y in [0..7].
dirt(X, Y, orange) :- X in [0..3], Y in [0..7], X < 4, Y >= 0, X >= 0 , Y < 8.
dirt(X, Y, green) :- X in [5..7], Y in [0..7], X < 8, Y >= 0 , X >= 0, Y < 8.
dirt(X, Y, orange) :- X in [6..7], Y in [4..7], X < 8, Y >= 4 , X >= 0, Y < 8.

agent(id1, 3, 3, orange) :-
    id1 = '9af04778-08d6-4e40-8c6f-ba123d292a22'.
agent(id2, 4, 0, green) :-
    id2 = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.

empty(X, Y) :- X in [0..7], Y in [0..7], not (dirt(_, X, _)-true), not (agent(_, X, Y)-true).
wall(x, y, west) :- x = 0, y in [0..7].
wall(x, y, north) :- y = 0, x in [0..7].
wall(x, y, east) :- x = 7, y in [0..7].
wall(x, y, south) :- y = 7, x in [0..7].