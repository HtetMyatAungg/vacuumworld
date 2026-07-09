grid_size(8).

grid(X,Y).
dirt(X,Y,_Colour).
agent(Id,X,Y,_Colour).
empty(X,Y).

wall(X,Y,north) :- X > 0.
wall(X,Y,south)  :- X < grid_size-1.
wall(X,Y,east)   :- Y < grid_size-1.
wall(X,Y,west)   :- X > 0.

grid_size(8).

wall(_X,_Y,north).
wall(_X,_Y,south).
wall(_X,_Y,east).
wall(_X,_Y,west).