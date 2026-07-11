cell(0, 3, empty). wall(0, 3, west).
cell(1, 3, empty). 
cell(2, 3, dirt(orange)). 
cell(0, 4, empty). wall(0, 4, south). wall(0, 4, west).
cell(1, 4, empty). wall(1, 4, south).
cell(2, 4, empty). wall(2, 4, south).
cell(0, 2, empty). wall(0, 2, west).
cell(1, 2, dirt(green)). 
cell(2, 2, empty). 
cell(0, 1, empty). wall(0, 1, west).
cell(1, 1, empty). 
cell(2, 1, empty). 
cell(0, 0, empty). wall(0, 0, north). wall(0, 0, west).
cell(1, 0, empty). wall(1, 0, north).
cell(2, 0, agent('c942b0ce-6c70-4311-a5b7-6b2640fe417c', green)). wall(2, 0, north).
cell(3, 0, empty). wall(3, 0, north).
cell(3, 1, dirt(orange)). 
cell(3, 2, empty). 
cell(3, 3, empty). 
cell(3, 4, empty). wall(3, 4, south).
cell(4, 2, agent('ec1d58f6-6db4-473d-af3e-518ca49c39f9', orange)). wall(4, 2, east).
cell(4, 3, empty). wall(4, 3, east).
cell(4, 4, empty). wall(4, 4, east). wall(4, 4, south).
cell(4, 1, empty). wall(4, 1, east).
cell(4, 0, empty). wall(4, 0, east). wall(4, 0, north).
boundary_wall(N) :- N = 4.
boundary(X, Y) :- member(X, [0,4]), Y >= 0, Y =< 4.
boundary(X, Y) :- member(Y, [0,4]), X >= 0, X =< 4.