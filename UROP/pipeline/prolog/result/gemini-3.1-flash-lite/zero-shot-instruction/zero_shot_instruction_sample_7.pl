cell(X, Y) :- integer(X), integer(Y), X >= 0, X =< 10, Y >= 0, Y =< 10.
wall(X, Y, north) :- Y = 0.
wall(X, Y, south) :- Y = 10.
wall(X, Y, west) :- X = 0.
wall(X, Y, east) :- X = 10.
wall(X, Y, north) :- member([X, Y], [[0,0], [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0], [8,0], [9,0], [10,0]]).
wall(X, Y, south) :- member([X, Y], [[0,10], [1,10], [2,10], [3,10], [4,10], [5,10], [6,10], [7,10], [8,10], [9,10], [10,10]]).
wall(X, Y, west) :- member([X, Y], [[0,9], [0,10], [0,8], [0,7], [0,6], [0,5], [0,4], [0,3], [0,2], [0,1], [0,0]]).
wall(X, Y, east) :- member([X, Y], [[10,8], [10,9], [10,10], [10,7], [10,6], [10,5], [10,4], [10,3], [10,2], [10,1], [10,0]]).
dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).
agent(1, 0, 'd3af9897-9139-4ffe-8a15-2e9c6f06e71a', orange).
agent(5, 0, 'd6428e63-73b7-40a5-9cc9-ea3b5e61a86d', green).