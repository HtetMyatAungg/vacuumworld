:- dynamic cell/3.
:- dynamic wall/3.
:- dynamic dirt/3.
:- dynamic agent/4.

grid_size(11, 11).

wall(0, 9, west).
wall(0, 10, south).
wall(0, 10, west).
wall(1, 10, south).
wall(2, 10, south).
wall(0, 8, west).
wall(0, 7, west).
wall(0, 6, west).
wall(0, 5, west).
wall(0, 4, west).
wall(0, 3, west).
wall(0, 2, west).
wall(0, 1, west).
wall(0, 0, north).
wall(0, 0, west).
wall(1, 0, north).
wall(2, 0, north).
wall(3, 0, north).
wall(3, 10, south).
wall(4, 10, south).
wall(4, 0, north).
wall(5, 0, north).
wall(5, 10, south).
wall(6, 10, south).
wall(6, 0, north).
wall(7, 0, north).
wall(7, 10, south).
wall(8, 10, south).
wall(8, 0, north).
wall(9, 0, north).
wall(9, 10, south).
wall(10, 8, east).
wall(10, 9, east).
wall(10, 10, east).
wall(10, 10, south).
wall(10, 7, east).
wall(10, 6, east).
wall(10, 5, east).
wall(10, 4, east).
wall(10, 3, east).
wall(10, 2, east).
wall(10, 1, east).
wall(10, 0, east).
wall(10, 0, north).

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent(1, 0, d3af9897_9139_4ffe_8a15_2e9c6f06e71a, orange).
agent(5, 0, d6428e63_73b7_40a5_9cc9_ea3b5e61a86d, green).

empty(X, Y) :-
    grid_size(W, H),
    Wm1 is W - 1,
    Hm1 is H - 1,
    between(0, Wm1, X),
    between(0, Hm1, Y),
    \+ dirt(X, Y, _),
    \+ agent(X, Y, _, _).