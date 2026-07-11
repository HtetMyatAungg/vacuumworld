grid_size(5).

grid(0,0).
grid(1,0).
grid(2,0).
grid(3,0).
grid(4,0).
grid(0,1).
grid(1,1).
grid(2,1).
grid(3,1).
grid(4,1).
grid(0,2).
grid(1,2).
grid(2,2).
grid(3,2).
grid(4,2).
grid(0,3).
grid(1,3).
grid(2,3).
grid(3,3).
grid(4,3).
grid(0,4).
grid(1,4).
grid(2,4).
grid(3,4).
grid(4,4).

dirt(2,3, orange).
dirt(1,2, green).
dirt(3,1, orange).

agent('c942b0ce-6c70-4311-a5b7-6b2640fe417c', 2, 0, green).
agent('ec1d58f6-6db4-473d-af3e-518ca49c39f9', 4, 2, orange).

empty(0,0).
empty(1,0).
empty(3,0).
empty(4,0).
empty(0,1).
empty(1,1).
empty(2,1).
empty(4,1).
empty(0,2).
empty(2,2).
empty(3,2).
empty(0,3).
empty(1,3).
empty(3,3).
empty(4,3).
empty(0,4).
empty(1,4).
empty(2,4).
empty(3,4).
empty(4,4).

wall(X, Y, north) :- grid_size(N), Y =:= 0, X >= 0, X < N.
wall(X, Y, south) :- grid_size(N), Y =:= N - 1, X >= 0, X < N.
wall(X, Y, west) :- grid_size(N), X =:= 0, Y >= 0, Y < N.
wall(X, Y, east) :- grid_size(N), X =:= N - 1, Y >= 0, Y < N.