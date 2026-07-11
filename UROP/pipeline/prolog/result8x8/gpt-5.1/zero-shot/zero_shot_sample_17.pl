% grid size
grid_size(8,8).

% locations
loc(0,0). loc(1,0). loc(2,0). loc(3,0). loc(4,0). loc(5,0). loc(6,0). loc(7,0).
loc(0,1). loc(1,1). loc(2,1). loc(3,1). loc(4,1). loc(5,1). loc(6,1). loc(7,1).
loc(0,2). loc(1,2). loc(2,2). loc(3,2). loc(4,2). loc(5,2). loc(6,2). loc(7,2).
loc(0,3). loc(1,3). loc(2,3). loc(3,3). loc(4,3). loc(5,3). loc(6,3). loc(7,3).
loc(0,4). loc(1,4). loc(2,4). loc(3,4). loc(4,4). loc(5,4). loc(6,4). loc(7,4).
loc(0,5). loc(1,5). loc(2,5). loc(3,5). loc(4,5). loc(5,5). loc(6,5). loc(7,5).
loc(0,6). loc(1,6). loc(2,6). loc(3,6). loc(4,6). loc(5,6). loc(6,6). loc(7,6).
loc(0,7). loc(1,7). loc(2,7). loc(3,7). loc(4,7). loc(5,7). loc(6,7). loc(7,7).

% static walls at locations
wall(0,0,west).
wall(0,0,north).
wall(1,0,north).
wall(2,0,north).
wall(3,0,north).
wall(4,0,north).
wall(5,0,north).
wall(6,0,north).
wall(7,0,north).
wall(7,0,east).

wall(0,1,west).
wall(7,1,east).

wall(0,2,west).
wall(7,2,east).

wall(0,3,west).
wall(7,3,east).

wall(0,4,west).
wall(7,4,east).

wall(0,5,west).
wall(7,5,east).

wall(0,6,west).
wall(7,6,east).

wall(0,7,west).
wall(0,7,south).
wall(1,7,south).
wall(2,7,south).
wall(3,7,south).
wall(4,7,south).
wall(5,7,south).
wall(6,7,south).
wall(7,7,south).
wall(7,7,east).

% contents: dirt
dirt(2,1,orange).
dirt(3,4,orange).
dirt(4,6,orange).
dirt(6,4,orange).
dirt(5,1,green).

% contents: agents
agent(0,3,id('9af04778-08d6-4e40-8c6f-ba123d292a22'),orange).
agent(4,0,id('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'),green).

% derived wall symmetry
has_wall(X,Y,Dir) :- wall(X,Y,Dir).
has_wall(X,Y,east) :-
    loc(X,Y),
    X1 is X+1,
    loc(X1,Y),
    wall(X1,Y,west).
has_wall(X,Y,west) :-
    loc(X,Y),
    X1 is X-1,
    loc(X1,Y),
    wall(X1,Y,east).
has_wall(X,Y,north) :-
    loc(X,Y),
    Y1 is Y-1,
    loc(X,Y1),
    wall(X,Y1,south).
has_wall(X,Y,south) :-
    loc(X,Y),
    Y1 is Y+1,
    loc(X,Y1),
    wall(X,Y1,north).

% emptiness
empty(X,Y) :-
    loc(X,Y),
    \+ dirt(X,Y,_),
    \+ agent(X,Y,_,_).