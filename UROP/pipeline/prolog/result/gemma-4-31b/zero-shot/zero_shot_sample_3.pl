agent(d3af9897-9139-4ffe-8a15-2e9c6f06e71a, orange, 1, 0).
agent(d6428e63-73b7-40a5-9cc9-ea3b5e61a86d, green, 5, 0).

dirt(orange, 1, 4).
dirt(orange, 3, 3).
dirt(orange, 3, 6).
dirt(orange, 5, 7).
dirt(green, 7, 5).
dirt(green, 9, 2).
dirt(green, 9, 7).

wall(0, Y, west) :- member(Y, [0,1,2,3,4,5,6,7,8,9,10]).
wall(X, 0, north) :- member(X, [0,1,2,3,4,5,6,7,8,9,10]).
wall(10, Y, east) :- member(Y, [0,1,2,3,4,5,6,7,8,9,10]).
wall(X, 10, south) :- member(X, [0,1,2,3,4,5,6,7,8,9,10]).