grid(n, n,
    side(west, 0, 6),
    side(east, 7, 6),
    side(south, 7, 1),
    side(north, 0, 1)
).

% Agent presence encoding: agent(X,Y) when non-empty is found
agent(9af04778-08d6-4e40-8c6f-ba123d292a22, 0, 6),
agent(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c, 4, 7),

% Dirt presence encoding: dirt(X,Y) when non-empty is found
dirt(b192dea4-04ac-4f08-bca8-c100e4d3b5dd, 0, 4),
dirt(4c1a4fc2-697c-420d-98d6-e95c6a38c1da, 3, 6),

% Walls encoded: wall(north, X, Y), wall(east, X, Y), wall(south, X, Y), wall(west, X, Y)
wall(north, 0, 7),
wall(north, 1, 7),
wall(north, 2, 7),
wall(north, 3, 7),
wall(north, 4, 7),
wall(north, 5, 7),
wall(north, 6, 7),
wall(north, 7, 6),
wall(south, 0, 1),
wall(east, 0, 2),
wall(east, 0, 3),
wall(east, 1, 3),
wall(west, 5, 4).