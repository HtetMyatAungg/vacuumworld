grid_size(5).

wall(0, 3, west).
wall(0, 4, south).
wall(0, 4, west).
wall(1, 4, south).
wall(2, 4, south).
wall(0, 2, west).
wall(0, 1, west).
wall(0, 0, north).
wall(0, 0, west).
wall(1, 0, north).
wall(2, 0, north).
wall(3, 0, north).
wall(3, 4, south).
wall(4, 2, east).
wall(4, 3, east).
wall(4, 4, east).
wall(4, 4, south).
wall(4, 1, east).
wall(4, 0, east).
wall(4, 0, north).

dirt(2, 3, orange).
dirt(1, 2, green).
dirt(3, 1, orange).

agent(2, 0, 'c942b0ce-6c70-4311-a5b7-6b2640fe417c', green).
agent(4, 2, 'ec1d58f6-6db4-473d-af3e-518ca49c39f9', orange).

has_wall(X, Y, Dir) :- wall(X, Y, Dir).
has_wall(0, _, west).
has_wall(X, _, east) :- grid_size(N), X is N - 1.
has_wall(_, 0, north).
has_wall(_, Y, south) :- grid_size(N), Y is N - 1.