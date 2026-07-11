% Grid boundaries
grid_size(5,5).

% Directions
direction(north).
direction(south).
direction(east).
direction(west).

% Cells and contents
cell(0,3).
wall(0,3,west).

cell(1,3).

cell(2,3).
dirt(2,3,orange).

cell(0,4).
wall(0,4,south).
wall(0,4,west).

cell(1,4).
wall(1,4,south).

cell(2,4).
wall(2,4,south).

cell(0,2).
wall(0,2,west).

cell(1,2).
dirt(1,2,green).

cell(2,2).

cell(0,1).
wall(0,1,west).

cell(1,1).

cell(2,1).

cell(0,0).
wall(0,0,north).
wall(0,0,west).

cell(1,0).
wall(1,0,north).

cell(2,0).
wall(2,0,north).
agent(2,0,'c942b0ce-6c70-4311-a5b7-6b2640fe417c',green).

cell(3,0).
wall(3,0,north).

cell(3,1).
dirt(3,1,orange).

cell(3,2).

cell(3,3).

cell(3,4).
wall(3,4,south).

cell(4,2).
wall(4,2,east).
agent(4,2,'ec1d58f6-6db4-473d-af3e-518ca49c39f9',orange).

cell(4,3).
wall(4,3,east).

cell(4,4).
wall(4,4,east).
wall(4,4,south).

cell(4,1).
wall(4,1,east).

cell(4,0).
wall(4,0,east).
wall(4,0,north).

% Boundary walls for all cells based on grid_size
boundary_wall(X,Y,west) :-
    cell(X,Y),
    X = 0.
boundary_wall(X,Y,east) :-
    cell(X,Y),
    grid_size(W,_),
    X =:= W-1.
boundary_wall(X,Y,north) :-
    cell(X,Y),
    Y = 0.
boundary_wall(X,Y,south) :-
    cell(X,Y),
    grid_size(_,H),
    Y =:= H-1.

has_wall(X,Y,Dir) :-
    wall(X,Y,Dir).
has_wall(X,Y,Dir) :-
    boundary_wall(X,Y,Dir).

location_content(X,Y,dirt(Color)) :-
    dirt(X,Y,Color).
location_content(X,Y,agent(Id,Color)) :-
    agent(X,Y,Id,Color).
location_content(X,Y,empty) :-
    cell(X,Y),
    \+ dirt(X,Y,_),
    \+ agent(X,Y,_,_).