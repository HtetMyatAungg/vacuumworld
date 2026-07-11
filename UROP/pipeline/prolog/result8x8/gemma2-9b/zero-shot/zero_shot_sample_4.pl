grid_size(8).
grid(0,0).
grid(1,0).
grid(2,0).
grid(3,0).
grid(4,0).
grid(5,0).
grid(6,0).
grid(7,0).
grid(0,1).
grid(1,1).
grid(2,1).
grid(3,1).
grid(4,1).
grid(5,1).
grid(6,1).
grid(7,1).
grid(0,2).
grid(1,2).
grid(2,2).
grid(3,2).
grid(4,2).
grid(5,2).
grid(6,2).
grid(7,2).
grid(0,3).
grid(1,3).
grid(2,3).
grid(3,3).
grid(4,3).
grid(5,3).
grid(6,3).
grid(7,3).
grid(0,4).
grid(1,4).
grid(2,4).
grid(3,4).
grid(4,4).
grid(5,4).
grid(6,4).
grid(7,4).
grid(0,5).
grid(1,5).
grid(2,5).
grid(3,5).
grid(4,5).
grid(5,5).
grid(6,5).
grid(7,5).
grid(0,6).
grid(1,6).
grid(2,6).
grid(3,6).
grid(4,6).
grid(5,6).
grid(6,6).
grid(7,6).
grid(0,7).
grid(1,7).
grid(2,7).
grid(3,7).
grid(4,7).
grid(5,7).
grid(6,7).
grid(7,7).
dirt(3,1,'green').
dirt(4,5,'orange').
dirt(4,1,'green').
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4, 0,'green').
agent('9fa376b4-f773-44cd-ba11-24d7024ed033', 3, 3,'red').
empty(0,2).
empty(1,2).
empty(2,2).
empty(3,2).
empty(4,2).
empty(5,2).
empty(6,2).
empty(7,2).
empty(0,3).
empty(1,3).
empty(2,3).
empty(4,3).
agent('f99a5d1d-e884-4c47-8b20-1ea3ce6c5b39', 5, 7,'blue').

wall(0,Y,_):- \+ (grid(_,Y)).
wall(X,0,_):- \+ (grid(X,_)).
wall(X,7,_):- \+ (grid(X,_)).
wall(7,Y,_):- \+ (grid(_,Y)).

