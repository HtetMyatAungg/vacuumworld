grid(8).

build_grid(N, Grid):-
    findall(Cell, 0..N-1, Grid).
    forall(0..N-1, \row ->
        member(row, [0..(N-1)]),
        true
    ).

agent('9af04778-08d6-4e40-8c6f-ba123d292a22', orange, 3, 3).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', green, 4, 0).

walls := [
    (0, 0), (0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (0, 6), (0, 7