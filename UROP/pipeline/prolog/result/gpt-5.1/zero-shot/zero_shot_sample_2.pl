grid_size(5,5).

location(0,0,empty) :- wall(0,0,north), wall(0,0,west).
location(1,0,empty) :- wall(1,0,north).
location(2,0,agent('c942b0ce-6c70-4311-a5b7-6b2640fe417c',green)) :- wall(2,0,north).
location(3,0,empty) :- wall(3,0,north).
location(4,0,empty) :- wall(4,0,north), wall(4,0,east).

location(0,1,empty) :- wall(0,1,west).
location(1,1,empty).
location(2,1,empty).
location(3,1,dirt(orange)).
location(4,1,empty) :- wall(4,1,east).

location(0,2,empty) :- wall(0,2,west).
location(1,2,dirt(green)).
location(2,2,empty).
location(3,2,empty).
location(4,2,agent('ec1d58f6-6db4-473d-af3e-518ca49c39f9',orange)) :- wall(4,2,east).

location(0,3,empty) :- wall(0,3,west).
location(1,3,empty).
location(2,3,dirt(orange)).
location(3,3,empty).
location(4,3,empty) :- wall(4,3,east).

location(0,4,empty) :- wall(0,4,west), wall(0,4,south).
location(1,4,empty) :- wall(1,4,south).
location(2,4,empty) :- wall(2,4,south).
location(3,4,empty) :- wall(3,4,south).
location(4,4,empty) :- wall(4,4,south), wall(4,4,east).

wall(0,0,north).
wall(1,0,north).
wall(2,0,north).
wall(3,0,north).
wall(4,0,north).

wall(0,4,south).
wall(1,4,south).
wall(2,4,south).
wall(3,4,south).
wall(4,4,south).

wall(0,0,west).
wall(0,1,west).
wall(0,2,west).
wall(0,3,west).
wall(0,4,west).

wall(4,0,east).
wall(4,1,east).
wall(4,2,east).
wall(4,3,east).
wall(4,4,east).