% Grid size
grid_size(11,11).

% Basic coordinate fact
coord(X,Y) :- between(0,10,X), between(0,10,Y).

% Walls from percept log
wall(0,9,west).
wall(0,10,south).
wall(0,10,west).
wall(1,10,south).
wall(2,10,south).
wall(0,8,west).
wall(0,7,west).
wall(0,6,west).
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
wall(3,10,south).
wall(4,10,south).
wall(4,0,north).
wall(5,0,north).
wall(5,10,south).
wall(6,10,south).
wall(6,0,north).
wall(7,0,north).
wall(7,10,south).
wall(8,10,south).
wall(8,0,north).
wall(9,0,north).
wall(9,10,south).
wall(10,8,east).
wall(10,9,east).
wall(10,10,east).
wall(10,10,south).
wall(10,7,east).
wall(10,6,east).
wall(10,5,east).
wall(10,4,east).
wall(10,3,east).
wall(10,2,east).
wall(10,1,east).
wall(10,0,east).
wall(10,0,north).

% Boundary wall rules (generalised)
wall(X,0,north) :- coord(X,0), \+ wall(X,0,north).
wall(X,MaxY,south) :- grid_size(_,H), MaxY is H-1, coord(X,MaxY), \+ wall(X,MaxY,south).
wall(0,Y,west) :- coord(0,Y), \+ wall(0,Y,west).
wall(MaxX,Y,east) :- grid_size(W,_), MaxX is W-1, coord(MaxX,Y), \+ wall(MaxX,Y,east).

% Dirt from percept log
dirt(1,4,orange).
dirt(3,3,orange).
dirt(3,6,orange).
dirt(5,7,orange).
dirt(7,5,green).
dirt(9,2,green).
dirt(9,7,green).

% Agents from percept log
agent(1,0,'d3af9897-9139-4ffe-8a15-2e9c6f06e71a',orange).
agent(5,0,'d6428e63-73b7-40a5-9cc9-ea3b5e61a86d',green).

% Location contents
location(X,Y,dirt(Color)) :- dirt(X,Y,Color).
location(X,Y,agent(Id,Color)) :- agent(X,Y,Id,Color).
location(X,Y,empty) :-
    coord(X,Y),
    \+ dirt(X,Y,_),
    \+ agent(X,Y,_,_).