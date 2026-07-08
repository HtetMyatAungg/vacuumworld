grid_size(8).

grid(X,Y):- X between 0,7,Y between 0,7.

dirt(X,Y,C) :- grid(X,Y), Y1 is Y+1,dirt(X,Y1,C); Y2 is Y-1,dirt(X,Y2,C); X1 is X-1,dirt(X1,Y,C); X2 is X+1,dirt(X2,Y,C).

agent(Id,X,Y,C) :- grid(X,Y), agent(Id,X,Y,C).

empty(X,Y) :- grid(X,Y), \+dirt(_,Y, _), \+agent(_,X,_).

wall(X,Y,north):- grid(X,Y), wall(X,Y,north).
wall(X,Y,east):- grid(X,Y), wall(X-1,Y,east).
wall(X,Y,south):- grid(X,Y), wall(X,Y,south).
wall(X,Y,west):- grid(X,Y), wall(X,Y,west).