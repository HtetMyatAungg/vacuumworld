grid_size(11).

grid(X,Y) :- between(0, 10, X), between(0, 10, Y).

dirt(1,4, orange).
dirt(3,3, orange).
dirt(3,6, orange).
dirt(5,7, orange).
dirt(7,5, green).
dirt(9,2, green).
dirt(9,7, green).

agent('d3af9897-9139-4ffe-8a15-2e9c6f06e71a', 1,0, orange).
agent('d6428e63-73b7-40a5-9cc9-ea3b5e61a86d', 5,0, green).

empty(0,0).
empty(0,1).
empty(0,2).
empty(0,3).
empty(0,4).
empty(0,5).
empty(0,6).
empty(0,7).
empty(0,8).
empty(0,9).
empty(0,10).
empty(1,1).
empty(1,2).
empty(1,3).
empty(1,5).
empty(1,6).
empty(1,7).
empty(1,8).
empty(1,9).
empty(1,10).
empty(2,0).
empty(2,1).
empty(2,2).
empty(2,3).
empty(2,4).
empty(2,5).
empty(2,6).
empty(2,7).
empty(2,8).
empty(2,9).
empty(2,10).
empty(3,0).
empty(3,1).
empty(3,2).
empty(3,4).
empty(3,5).
empty(3,7).
empty(3,8).
empty(3,9).
empty(3,10).
empty(4,0).
empty(4,1).
empty(4,2).
empty(4,3).
empty(4,4).
empty(4,5).
empty(4,6).
empty(4,7).
empty(4,8).
empty(4,9).
empty(4,10).
empty(5,1).
empty(5,2).
empty(5,3).
empty(5,4).
empty(5,5).
empty(5,6).
empty(5,8).
empty(5,9).
empty(5,10).
empty(6,0).
empty(6,1).
empty(6,2).
empty(6,3).
empty(6,4).
empty(6,5).
empty(6,6).
empty(6,7).
empty(6,8).
empty(6,9).
empty(6,10).
empty(7,0).
empty(7,1).
empty(7,2).
empty(7,3).
empty(7,4).
empty(7,6).
empty(7,7).
empty(7,8).
empty(7,9).
empty(7,10).
empty(8,0).
empty(8,1).
empty(8,2).
empty(8,3).
empty(8,4).
empty(8,5).
empty(8,6).
empty(8,7).
empty(8,8).
empty(8,9).
empty(8,10).
empty(9,0).
empty(9,1).
empty(9,3).
empty(9,4).
empty(9,5).
empty(9,6).
empty(9,8).
empty(9,9).
empty(9,10).
empty(10,0).
empty(10,1).
empty(10,2).
empty(10,3).
empty(10,4).
empty(10,5).
empty(10,6).
empty(10,7).
empty(10,8).
empty(10,9).
empty(10,10).

wall(X, Y, north) :- grid_size(N), Y =:= 0, X >= 0, X < N.
wall(X, Y, south) :- grid_size(N), Y =:= N - 1, X >= 0, X < N.
wall(X, Y, west) :- grid_size(N), X =:= 0, Y >= 0, Y < N.
wall(X, Y, east) :- grid_size(N), X =:= N - 1, Y >= 0, Y < N.