% grid dimensions
grid_size(5,5).

% base locations
location(0,0).
location(1,0).
location(2,0).
location(3,0).
location(4,0).
location(0,1).
location(1,1).
location(2,1).
location(3,1).
location(4,1).
location(0,2).
location(1,2).
location(2,2).
location(3,2).
location(4,2).
location(0,3).
location(1,3).
location(2,3).
location(3,3).
location(4,3).
location(0,4).
location(1,4).
location(2,4).
location(3,4).
location(4,4).

% walls from percepts
wall(0,3,west).
wall(0,4,south).
wall(0,4,west).
wall(1,4,south).
wall(2,4,south).
wall(0,2,west).
wall(0,1,west).
wall(0,0,north).
wall(0,0,west).
wall(1,0,north).
wall(2,0,north).
wall(3,0,north).
wall(3,4,south).
wall(4,2,east).
wall(4,3,east).
wall(4,4,east).
wall(4,4,south).
wall(4,1,east).
wall(4,0,east).
wall(4,0,north).

% explicit boundary walls (derived)
wall(X,0,north) :- grid_size(_,H), between(0,H1,0), H1 is H-1, location(X,0).
wall(X,Y,south) :- grid_size(_,H), Y is H-1, location(X,Y).
wall(0,Y,west)  :- grid_size(W,_), between(0,W1,Y), W1 is W-1, location(0,Y).
wall(X,Y,east)  :- grid_size(W,_), X is W-1, location(X,Y).

% dirt
dirt(2,3,orange).
dirt(1,2,green).
dirt(3,1,orange).

% agents
agent(2,0,'c942b0ce-6c70-4311-a5b7-6b2640fe417c',green).
agent(4,2,'ec1d58f6-6db4-473d-af3e-518ca49c39f9',orange).

% contents
content(X,Y,dirt(Color)) :- dirt(X,Y,Color).
content(X,Y,agent(Id,Color)) :- agent(X,Y,Id,Color).
content(X,Y,empty) :-
    location(X,Y),
    \+ dirt(X,Y,_),
    \+ agent(X,Y,_,_).