cell(0,6, walls: [west]).
cell(1,6, walls: []).
cell(2,6, walls: []).
cell(0,7, walls: [south, west]).
cell(1,7, walls: [south]).
cell(2,7, walls: [south]).
cell(0,5, walls: [west]).
cell(1,5, walls: []).
cell(2,5, walls: []).
cell(0,4, walls: [west]).
cell(1,4, walls: []).
cell(2,4, walls: []).
cell(0,3, walls: [west]).
cell(1,3, walls: []).
cell(2,3, walls: []).
cell(0,2, walls: [west]).
cell(1,2, walls: []).
cell(2,2, walls: []).
cell(0,1, walls: [west]).
cell(1,1, walls: []).
cell(2,1, walls: []).
cell(0,0, walls: [north, west]).
cell(1,0, walls: [north]).
cell(2,0, walls: [north]).
cell(3,0, walls: [north]).
cell(3,1, walls: []).
cell(3,2, walls: []).
cell(3,3, walls: []).
cell(3,4, walls: []).
cell(3,5, walls: []).
cell(3,6, walls: []).
cell(3,7, walls: [south]).
cell(4,5, walls: []).
cell(4,6, walls: []).
cell(4,7, walls: [south]).
cell(4,4, walls: []).
cell(4,3, walls: []).
cell(4,2, walls: []).
cell(4,1, walls: []).
cell(4,0, walls: [north]).
cell(5,0, walls: [north]).
cell(5,1, walls: []).
cell(5,2, walls: []).
cell(5,3, walls: []).
cell(5,4, walls: []).
cell(5,5, walls: []).
cell(5,6, walls: []).
cell(5,7, walls: [south]).
cell(6,5, walls: []).
cell(6,6, walls: []).
cell(6,7, walls: [south]).
cell(6,4, walls: []).
cell(6,3, walls: []).
cell(6,2, walls: []).
cell(6,1, walls: []).
cell(6,0, walls: [north]).
cell(7,0, walls: [east, north]).
cell(7,1, walls: [east]).
cell(7,2, walls: [east]).
cell(7,3, walls: [east]).
cell(7,4, walls: [east]).
cell(7,5, walls: [east]).
cell(7,6, walls: [east]).
cell(7,7, walls: [east, south]).
agent(at(0,3), id('9af04778-08d6-4e40-8c6f-ba123d292a22'), colour(orange)).
agent(at(4,0), id('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'), colour(green)).
dirt(at(2,1), colour(orange)).
dirt(at(3,4), colour(orange)).
dirt(at(4,6), colour(orange)).
dirt(at(5,1), colour(green)).
dirt(at(6,4), colour(orange)).
wall_north(X,Y) :- cell(X,Y,walls:W), member(north,W).
wall_south(X,Y) :- cell(X,Y,walls:W), member(south,W).
wall_west(X,Y) :- cell(X,Y,walls:W), member(west,W).
wall_east(X,Y) :- cell(X,Y,walls:W), member(east,W).