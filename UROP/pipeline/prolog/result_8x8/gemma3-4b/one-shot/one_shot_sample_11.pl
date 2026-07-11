grid_size(8).
grid(X, Y) :- X > 0, X < 8, Y > 0, Y < 8 .
dirt(1, 1, green).
dirt(2, 0, white).
dirt(3, 0, orange).
dirt(0, 7, green).
dirt(1, 7, orange).
dirt(2, 7, white).
dirt(0, 5, green).
dirt(1, 5, orange).
dirt(2, 5, white).
dirt(0, 4, green).
dirt(1, 4, orange).
dirt(2, 4, white).
dirt(0, 3, orange).
dirt(1, 3, green).
dirt(2, 3, white).
dirt(0, 2, green).
dirt(1, 2, orange).
dirt(2, 2, white).
dirt(0, 1, green).
dirt(1, 1, orange).
dirt(2, 1, white).
dirt(0, 0, green).
agent('agent-1', 2, 0, white).
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 3, 0, orange).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4, 0, green).
empty(0, 0).
empty(1, 0).
empty(2, 0).
empty(0, 1).
empty(1, 1).
empty(2, 1).
empty(0, 2).
empty(1, 2).
empty(2, 2).
empty(0, 3).
empty(1, 3).
empty(2, 3).
empty(0, 4).
empty(1, 4).
empty(2, 4).
empty(0, 5).
empty(1, 5).
empty(2, 5).
empty(0, 6).
empty(1, 6).
empty(2, 6).
empty(0, 7).
empty(1, 7).
empty(2, 7).
empty(3, 0).
empty(3, 1).
empty(3, 2).
empty(3, 3).
empty(3, 4).
empty(3, 5).
empty(3, 6).
empty(3, 7).
empty(4, 5).
empty(4, 6).
empty(4, 7).
empty(4, 4).
empty(4, 3).
empty(4, 2).
empty(4, 1).
empty(4, 0).
empty(5, 0).
empty(5, 1).
empty(5, 2).
empty(5, 3).
empty(5, 4).
empty(5, 5).
empty(5, 6).
empty(5, 7).
empty(6, 5).
empty(6, 6).
empty(6, 7).
empty(7, 0).
empty(7, 1).
empty(7, 2).
empty(7, 3).
empty(7, 4).
empty(7, 5).
empty(7, 6).
empty(7, 7).

wall(x, y, north) :- x > 0, y = 0 .
wall(x, y, south) :- x > 0, y = 7 .
wall(x, y, west) :- y > 0, x = 0 .
wall(x, y, east) :- y > 0, x = 7 .