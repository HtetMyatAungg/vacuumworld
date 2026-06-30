cell(0, 0, [], null, null).
cell(1, 0, [], null, null).
cell(2, 0, [], null, null).
cell(3, 0, [], null, null).
cell(4, 0, [], null, agent(02a6d9ea8b8e47508000c3a74a63fd9c, green)).
cell(5, 0, [], null, null).
cell(6, 0, [], null, null).
cell(7, 0, [], null, null).
cell(0, 1, [], null, null).
cell(1, 1, [], null, null).
cell(2, 1, [dirt(orange)], null, null).
cell(3, 1, [], null, null).
cell(4, 1, [], null, null).
cell(5, 1, [dirt(green)], null, null).
cell(6, 1, [], null, null).
cell(7, 1, [], null, null).
cell(0, 2, [], null, null).
cell(1, 2, [], null, null).
cell(2, 2, [], null, null).
cell(3, 2, [], null, null).
cell(4, 2, [], null, null).
cell(5, 2, [], null, null).
cell(6, 2, [], null, null).
cell(7, 2, [], null, null).
cell(0, 3, [], null, agent(9af0477808d64e408c6fba123d292a22, orange)).
cell(1, 3, [], null, null).
cell(2, 3, [], null, null).
cell(3, 3, [], null, null).
cell(4, 3, [], null, null).
cell(5, 3, [], null, null).
cell(6, 3, [], null, null).
cell(7, 3, [], null, null).
cell(0, 4, [], null, null).
cell(1, 4, [], null, null).
cell(2, 4, [], null, null).
cell(3, 4, [dirt(orange)], null, null).
cell(4, 4, [], null, null).
cell(5, 4, [], null, null).
cell(6, 4, [dirt(orange)], null, null).
cell(7, 4, [], null, null).
cell(0, 5, [], null, null).
cell(1, 5, [], null, null).
cell(2, 5, [], null, null).
cell(3, 5, [], null, null).
cell(4, 5, [], null, null).
cell(5, 5, [], null, null).
cell(6, 5, [], null, null).
cell(7, 5, [], null, null).
cell(0, 6, [], null, null).
cell(1, 6, [], null, null).
cell(2, 6, [], null, null).
cell(3, 6, [], null, null).
cell(4, 6, [dirt(orange)], null, null).
cell(5, 6, [], null, null).
cell(6, 6, [], null, null).
cell(7, 6, [], null, null).
cell(0, 7, [], null, null).
cell(1, 7, [], null, null).
cell(2, 7, [], null, null).
cell(3, 7, [], null, null).
cell(4, 7, [], null, null).
cell(5, 7, [], null, null).
cell(6, 7, [], null, null).
cell(7, 7, [], null, null).

wall(X, Y, north) :- Y = 0.
wall(X, Y, south) :- Y = 7.
wall(X, Y, west) :- X = 0.
wall(X, Y, east) :- X = 7.