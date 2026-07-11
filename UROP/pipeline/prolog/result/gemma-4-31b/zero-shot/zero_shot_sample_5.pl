cell(0, 0, empty).
cell(1, 0, empty).
cell(2, 0, agent(c942b0ce-6c70-4311-a5b7-6b2640fe417c, green)).
cell(3, 0, empty).
cell(4, 0, empty).
cell(0, 1, empty).
cell(1, 1, empty).
cell(2, 1, empty).
cell(3, 1, dirt(orange)).
cell(4, 1, empty).
cell(0, 2, empty).
cell(1, 2, dirt(green)).
cell(2, 2, empty).
cell(3, 2, empty).
cell(4, 2, agent(ec1d58f6-6db4-473d-af3e-518ca49c39f9, orange)).
cell(0, 3, empty).
cell(1, 3, empty).
cell(2, 3, dirt(orange)).
cell(3, 3, empty).
cell(4, 3, empty).
cell(0, 4, empty).
cell(1, 4, empty).
cell(2, 4, empty).
cell(3, 4, empty).
cell(4, 4, empty).

wall(X, Y, north) :- (Y = 0); (X = 0, Y = 0); (X = 1, Y = 0); (X = 2, Y = 0); (X = 3, Y = 0); (X = 4, Y = 0).
wall(X, Y, south) :- (Y = 4).
wall(X, Y, west) :- (X = 0).
wall(X, Y, east) :- (X = 4).