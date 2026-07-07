grid_size(8).
grid(X,Y) :- between(0,7,X), between(0,7,Y).
dirt(5,1,"green").
dirt(6,4,"orange").
agent(id92e7950-8e80-4a5b-bc2d-2d02d3ac963f, 4, 1,"green").
agent(927a97c0-ae55-4ab4-81ad-cfcc68a623c1, 4, 5,"orange").
agent(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c, 4, 0,"green").
agent(b8e7169f-d93a-4bfc-accd-111460a7c69e, 4, 4,"orange").
empty(X,Y) :- not(dirt(X,Y,_)), not(agent(X, Y,_ )).

wall(0,Y,north).
wall(8,Y,south).
wall(X,0,north).
wall(X,8,south). 


