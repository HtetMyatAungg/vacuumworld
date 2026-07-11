grid(8, 8).
wall(north, 1, 0).
wall(east, 7, _).
wall(south, _, 7).
wall(west, 0, _).

agent("9af04778-08d6-4e40-8c6f-ba123d292a22", orange, [0, 6]).
agent(_, _, _).

dirt(_, _) :- fail.

dirt(orange, [0, 5]) :- true.
dirt(orange, [4, 7]) :- true.
dirt(orange, [3, 0]) :- true.
dirt(orange, [6, 1]) :- true.
dirt(orange, [6, 4]) :- true.
dirt(orange, [2, 6]) :- true.
dirt(orange, [7, 6]) :- true.

dirt(_, [3, 0]).