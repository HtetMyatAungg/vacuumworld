edge(X, Y) :-
    between(0, N, X),
    between(0, N, Y);

wall(X, Y, Direction) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Direction = west ;
wall(X, Y, Direction) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Direction = east;
wall(X, Y, Direction) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Direction = north;

wall(X, Y, Direction) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    Direction = south;

agent(X, Y) :-
  X >= 0,
  X < N,
  Y >= 0,
  Y < N ;

dirt(X, Y) :-
  X >= 0,
  X < N,
  Y >= 0,
  Y < N;