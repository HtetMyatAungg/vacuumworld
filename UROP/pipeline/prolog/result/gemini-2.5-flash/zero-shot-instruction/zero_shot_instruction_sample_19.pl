grid_dimension(11).
max_coord(10).

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent(1, 0, 'd3af9897-9139-4ffe-8a15-2e9c6f06e71a', orange).
agent(5, 0, 'd6428e63-73b7-40a5-9cc9-ea3b5e61a86d', green).

wall(X, 0, north) :-
    max_coord(Max),
    between(0, Max, X).
wall(X, MaxY, south) :-
    max_coord(MaxY),
    between(0, MaxY, X).
wall(0, Y, west) :-
    max_coord(MaxX),
    between(0, MaxX, Y).
wall(MaxX, Y, east) :-
    max_coord(MaxX),
    between(0, MaxX, Y).