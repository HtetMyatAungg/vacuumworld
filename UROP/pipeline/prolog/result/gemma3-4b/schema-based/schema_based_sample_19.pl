grid_size(N).
grid(X, Y) :- X >= 0, X < N, Y >= 0, Y < N.
dirt(X, Y, Colour) :-
  X >= 0, X < N, Y >= 0, Y < N,
  Colour ins 'orange'.
dirt(X, Y, Colour) :-
  X >= 0, X < N, Y >= 0, Y < N,
  Colour ins 'green'.

agent(Id, X, Y, Colour) :-
  X >= 0, X < N, Y >= 0, Y < N,
  Id = '9af04778-08d6-4e40-8c6f-ba123d292a22',
  Colour ins 'orange'.

agent(Id, X, Y, Colour) :-
  X >= 0, X < N, Y >= 0, Y < N,
  Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',
  Colour ins 'green'.

empty(X,Y) :- X >= 0, X < N, Y >= 0, Y < N.

wall(X, Y, west) :-
  X = 0, Y >= 0, Y < N.
wall(X, Y, south) :-
  Y = 0, X >= 0, X < N.
wall(X, Y, east) :-
  X = N - 1, Y >= 0, Y < N.
wall(X, Y, north) :-
  Y = N - 1, X >= 0, X < N.