% grid size
grid_size(8,8).

% locations
location(0,0). location(1,0). location(2,0). location(3,0). location(4,0). location(5,0). location(6,0). location(7,0).
location(0,1). location(1,1). location(2,1). location(3,1). location(4,1). location(5,1). location(6,1). location(7,1).
location(0,2). location(1,2). location(2,2). location(3,2). location(4,2). location(5,2). location(6,2). location(7,2).
location(0,3). location(1,3). location(2,3). location(3,3). location(4,3). location(5,3). location(6,3). location(7,3).
location(0,4). location(1,4). location(2,4). location(3,4). location(4,4). location(5,4). location(6,4). location(7,4).
location(0,5). location(1,5). location(2,5). location(3,5). location(4,5). location(5,5). location(6,5). location(7,5).
location(0,6). location(1,6). location(2,6). location(3,6). location(4,6). location(5,6). location(6,6). location(7,6).
location(0,7). location(1,7). location(2,7). location(3,7). location(4,7). location(5,7). location(6,7). location(7,7).

% walls from percepts
wall(0,6,west).
wall(0,7,south). wall(0,7,west).
wall(1,7,south).
wall(2,7,south).
wall(0,5,west).
wall(0,4,west).
wall(0,3,west).
wall(0,2,west).
wall(0,1,west).
wall(0,0,north). wall(0,0,west).
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
wall(7,0,east). wall(7,0,north).
wall(7,1,east).
wall(7,2,east).
wall(7,3,east).
wall(7,4,east).
wall(7,5,east).
wall(7,6,east).
wall(7,7,east). wall(7,7,south).

% inferred boundary walls (grid edges not already listed)
wall(X,0,north) :- location(X,0), \+ wall(X,0,north).
wall(X,7,south) :- location(X,7), \+ wall(X,7,south).
wall(0,Y,west)  :- location(0,Y), \+ wall(0,Y,west).
wall(7,Y,east)  :- location(7,Y), \+ wall(7,Y,east).

% dirt
dirt(2,1,orange).
dirt(3,4,orange).
dirt(4,6,orange).
dirt(5,1,green).
dirt(6,4,orange).

% agents
agent(0,3,'9af04778-08d6-4e40-8c6f-ba123d292a22',orange).
agent(4,0,'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',green).

% contents
contents(X,Y,dirt(Color)) :- dirt(X,Y,Color).
contents(X,Y,agent(Id,Color)) :- agent(X,Y,Id,Color).
contents(X,Y,empty) :- location(X,Y), \+ dirt(X,Y,_), \+ agent(X,Y,_,_).