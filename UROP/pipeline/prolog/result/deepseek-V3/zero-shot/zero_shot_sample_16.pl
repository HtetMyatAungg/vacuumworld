cell(0,3,walls([west]),empty).
cell(1,3,walls([]),empty).
cell(2,3,walls([]),dirt(orange)).
cell(0,4,walls([south,west]),empty).
cell(1,4,walls([south]),empty).
cell(2,4,walls([south]),empty).
cell(0,2,walls([west]),empty).
cell(1,2,walls([]),dirt(green)).
cell(2,2,walls([]),empty).
cell(0,1,walls([west]),empty).
cell(1,1,walls([]),empty).
cell(2,1,walls([]),empty).
cell(0,0,walls([north,west]),empty).
cell(1,0,walls([north]),empty).
cell(2,0,walls([north]),agent(c942b0ce-6c70-4311-a5b7-6b2640fe417c,green)).
cell(3,0,walls([north]),empty).
cell(3,1,walls([]),dirt(orange)).
cell(3,2,walls([]),empty).
cell(3,3,walls([]),empty).
cell(3,4,walls([south]),empty).
cell(4,2,walls([east]),agent(ec1d58f6-6db4-473d-af3e-518ca49c39f9,orange)).
cell(4,3,walls([east]),empty).
cell(4,4,walls([east,south]),empty).
cell(4,1,walls([east]),empty).
cell(4,0,walls([east,north]),empty).
boundary_north((X,Y)) :- cell(X,Y,walls(W,_)), member(north,W).
boundary_south((X,Y)) :- cell(X,Y,walls(W,_)), member(south,W).
boundary_west((X,Y)) :- cell(X,Y,walls(W,_)), member(west,W).
boundary_east((X,Y)) :- cell(X,Y,walls(W,_)), member(east,W).