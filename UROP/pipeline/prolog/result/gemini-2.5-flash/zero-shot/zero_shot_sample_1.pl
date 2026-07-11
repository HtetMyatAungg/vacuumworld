grid_size(5).

cell(X, Y) :-
    grid_size(N),
    between(0, N - 1, X),
    between(0, N - 1, Y).

wall(0, 3, west).
wall(0, 4, south).
wall(0, 4, west).
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

location(2, 3, dirt(orange)).
location(1, 2, dirt(green)).
location(3, 1, dirt(orange)).
location(2, 0, agent('c942b0ce-6c70-4311-a5b7-6b2640fe417c', green)).
location(4, 2, agent('ec1d58f6-6db4-473d-af3e-518ca49c39f9', orange)).