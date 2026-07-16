% Grid dimensions
grid_size(11,11).

% Cells (X,Y) within the grid
cell(X,Y) :- grid_size(W,H), between(0,W1,X), W1 is W-1, between(0,H1,Y), H1 is H-1.

% Boundary walls
wall(north, X, 0) :- cell(X,0).
wall(south, X, Y) :- grid_size(_,H), Y is H-1, cell(X,Y).
wall(west, 0, Y) :- cell(0,Y).
wall(east, X, Y) :- grid_size(W,_), X is W-1, cell(X,Y).

% Dirt facts
dirt(1,4,orange).
dirt(3,3,orange).
dirt(3,6,orange).
dirt(5,7,orange).
dirt(7,5,green).
dirt(9,2,green).
dirt(9,7,green).

% Agent facts
agent(1,0,'d3af9897-9139-4ffe-8a15-2e9c6f06e71a',orange).
agent(5,0,'d6428e63-73b7-40a5-9cc9-ea3b5e61a86d',green).

% Empty location: any cell without dirt or agent
empty(X,Y) :- cell(X,Y), \+ dirt(X,Y,_), \+ agent(X,Y,_,_).