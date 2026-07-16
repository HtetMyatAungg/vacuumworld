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

walled(X, Y, north) :- 
    grid_size(_, _), 
    Y = 0.
walled(X, Y, south) :- 
    grid_size(_, Height), 
    Y is Height - 1.
walled(X, Y, west) :- 
    grid_size(_, _), 
    X = 0.
walled(X, Y, east) :- 
    grid_size(Width, _), 
    X is Width - 1.