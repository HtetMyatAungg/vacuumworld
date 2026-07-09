grid_size(8).
grid(X, Y) :-
  between(0, 7, X),
  between(0, 7, Y).
dirt(X, Y, color) :-
  between(0, 7, X),
  between(0, 7, Y),
  (X=3, Y=3), label(orange, X, Y),
  (X=5, Y=1), label(green, X, Y).

agent(id, X, Y, color) :-
  between(0, 7, X),
  between(0, 7, Y),
  (X=3, Y=3), label(orange, X, Y, id),
  (X=4, Y=0), label(green, X, Y, id).

empty(X, Y) :-
  between(0, 7, X),
  between(0, 7, Y).

wall(x, y, west) :- x = 0.
wall(x, y, north) :- y = 0.
wall(x, y, east) :- x = 7.
wall(x, y, south) :- y = 7.