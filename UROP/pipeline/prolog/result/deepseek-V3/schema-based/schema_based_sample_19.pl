grid_size(5).
grid(X,Y) :- between(0,4,X), between(0,4,Y).
dirt(2,3,orange).
dirt(1,2,green).
dirt(3,1,orange).
agent('c942b0ce-6c70-4311-a5b7-6b2640fe417c',2,0,green).
agent('ec1d58f6-6db4-473d-af3e-518ca49c39f9',4,2,orange).
empty(X,Y) :- grid(X,Y), \+ dirt(X,Y,_), \+ agent(_,X,Y,_).
wall(X,Y, north) :- X >= 0, Y = 0.
wall(X,Y, south) :- X >= 0, Y = 4.
wall(X,Y, west) :- X = 0, Y >= 0.
wall(X,Y, east) :- X = 4, Y >= 0.