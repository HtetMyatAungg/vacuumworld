wall(0, _, west).
wall(_, 0, north).
wall(7, _, east).
wall(_, 7, south).

dirt(2, 1, orange).
dirt(3, 4, orange).
dirt(4, 6, orange).
dirt(6, 4, orange).
dirt(5, 1, green).

agent(0, 3, orange).
agent(4, 0, green).

location(X, Y) :- member(X, [0,1,2,3,4,5,6,7]), member(Y, [0,1,2,3,4,5,6,7]).