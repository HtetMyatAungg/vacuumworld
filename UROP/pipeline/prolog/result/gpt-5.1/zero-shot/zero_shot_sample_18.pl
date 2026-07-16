grid_size(11,11).

cell(0,0,empty) :- wall(north,0,0), wall(west,0,0).
cell(0,1,empty) :- wall(west,0,1).
cell(0,2,empty) :- wall(west,0,2).
cell(0,3,empty) :- wall(west,0,3).
cell(0,4,empty) :- wall(west,0,4).
cell(0,5,empty) :- wall(west,0,5).
cell(0,6,empty) :- wall(west,0,6).
cell(0,7,empty) :- wall(west,0,7).
cell(0,8,empty) :- wall(west,0,8).
cell(0,9,empty) :- wall(west,0,9).
cell(0,10,empty) :- wall(south,0,10), wall(west,0,10).

cell(1,0,agent(d3af9897-9139-4ffe-8a15-2e9c6f06e71a,orange)) :- wall(north,1,0).
cell(1,1,empty).
cell(1,2,empty).
cell(1,3,empty).
cell(1,4,dirt(orange)).
cell(1,5,empty).
cell(1,6,empty).
cell(1,7,empty).
cell(1,8,empty).
cell(1,9,empty).
cell(1,10,empty) :- wall(south,1,10).

cell(2,0,empty) :- wall(north,2,0).
cell(2,1,empty).
cell(2,2,empty).
cell(2,3,empty).
cell(2,4,empty).
cell(2,5,empty).
cell(2,6,empty).
cell(2,7,empty).
cell(2,8,empty).
cell(2,9,empty).
cell(2,10,empty) :- wall(south,2,10).

cell(3,0,empty) :- wall(north,3,0).
cell(3,1,empty).
cell(3,2,empty).
cell(3,3,dirt(orange)).
cell(3,4,empty).
cell(3,5,empty).
cell(3,6,dirt(orange)).
cell(3,7,empty).
cell(3,8,empty).
cell(3,9,empty).
cell(3,10,empty) :- wall(south,3,10).

cell(4,0,empty) :- wall(north,4,0).
cell(4,1,empty).
cell(4,2,empty).
cell(4,3,empty).
cell(4,4,empty).
cell(4,5,empty).
cell(4,6,empty).
cell(4,7,empty).
cell(4,8,empty).
cell(4,9,empty).
cell(4,10,empty) :- wall(south,4,10).

cell(5,0,agent(d6428e63-73b7-40a5-9cc9-ea3b5e61a86d,green)) :- wall(north,5,0).
cell(5,1,empty).
cell(5,2,empty).
cell(5,3,empty).
cell(5,4,empty).
cell(5,5,empty).
cell(5,6,empty).
cell(5,7,dirt(orange)).
cell(5,8,empty).
cell(5,9,empty).
cell(5,10,empty) :- wall(south,5,10).

cell(6,0,empty) :- wall(north,6,0).
cell(6,1,empty).
cell(6,2,empty).
cell(6,3,empty).
cell(6,4,empty).
cell(6,5,empty).
cell(6,6,empty).
cell(6,7,empty).
cell(6,8,empty).
cell(6,9,empty).
cell(6,10,empty) :- wall(south,6,10).

cell(7,0,empty) :- wall(north,7,0).
cell(7,1,empty).
cell(7,2,empty).
cell(7,3,empty).
cell(7,4,empty).
cell(7,5,dirt(green)).
cell(7,6,empty).
cell(7,7,empty).
cell(7,8,empty).
cell(7,9,empty).
cell(7,10,empty) :- wall(south,7,10).

cell(8,0,empty) :- wall(north,8,0).
cell(8,1,empty).
cell(8,2,empty).
cell(8,3,empty).
cell(8,4,empty).
cell(8,5,empty).
cell(8,6,empty).
cell(8,7,empty).
cell(8,8,empty).
cell(8,9,empty).
cell(8,10,empty) :- wall(south,8,10).

cell(9,0,empty) :- wall(north,9,0).
cell(9,1,empty).
cell(9,2,dirt(green)).
cell(9,3,empty).
cell(9,4,empty).
cell(9,5,empty).
cell(9,6,empty).
cell(9,7,dirt(green)).
cell(9,8,empty).
cell(9,9,empty).
cell(9,10,empty) :- wall(south,9,10).

cell(10,0,empty) :- wall(east,10,0), wall(north,10,0).
cell(10,1,empty) :- wall(east,10,1).
cell(10,2,empty) :- wall(east,10,2).
cell(10,3,empty) :- wall(east,10,3).
cell(10,4,empty) :- wall(east,10,4).
cell(10,5,empty) :- wall(east,10,5).
cell(10,6,empty) :- wall(east,10,6).
cell(10,7,empty) :- wall(east,10,7).
cell(10,8,empty) :- wall(east,10,8).
cell(10,9,empty) :- wall(east,10,9).
cell(10,10,empty) :- wall(east,10,10), wall(south,10,10).

wall(north,X,0) :- X >= 0, X =< 10.
wall(south,X,10) :- X >= 0, X =< 10.
wall(west,0,Y) :- Y >= 0, Y =< 10.
wall(east,10,Y) :- Y >= 0, Y =< 10.