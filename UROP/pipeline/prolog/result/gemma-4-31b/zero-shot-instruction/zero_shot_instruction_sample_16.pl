location(0, 0).
location(1, 0).
location(2, 0).
location(3, 0).
location(4, 0).
location(5, 0).
location(6, 0).
location(7, 0).
location(8, 0).
location(9, 0).
location(10, 0).
location(0, 1).
location(1, 1).
location(2, 1).
location(3, 1).
location(4, 1).
location(5, 1).
location(6, 1).
location(7, 1).
location(8, 1).
location(9, 1).
location(10, 1).
location(0, 2).
location(1, 2).
location(2, 2).
location(3, 2).
location(4, 2).
location(5, 2).
location(6, 2).
location(7, 2).
location(8, 2).
location(9, 2).
location(10, 2).
location(0, 3).
location(1, 3).
location(2, 3).
location(3, 3).
location(4, 3).
location(5, 3).
location(6, 3).
location(7, 3).
location(8, 3).
location(9, 3).
location(10, 3).
location(0, 4).
location(1, 4).
location(2, 4).
location(3, 4).
location(4, 4).
location(5, 4).
location(6, 4).
location(7, 4).
location(8, 4).
location(9, 4).
location(10, 4).
location(0, 5).
location(1, 5).
location(2, 5).
location(3, 5).
location(4, 5).
location(5, 5).
location(6, 5).
location(7, 5).
location(8, 5).
location(9, 5).
location(10, 5).
location(0, 6).
location(1, 6).
location(2, 6).
location(3, 6).
location(4, 6).
location(5, 6).
location(6, 6).
location(7, 6).
location(8, 6).
location(9, 6).
location(10, 6).
location(0, 7).
location(1, 7).
location(2, 7).
location(3, 7).
location(4, 7).
location(5, 7).
location(6, 7).
location(7, 7).
location(8, 7).
location(9, 7).
location(10, 7).
location(0, 8).
location(1, 8).
location(2, 8).
location(3, 8).
location(4, 8).
location(5, 8).
location(6, 8).
location(7, 8).
location(8, 8).
location(9, 8).
location(10, 8).
location(0, 9).
location(1, 9).
location(2, 9).
location(3, 9).
location(4, 9).
location(5, 9).
location(6, 9).
location(7, 9).
location(8, 9).
location(9, 9).
location(10, 9).
location(0, 10).
location(1, 10).
location(2, 10).
location(3, 10).
location(4, 10).
location(5, 10).
location(6, 10).
location(7, 10).
location(8, 10).
location(9, 10).
location(10, 10).

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent(1, 0, orange).
agent(5, 0, green).

wall(X, Y, north) :- Y = 0.
wall(X, Y, south) :- Y = 10.
wall(X, Y, west) :- X = 0.
wall(X, Y, east) :- X = 10.