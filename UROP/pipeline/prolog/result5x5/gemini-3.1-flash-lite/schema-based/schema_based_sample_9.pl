grid_size(5).
grid(X, Y) :- between(0, 4, X), between(0, 4, Y).
dirt(2, 3, orange).
dirt(1, 2, green).
dirt(3, 1, orange).
agent('c942b0ce-6c70-4311-a5b7-6b2640fe417c', 2, 0, green).
agent('ec1d58f6-6db4-473d-af3e-518ca49c39f9', 4, 2, orange).
empty(0, 3).
empty(1, 3).
empty(0, 4).
empty(1, 4).
empty(2, 4).
empty(0, 2).
empty(2, 2).
empty(0, 1).
empty(1, 1).
empty(2, 1).
empty(0, 0).
empty(1, 0).
empty(3, 0).
empty(3, 2).
empty(3, 3).
empty(3, 4).
empty(4, 3).
empty(4, 4).
empty(4, 1).
empty(4, 0).
wall(X, Y, north) :- Y = 0.
wall(X, Y, south) :- grid_size(N), M is N - 1, Y = M.
wall(X, Y, west) :- X = 0.
wall(X, Y, east) :- grid_size(N), M is N - 1, X = M.