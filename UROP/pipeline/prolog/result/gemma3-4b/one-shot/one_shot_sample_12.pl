grid_size(5).
grid(X, Y) :- X \in [0..4], Y \in [0..4].
dirt(X, Y, Colour) :- X \in [0..4], Y \in [0..4], Colour = null.` or Colour = 'green'` or Colour = 'orange'.
agent(Id, X, Y, Colour) :- X \in [0..4], Y \in [0..4], str_codes(Id, Cs), member(Digit, Cs), atom_num(Id, Num), Num >= 0, Num < 5, Colour = null.` or` Colour = 'white'` or Colour = 'orange'` or Colour = 'green'.
empty(X, Y) :- X \in [0..4], Y \in [0..4].
wall(X, Y, north) :- X >= 0, X < 5, Y = 4.
wall(X, Y, south) :- X >= 0, X < 5, Y = 0.
wall(X, Y, west) :- Y >= 0, Y < 5, X = 0.
wall(X, Y, east) :- Y >= 0, Y < 5, X = 4.