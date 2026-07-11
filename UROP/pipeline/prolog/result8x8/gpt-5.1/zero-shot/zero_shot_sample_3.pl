% grid size
grid_size(8,8).

% contents: coord(X,Y), content(Type, Detail)
content(2,1, dirt(orange)).
content(3,4, dirt(orange)).
content(4,6, dirt(orange)).
content(5,1, dirt(green)).
content(6,4, dirt(orange)).

content(0,3, agent('9af04778-08d6-4e40-8c6f-ba123d292a22', orange)).
content(4,0, agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', green)).

% explicit border walls from percepts
wall(0,6,west).
wall(0,7,south).
wall(0,7,west).
wall(1,7,south).
wall(2,7,south).
wall(0,5,west).
wall(0,4,west).
wall(0,3,west).
wall(0,2,west).
wall(0,1,west).
wall(0,0,north).
wall(0,0,west).
wall(1,0,north).
wall(2,0,north).
wall(3,0,north).
wall(3,7,south).
wall(4,7,south).
wall(4,0,north).
wall(5,0,north).
wall(5,7,south).
wall(6,7,south).
wall(6,0,north).
wall(7,0,east).
wall(7,0,north).
wall(7,1,east).
wall(7,2,east).
wall(7,3,east).
wall(7,4,east).
wall(7,5,east).
wall(7,6,east).
wall(7,7,east).
wall(7,7,south).

% opposite directions
opposite(north,south).
opposite(south,north).
opposite(east,west).
opposite(west,east).

% neighbor relation
neighbor(X,Y,north,X,Y1) :- Y1 is Y-1, Y1 >= 0.
neighbor(X,Y,south,X,Y1) :- grid_size(_,H), Y1 is Y+1, Y1 < H.
neighbor(X,Y,west,X1,Y)  :- X1 is X-1, X1 >= 0.
neighbor(X,Y,east,X1,Y)  :- grid_size(W,_), X1 is X+1, X1 < W.

% induced internal walls: if wall at (X,Y,Dir) then opposite wall at neighbor
wall(X2,Y2,Dir2) :-
    wall(X1,Y1,Dir1),
    neighbor(X1,Y1,Dir1,X2,Y2),
    opposite(Dir1,Dir2).