grid_size(11, 11).

agent(d3af9897-9139-4ffe-8a15-2e9c6f06e71a, orange, 1, 0).
agent(d6428e63-73b7-40a5-9cc9-ea3b5e61a86d, green, 5, 0).

dirt(orange, 1, 4).
dirt(orange, 3, 3).
dirt(orange, 3, 6).
dirt(orange, 5, 7).
dirt(green, 7, 5).
dirt(green, 9, 2).
dirt(green, 9, 7).

wall(X, Y, north) :- 
    grid_size(_, _), 
    Y = 0.
wall(X, Y, south) :- 
    grid_size(_, MaxY), 
    Y = MaxY.
wall(X, Y, west) :- 
    grid_size(_, _), 
    X = 0.
wall(X, Y, east) :- 
    grid_size(MaxX, _), 
    X = MaxX.

connected(X1, Y1, X2, Y2) :-
    (X2 is X1 + 1, Y2 = Y1, \+ wall(X1, Y1, east), \+ wall(X2, Y2, west));
    (X2 is X1 - 1, Y2 = Y1, \+ wall(X1, Y1, west), \+ wall(X2, Y2, east));
    (X1 = X2, Y2 is Y1 + 1, \+ wall(X1, Y1, south), \+ wall(X2, Y2, north));
    (X1 = X2, Y2 is Y1 - 1, \+ wall(X1, Y1, north), \+ wall(X2, Y2, south)).