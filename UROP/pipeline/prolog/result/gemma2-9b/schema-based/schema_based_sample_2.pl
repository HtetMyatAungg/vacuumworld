grid_size(7).
grid(0,0).
grid(1,0).
grid(2,0).
grid(3,0).
grid(4,0).
grid(5,0).
grid(6,0).
grid(0,1).
grid(1,1).
grid(2,1).
grid(3,1).
grid(4,1).
grid(5,1).
grid(6,1).
grid(0,2).
grid(1,2).
grid(2,2).
grid(3,2).
grid(4,2).
grid(5,2).
grid(6,2).
grid(0,3).
grid(1,3).
grid(2,3).
grid(3,3).
grid(4,3).
grid(5,3).
grid(6,3).
grid(0,4).
grid(1,4).
grid(2,4).
grid(3,4).
grid(4,4).
grid(5,4).
grid(6,4).
grid(0,5).
grid(1,5).
grid(2,5).
grid(3,5).
grid(4,5).
grid(5,5).
grid(6,5).
grid(0,6).
grid(1,6).
grid(2,6).
grid(3,6).
grid(4,6).
grid(5,6).
grid(6,6).
dirt(4,5,'green').
dirt(5,4,'orange').
agent(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c,4,0,'green'). 
   
empty(X,Y):- \+ member(X,[0,1,2,3,4,5,6]),member(Y,[0,1,2,3,4,5,6]).
wall(0,Y,'south').
wall(7,Y,'south').
wall(X,0 ,'north').
wall(X,7,'north').




