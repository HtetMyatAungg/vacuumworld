edge(X, Y, Dir) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    wall_exists(X, Y, Dir).

edge(X, Y, East) :-
    X < N,
    Y >= 0,
    Y < N.

edge(X, Y, South) :-
    X >= 0,
    Y < N,
    X < N.

edge(X, Y, North) :-
    X >= 0,
    Y >= 0,
    X < N,
    Y < N.

edge(X, Y, West) :-
    X > 0,
    Y >= 0,
    Y < N.

edge(X, Y, East) :-
    X > 0,
    Y >= 0,
    Y < N.

edge(X, Y, South) :-
    X >= 0,
    Y > 0,
    X < N.

edge(X, Y, North) :-
    X >= 0,
    Y > 0,
    X < N.

edge(X, Y, West) :-
    X > 0,
    Y > 0,
    X < N.

edge(X, Y, East) :-
    X > 0,
    Y > 0,
    X < N.

edge(0, 0, North) :- X == 0, Y == 0.

edge(N-1, N-1, South) :- X == N-1, Y == N-1.

edge(0, 0, West) :- X == 0, Y == 0.

edge(N-1, 0, North) :- X == N-1, Y == 0.

edge(0, N-1, South) :- X == 0, Y == N-1.

edge(N-1, N-1, East) :- X == N-1, Y == N-1.
edge(N-1, N-1, South) :- X == N-1, Y == N-1.

edge(N-1, 0, North) :- X == N-1, Y == 0.

edge(0, N-1, South) :- X == 0, Y == N-1.

edge(0, 0, West) :- X == 0, Y == 0.

edge(N-1, 0, North) :- X == N-1, Y == 0.

edge(0, N-1, South) :- X == 0, Y == N-1.

edge(N-1, N-1, East) :- X == N-1, Y == N-1.
edge(N-1, N-1, South) :- X == N-1, Y == N-1.

N := 8.