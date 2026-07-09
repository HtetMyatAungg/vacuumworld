grid_size(8).
grid(X, Y) :- X >= 0, X < 8, Y >= 0, Y < 8.
dirt(1, 1, green).
dirt(2, 0, white).
dirt(1, 7, orange).
dirt(2, 7, orange).
dirt(0, 5, green).
dirt(1, 5, green).
dirt(2, 5, green).
dirt(0, 4, green).
dirt(1, 4, green).
dirt(2, 4, green).
dirt(0, 3, orange).
dirt(1, 3, orange).
dirt(2, 3, orange).
dirt(0, 2, green).
dirt(1, 2, green).
dirt(2, 2, green).
dirt(0, 1, green).
dirt(1, 1, green).
dirt(2, 1, orange).
dirt(0, 0, orange).
dirt(1, 0, orange).
dirt(2, 0, orange).
dirt(3, 0, orange).
dirt(3, 1, orange).
dirt(3, 2, orange).
dirt(3, 3, orange).
dirt(3, 4, orange).
dirt(3, 5, orange).
dirt(3, 6, orange).
dirt(3, 7, orange).
dirt(4, 5, orange).
dirt(4, 6, orange).
dirt(4, 7, orange).
dirt(4, 4, green).
dirt(4, 3, green).
dirt(4, 2, green).
dirt(4, 1, green).
dirt(4, 0, orange).
dirt(5, 0, green).
dirt(5, 1, green).
dirt(5, 2, green).
dirt(5, 3, green).
dirt(5, 4, green).
dirt(5, 5, green).
dirt(5, 6, green).
dirt(5, 7, orange).
dirt(6, 5, orange).
dirt(6, 6, orange).
dirt(6, 7, orange).
dirt(7, 0, green).
dirt(7, 1, green).
dirt(7, 2, green).
dirt(7, 3, green).
dirt(7, 4, green).
dirt(7, 5, green).
dirt(7, 6, green).
dirt(7, 7, orange).
dirt(8, 0, orange).
dirt(8, 1, orange).
dirt(8, 2, orange).
dirt(8, 3, orange).
dirt(8, 4, orange).
dirt(8, 5, orange).
dirt(8, 6, orange).
dirt(8, 7, orange).
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
empty(4, 0).
empty(4, 1).
empty(4, 2).
empty(4, 3).
empty(4, 4).
empty(4, 5).
empty(4, 6).
empty(4, 7).
empty(5, 0).
empty(5, 1).
empty(5, 2).
empty(5, 3).
empty(5, 4).
empty(5, 5).
empty(5, 6).
empty(5, 7).
empty(6, 0).
empty(6, 1).
empty(6, 2).
empty(6, 3).
empty(6, 4).
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

wall(0, 0, north).
wall(1, 0, north).
wall(2, 0, north).
wall(0, 1, west).
wall(1, 1, west).
wall(2, 1, west).
wall(0, 2, south).
wall(1, 2, south).
wall(2, 2, south).
wall(0, 3, west).
wall(1, 3, west).
wall(2, 3, west).
wall(0, 4, west).
wall(1, 4, west).
wall(2, 4, west).
wall(0, 5, west).
wall(1, 5, west).
wall(2, 5, west).
wall(0, 6, south).
wall(1, 6, south).
wall(2, 6, south).
wall(0, 7, west).
wall(1, 7, west).
wall(2, 7, west).
wall(3, 0, north).
wall(3, 1, north).
wall(3, 2, north).
wall(3, 3, north).
wall(3, 4, north).
wall(3, 5, north).
wall(3, 6, north).
wall(3, 7, south).
wall(4, 5, south).
wall(4, 6, south).
wall(4, 7, south).
wall(4, 4, east).
wall(4, 3, east).
wall(4, 2, east).
wall(4, 1, east).
wall(4, 0, east).