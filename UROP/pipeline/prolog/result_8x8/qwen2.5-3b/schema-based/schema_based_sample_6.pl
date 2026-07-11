grid_size(8).
% General grid rule for X=0..n-1, Y=0..n-1
:- (X < 0 ; X >= 8 ; Y < 0 ; Y >= 8), grid(X,Y).

% For all cells in the grid
grid(X,Y) :-
    X == 0, Y == 0\+ grid_size(N),
    grid_inner(X-1,Y)\+ grid_size(N), 
    wall(X,Y,east);    
    X == Y, Y == 7\+ grid_size(N),
    grid_inner(X-1,Y)\+grid_size(N), 
    wall(X,Y,south);
    X == 6, Y > 0\+ grid_size(N),
    grid_inner(X-1,Y)\+grid_size(N), 
    wall(X,Y,north);  
    X < 7,\+ grid_size(N),
    grid_inner(X-1,Y)\+grid_size(N), 
    wall(X,Y,west).

% Inner square for cells not on the edge
grid_inner(X,Y) :- 
    Y > 0,
    (X == 0 -> X1 is X; X1 is X-1), 
    Y < 7, (Y1 is Y+1),
    grid(X1,Y1).

wall(X,Y,north).
wall(X,Y,south).
wall(X,Y,east).  
wall(X,Y,west).

dirt(4,5,_).
dirt(6,3,_).
dirt(7,2,green).

agent("9af04778-08d6-4e40-8c6f-ba123d292a22", 0,6,orange).
agent("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", 4,5,green).

empty(X,Y) :-
    \+ grid(X,Y),
    \+ wall(X,Y,north),
    \+ wall(X,Y,south),
    \+ wall(X,Y,east),
    \+ wall(X,Y,west).