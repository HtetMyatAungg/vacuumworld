The previous Prolog failed SWI-Prolog validation.

Section A — Translation facts:
grid_size(8).

grid(loc(0,0)).
grid(loc(1,0)).
grid(loc(2,0)).
grid(loc(3,0)).
grid(loc(4,0)).
grid(loc(5,0)).
grid(loc(6,0)).
grid(loc(7,0)).

grid(loc(0,1)).
grid(loc(1,1)).
grid(loc(2,1)).
grid(loc(3,1)).
grid(loc(4,1)).
grid(loc(5,1)).
grid(loc(6,1)).
grid(loc(7,1)).

grid(loc(0,2)).
grid(loc(1,2)).
grid(loc(2,2)).
grid(loc(3,2)).
grid(loc(4,2)).
grid(loc(5,2)).
grid(loc(6,2)).
grid(loc(7,2)).

grid(loc(0,3)).
grid(loc(1,3)).
grid(loc(2,3)).
grid(loc(3,3)).
grid(loc(4,3)).
grid(loc(5,3)).
grid(loc(6,3)).
grid(loc(7,3)).

grid(loc(0,4)).
grid(loc(1,4)).
grid(loc(2,4)).
grid(loc(3,4)).
grid(loc(4,4)).
grid(loc(5,4)).
grid(loc(6,4)).
grid(loc(7,4)).

grid(loc(0,5)).
grid(loc(1,5)).
grid(loc(2,5)).
grid(loc(3,5)).
grid(loc(4,5)).
grid(loc(5,5)).
grid(loc(6,5)).
grid(loc(7,5)).

grid(loc(0,6)).
grid(loc(1,6)).
grid(loc(2,6)).
grid(loc(3,6)).
grid(loc(4,6)).
grid(loc(5,6)).
grid(loc(6,6)).
grid(loc(7,6)).

grid(loc(0,7)).
grid(loc(1,7)).
grid(loc(2,7)).
grid(loc(3,7)).
grid(loc(4,7)).
grid(loc(5,7)).
grid(loc(6,7)).
grid(loc(7,7)).

seen(dirt(loc(X,Y), Green)) :-
  member({X,Y}, [[0,6],[1,6],[2,6],[-,7][-1,7],[],[],[],[,-3,7]]).

seen(agent(Id, loc(X,Y), White)) :-
  member({X,X}, [[-4,0],[0,-5]]), Id \= '08b33ebc-ccfd-4dd9-b6e6-fbf4f1a46b92'.

empty_location(loc(-)).

Section B — Walk rules:
wall(walk(loc(X,Y)), north) :-
  X > 0, grid(loc(X,Z)), \+grid(loc((X-1),Z)).

wall(walk(loc(X,Y)), south) :-
  X < 7, grid(loc(X,Z)), \+grid(loc(((X+1)),Z)).

wall(walk(loc(X,Y)), east) :-
  Y < 7, grid(loc(Z,Y)), \+grid(loc(Z,(Y+1))).

wall(walk(loc(X,Y)), west) :-
  Y > 0, grid(loc(Z,Y)), \+grid(loc(Z,(Y-1))).

wall(walk(loc(0,Y)), north).

wall(walk(loc(X,0)), east).

wall(walk(loc(7,Y)), south).

wall(walk(loc(X,7)), west).