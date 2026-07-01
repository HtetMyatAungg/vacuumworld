edge(X, Y, NextX, NextY) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    next_cell(X, Y, NextX, NextY).

edge(X, Y, PrevX, PrevY) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    prev_cell(X, Y, PrevX, PrevY).

next_cell(X, Y, X1, Y1) :-
    X1 = X + 1,
    Y1 = Y.

prev_cell(X, Y, X1, Y1) :-
    X1 = X - 1,
    Y1 = Y.

% Define the size of the grid (N x N). You can change this.
N := 8.