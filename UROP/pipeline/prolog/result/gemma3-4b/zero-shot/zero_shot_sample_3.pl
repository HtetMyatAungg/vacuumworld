domain([0..7]).
segret(X, Y) :- X in [0..7], Y in [0..7].
wall(N, S, E, W) :- N > 0, W > 0, N < 8, W < 8.

agent(ID, Colour) :- ID = '9af04778-08d6-4e40-8c6f-ba123d292a22', Colour = orange;
                       ID = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = green.

dirt(orange) :- true.
dirt(green) :- true.

grid(N) :-
    findall((X, Y), (segret(X, Y)), Cells),
    maplist(function(Cell) [wall(Cell.X, Cell.Y)], Cells).