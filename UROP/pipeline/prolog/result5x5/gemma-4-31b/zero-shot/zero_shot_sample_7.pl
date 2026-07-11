grid_size(5, 5).

dirt(2, 3, orange).
dirt(1, 2, green).
dirt(3, 1, orange).

agent(2, 0, c942b0ce-6c70-4311-a5b7-6b2640fe417c, green).
agent(4, 2, ec1d58f6-6db4-473d-af3e-518ca49c39f9, orange).

wall(0, 3, west).
wall(1, 3, none).
wall(2, 3, none).
wall(0, 4, south).
wall(0, 4, west).
wall(1, 4, south).
wall(2, 4, south).
wall(0, 2, west).
wall(1, 2, none).
wall(2, 2, none).
wall(0, 1, west).
wall(1, 1, none).
wall(2, 1, none).
wall(0, 0, north).
wall(0, 0, west).
wall(1, 0, north).
wall(2, 0, north).
wall(3, 0, north).
wall(3, 1, none).
wall(3, 2, none).
wall(3, 3, none).
wall(3, 4, south).
wall(4, 2, east).
wall(4, 3, east).
wall(4, 4, east).
wall(4, 4, south).
wall(4, 1, east).
wall(4, 0, east).
wall(4, 0, north).

wall(X, Y, north) :- Y =:= 0.
wall(X, Y, south) :- Y =:= 4.
wall(X, Y, west) :- X =:= 0.
wall(X, Y, east) :- X =:= 4.