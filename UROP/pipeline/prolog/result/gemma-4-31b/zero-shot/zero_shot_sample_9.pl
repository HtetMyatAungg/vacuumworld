grid_size(5, 5).

dirt(2, 3, orange).
dirt(1, 2, green).
dirt(3, 1, orange).

agent(2, 0, c942b0ce-6c70-4311-a5b7-6b2640fe417c, green).
agent(4, 2, ec1d58f6-6db4-473d-af3e-518ca49c39f9, orange).

wall(X, Y, north) :- Y = 0.
wall(X, Y, south) :- Y = 4.
wall(X, Y, west) :- X = 0.
wall(X, Y, east) :- X = 4.