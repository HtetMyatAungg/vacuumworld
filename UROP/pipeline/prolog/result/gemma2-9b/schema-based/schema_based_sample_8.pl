grid_size(7).
grid(0,Y) :- Y #= between(0,6,1).
grid(X,0) :- X #= between(0,6,1).
grid(X,Y) :-  X #= between(1,6,1), Y #= between(1,6,1).
dirt(4,5,'orange').
dirt(6,4,'orange').
agent(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c, 4, 0, green).
wall(0,Y,north) :- Y #= between(1,6,1).
wall(X,0,west) :- X #= between(1,6,1).
wall(7,Y,east) :- Y #= between(0,6,1).
wall(X,7,south) :- X #= between(0,6,1). 


