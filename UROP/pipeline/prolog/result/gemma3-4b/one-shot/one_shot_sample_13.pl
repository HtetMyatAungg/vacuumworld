grid_size(8).
grid(x, y) :- x > 0, x < 8, y > 0, y < 8.

dirt(1, 1, green).
dirt(2, 1, orange).
dirt(3, 1, orange).
dirt(4, 1, orange).
dirt(5, 1, green).
dirt(6, 1, orange).
dirt(7, 1, orange).
dirt(0, 2, orange).
dirt(1, 2, orange).
dirt(2, 2, orange).
dirt(3, 2, orange).
dirt(4, 2, orange).
dirt(5, 2, green).
dirt(6, 2, orange).
dirt(7, 2, orange).
dirt(0, 3, orange).
dirt(1, 3, orange).
dirt(2, 3, orange).
dirt(3, 3, orange).
dirt(4, 3, orange).
dirt(5, 3, green).
dirt(6, 3, orange).
dirt(7, 3, orange).
dirt(0, 4, orange).
dirt(1, 4, orange).
dirt(2, 4, orange).
dirt(3, 4, orange).
dirt(4, 4, orange).

agent('agent-1', 