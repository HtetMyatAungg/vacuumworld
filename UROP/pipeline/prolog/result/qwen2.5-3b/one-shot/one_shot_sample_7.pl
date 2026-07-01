Section A — Translation facts:
grid_size(10).
grid(loc(0,0)).
grid(loc(1,0)).
grid(loc(2,0)).
grid(loc(3,0)).
grid(loc(4,0)).
grid(loc(5,0)).
grid(loc(6,0)).
grid(loc(7,0)).
grid(loc(8,0)).
grid(loc(9,0)).

grid(loc(0,1)).
grid(loc(1,1)).
grid(loc(2,1)).
grid(loc(3,1)).
grid(loc(4,1)).
grid(loc(5,1)).
grid(loc(6,1)).
grid(loc(7,1)).
grid(loc(8,1)).
grid(loc(9,1)).

grid(loc(0,2)).
grid(loc(1,2)).
grid(loc(2,2)).
grid(loc(3,2)).
grid(loc(4,2)).
grid(loc(5,2)).
grid(loc(6,2)).
grid(loc(7,2)).
grid(loc(8,2)).
grid(loc(9,2)).

grid(loc(0,3)).
grid(loc(1,3)).
grid(loc(2,3)).
grid(loc(3,3)).
grid(loc(4,3)).
grid(loc(5,3)).
grid(loc(6,3)).
grid(loc(7,3)).
grid(loc(8,3)).
grid(loc(9,3)).

grid(loc(0,4)).  
grid(loc(1,4)).
grid(loc(2,4)).
grid(loc(3,4)).
grid(loc(4,4)).
grid(loc(5,4)).
grid(loc(6,4)).
grid(loc(7,4)).
grid(loc(8,4)).
grid(loc(9,4)).

grid(loc(0,5)).
grid(loc(1,5)).
grid(loc(2,5)).
grid(loc(3,5)).
grid(loc(4,5)).
grid(loc(5,5)).
grid(loc(6,5)).
grid(loc(7,5)).
grid(loc(8,5)).
grid(loc(9,5)).

grid(loc(0,6)).  
grid(loc(1,6)).
grid(loc(2,6)).
grid(loc(3,6)).
grid(loc(4,6)).
grid(loc(5,6)).
grid(loc(6,6)).
grid(loc(7,6)).
grid(loc(8,6)).
grid(loc(9,6)).

grid(loc(0,7)).  
grid(loc(1,7)).
grid(loc(2,7)).
grid(loc(3,7)).
grid(loc(4,7)).
grid(loc(5,7)).
grid(loc(6,7)).
grid(loc(7,7)).
grid(loc(8,7)).
grid(loc(9,7)).

grid(loc(0,8)).  
grid(loc(1,8)).
grid(loc(2,8)).
grid(loc(3,8)).
grid(loc(4,8)).
grid(loc(5,8)).
grid(loc(6,8)).
grid(loc(7,8)).
grid(loc(8,8)).
grid(loc(9,8)).

grid(loc(0,9)).  
grid(loc(1,9)).
grid(loc(2,9)).
grid(loc(3,9)).
grid(loc(4,9)).
grid(loc(5,9)).
grid(loc(6,9)).
grid(loc(7,9)).
grid(loc(8,9)).
grid(loc(9,9)).

seen(dirt(loc(X,Y))) :- grid(loc(X,Y)), \+ seen(agent(_, loc(X,Y))), \+ seen(dirt(loc(X,Y))).
seen(agent(Id, loc(X,Y), Colour)) :- grid(loc(X,Y)), seen(dirt(loc(X,Y))), atom_concat(Id, "-", X, AgentId), Id = AgentId.
empty_location(loc(X,Y)) :- grid(loc(X,Y)), \+ seen(dirt(loc(X,Y))), \+ seen(agent(_, loc(X,Y))).