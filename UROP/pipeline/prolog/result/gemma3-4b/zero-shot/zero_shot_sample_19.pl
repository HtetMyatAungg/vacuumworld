edge(X, Y, NextX, NextY) :-
    X < 10,
    NextX is X + 1,
    NextY is Y;
    X > 0,
    NextX is X - 1,
    NextY is Y;
    true.

wall(X, Y, Direction) :-
  edge(X, Y, NextX, NextY),
  (   NextX == X -> Direction = West;
      NextY == Y -> Direction = South;
      Direction = East;
      Direction = North).

grid(N) :-
    N >= 0,
    N is 8.