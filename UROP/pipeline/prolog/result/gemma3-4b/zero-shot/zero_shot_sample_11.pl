edge(Cell1, Cell2) :- adjacent(Cell1, Cell2), label(wall).
edge(Cell1, Cell2) :- not(adjacent(Cell1, Cell2)), label(clear).
edge(Cell1, Cell2) :- label(dirt), (Cell2 = Cell1+1).
edge(Cell1, Cell2) :- label(agent), (Cell2 = Cell1+1).

grid(N) :- N > 0.

boundary_walls(N) :- N >= 0, N < 10.

wall_definition(North, X, Y, N) :- X = N - 1, Y between(0, N - 1).
wall_definition(South, X, Y, N) :- X = 0, Y between(0, N - 1).
wall_definition(West, X, Y, N) :- Y = 0, X between(0, N - 1).
wall_definition(East, X, Y, N) :- Y = N - 1, X between(0, N - 1).

grid_representation(N) :-
    findall((X,Y), X in [0..N-1], Y in [0..N-1], (
        (adjacent(X, Y), label(wall)) ;
        (X == 0, label(North)) ;
        (X == N - 1, label(South)) ;
        (Y == 0, label(West)) ;
        (Y == N - 1, label(East)) ;
        label(clear)
    )),
    boundary_walls(N).
