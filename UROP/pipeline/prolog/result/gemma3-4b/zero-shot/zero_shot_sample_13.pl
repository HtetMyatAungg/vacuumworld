edge(X, Y, Dir, N) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (Dir = 'north', Y > 0),
    (Dir = 'south', Y < N - 1),
    (Dir = 'east', X < N - 1),
    (Dir = 'west', X > 0),
    fail.
edge(X, Y, Dir, N) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    Dir = 'north', Y = 0, X < N - 1,
    fail.
edge(X, Y, Dir, N) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    Dir = 'south', Y = N - 1, X < N - 1,
    fail.
edge(X, Y, Dir, N) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    Dir = 'east', X = N - 1, Y < N - 1,
    fail.
edge(X, Y, Dir, N) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    Dir = 'west', X = 0, Y < N - 1,
    fail.
grid(X, Y, Dir, N) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    edge(X, Y, Dir, N).

dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 0, Y = 0, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 1, Y = 0, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 2, Y = 0, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 0, Y = 1, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 1, Y = 1, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 2, Y = 1, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 0, Y = 2, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 1, Y = 2, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 2, Y = 2, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 0, Y = 3, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 1, Y = 3, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 2, Y = 3, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 0, Y = 4, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 1, Y = 4, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 2, Y = 4, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 0, Y = 5, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 1, Y = 5, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 2, Y = 5, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 0, Y = 6, Colour = 'orange').
dirt(X, Y, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    (X = 1, Y = 6, Colour = 'orange').

N = 8.

agent(Id, Colour) :-
    Id = '9af04778-08d6-4e40-8c6f-ba123d292a22', Colour = 'orange'.
agent(Id, Colour) :-
    Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green'.