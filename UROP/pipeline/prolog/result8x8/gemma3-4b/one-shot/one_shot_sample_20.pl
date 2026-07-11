grid_size(8).
grid(x, y) :- x is 1 + x, y is 1 + y, x >= 1, x <= 8, y >= 1, y <= 8.
dirt(x, y, green) :- x > 0, x =< 8, y > 0, y =< 8.
dirt(x, y, orange) :- x > 0, x =< 8, y > 0, y =< 8.
agent('agent-1', 2, 0, white) :- x is 2, y is 0.
agent('agent-2', 3, 3, green) :- x is 3, y is 3.
agent('agent-3', 4, 7, orange) :- x is 4, y is 7.
agent('agent-4', 6, 4, white) :- x is 6, y is 4.
agent('agent-5', 7, 0, green) :- x is 7, y is 0.
empty(x, y) :- x > 0, x =< 8, y > 0, y =< 8.

wall(x, y, north) :- x > 0, x =< 8.
wall(x, y, south) :- x > 0, x =< 8.
wall(x, y, west) :- y > 0, y =< 8.
wall(x, y, east) :- y > 0, y =< 8.