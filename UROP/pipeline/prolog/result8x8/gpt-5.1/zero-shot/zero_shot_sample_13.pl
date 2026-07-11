:- dynamic cell/3.
:- dynamic wall/2.
:- dynamic dirt/2.
:- dynamic agent/3.

cell(0,6,empty).
cell(1,6,empty).
cell(2,6,empty).
cell(0,7,empty).
cell(1,7,empty).
cell(2,7,empty).
cell(0,5,empty).
cell(1,5,empty).
cell(2,5,empty).
cell(0,4,empty).
cell(1,4,empty).
cell(2,4,empty).
cell(0,3,agent).
cell(1,3,empty).
cell(2,3,empty).
cell(0,2,empty).
cell(1,2,empty).
cell(2,2,empty).
cell(0,1,empty).
cell(1,1,empty).
cell(2,1,dirt).
cell(0,0,empty).
cell(1,0,empty).
cell(2,0,empty).
cell(3,0,empty).
cell(3,1,empty).
cell(3,2,empty).
cell(3,3,empty).
cell(3,4,dirt).
cell(3,5,empty).
cell(3,6,empty).
cell(3,7,empty).
cell(4,5,empty).
cell(4,6,dirt).
cell(4,7,empty).
cell(4,4,empty).
cell(4,3,empty).
cell(4,2,empty).
cell(4,1,empty).
cell(4,0,agent).
cell(5,0,empty).
cell(5,1,dirt).
cell(5,2,empty).
cell(5,3,empty).
cell(5,4,empty).
cell(5,5,empty).
cell(5,6,empty).
cell(5,7,empty).
cell(6,5,empty).
cell(6,6,empty).
cell(6,7,empty).
cell(6,4,dirt).
cell(6,3,empty).
cell(6,2,empty).
cell(6,1,empty).
cell(6,0,empty).
cell(7,0,empty).
cell(7,1,empty).
cell(7,2,empty).
cell(7,3,empty).
cell(7,4,empty).
cell(7,5,empty).
cell(7,6,empty).
cell(7,7,empty).

wall(0,6,west).
wall(0,7,south).
wall(0,7,west).
wall(1,7,south).
wall(2,7,south).
wall(0,5,west).
wall(0,4,west).
wall(0,3,west).
wall(0,2,west).
wall(0,1,west).
wall(0,0,north).
wall(0,0,west).
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
wall(7,0,east).
wall(7,0,north).
wall(7,1,east).
wall(7,2,east).
wall(7,3,east).
wall(7,4,east).
wall(7,5,east).
wall(7,6,east).
wall(7,7,east).
wall(7,7,south).

dirt(2,1,orange).
dirt(3,4,orange).
dirt(4,6,orange).
dirt(5,1,green).
dirt(6,4,orange).

agent(0,3,'9af04778-08d6-4e40-8c6f-ba123d292a22'-orange).
agent(4,0,'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'-green).

boundary_north(X,Y) :- wall(X,Y,north).
boundary_south(X,Y) :- wall(X,Y,south).
boundary_east(X,Y)  :- wall(X,Y,east).
boundary_west(X,Y)  :- wall(X,Y,west).