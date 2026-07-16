location(0,9,empty).
wall(0,9,west).

location(1,9,empty).

location(2,9,empty).

location(0,10,empty).
wall(0,10,south).
wall(0,10,west).

location(1,10,empty).
wall(1,10,south).

location(2,10,empty).
wall(2,10,south).

location(0,8,empty).
wall(0,8,west).

location(1,8,empty).

location(2,8,empty).

location(0,7,empty).
wall(0,7,west).

location(1,7,empty).

location(2,7,empty).

location(0,6,empty).
wall(0,6,west).

location(1,6,empty).

location(2,6,empty).

location(0,5,empty).
wall(0,5,west).

location(1,5,empty).

location(2,5,empty).

location(0,4,empty).
wall(0,4,west).

location(1,4,dirt(orange)).

location(2,4,empty).

location(0,3,empty).
wall(0,3,west).

location(1,3,empty).

location(2,3,empty).

location(0,2,empty).
wall(0,2,west).

location(1,2,empty).

location(2,2,empty).

location(0,1,empty).
wall(0,1,west).

location(1,1,empty).

location(2,1,empty).

location(0,0,empty).
wall(0,0,north).
wall(0,0,west).

location(1,0,agent(d3af9897-9139-4ffe-8a15-2e9c6f06e71a,orange)).
wall(1,0,north).

location(2,0,empty).
wall(2,0,north).

location(3,0,empty).
wall(3,0,north).

location(3,1,empty).

location(3,2,empty).

location(3,3,dirt(orange)).

location(3,4,empty).

location(3,5,empty).

location(3,6,dirt(orange)).

location(3,7,empty).

location(3,8,empty).

location(3,9,empty).

location(3,10,empty).
wall(3,10,south).

location(4,8,empty).

location(4,9,empty).

location(4,10,empty).
wall(4,10,south).

location(4,7,empty).

location(4,6,empty).

location(4,5,empty).

location(4,4,empty).

location(4,3,empty).

location(4,2,empty).

location(4,1,empty).

location(4,0,empty).
wall(4,0,north).

location(5,0,agent(d6428e63-73b7-40a5-9cc9-ea3b5e61a86d,green)).
wall(5,0,north).

location(5,1,empty).

location(5,2,empty).

location(5,3,empty).

location(5,4,empty).

location(5,5,empty).

location(5,6,empty).

location(5,7,dirt(orange)).

location(5,8,empty).

location(5,9,empty).

location(5,10,empty).
wall(5,10,south).

location(6,8,empty).

location(6,9,empty).

location(6,10,empty).
wall(6,10,south).

location(6,7,empty).

location(6,6,empty).

location(6,5,empty).

location(6,4,empty).

location(6,3,empty).

location(6,2,empty).

location(6,1,empty).

location(6,0,empty).
wall(6,0,north).

location(7,0,empty).
wall(7,0,north).

location(7,1,empty).

location(7,2,empty).

location(7,3,empty).

location(7,4,empty).

location(7,5,dirt(green)).

location(7,6,empty).

location(7,7,empty).

location(7,8,empty).

location(7,9,empty).

location(7,10,empty).
wall(7,10,south).

location(8,8,empty).

location(8,9,empty).

location(8,10,empty).
wall(8,10,south).

location(8,7,empty).

location(8,6,empty).

location(8,5,empty).

location(8,4,empty).

location(8,3,empty).

location(8,2,empty).

location(8,1,empty).

location(8,0,empty).
wall(8,0,north).

location(9,0,empty).
wall(9,0,north).

location(9,1,empty).

location(9,2,dirt(green)).

location(9,3,empty).

location(9,4,empty).

location(9,5,empty).

location(9,6,empty).

location(9,7,dirt(green)).

location(9,8,empty).

location(9,9,empty).

location(9,10,empty).
wall(9,10,south).

location(10,8,empty).
wall(10,8,east).

location(10,9,empty).
wall(10,9,east).

location(10,10,empty).
wall(10,10,east).
wall(10,10,south).

location(10,7,empty).
wall(10,7,east).

location(10,6,empty).
wall(10,6,east).

location(10,5,empty).
wall(10,5,east).

location(10,4,empty).
wall(10,4,east).

location(10,3,empty).
wall(10,3,east).

location(10,2,empty).
wall(10,2,east).

location(10,1,empty).
wall(10,1,east).

location(10,0,empty).
wall(10,0,east).
wall(10,0,north).

boundary_north(Y) :- Y =:= 0.
boundary_south(Y) :- Y =:= 10.
boundary_west(X) :- X =:= 0.
boundary_east(X) :- X =:= 10.