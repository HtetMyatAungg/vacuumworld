size(11,11).

cell(0,0,wall(north)).
cell(0,0,wall(west)).
cell(1,0,wall(north)).
cell(1,0,agent(d3af9897-9139-4ffe-8a15-2e9c6f06e71a,orange)).
cell(2,0,wall(north)).
cell(3,0,wall(north)).
cell(4,0,wall(north)).
cell(5,0,wall(north)).
cell(5,0,agent(d6428e63-73b7-40a5-9cc9-ea3b5e61a86d,green)).
cell(6,0,wall(north)).
cell(7,0,wall(north)).
cell(8,0,wall(north)).
cell(9,0,wall(north)).
cell(10,0,wall(east)).
cell(10,0,wall(north)).

cell(0,1,wall(west)).

cell(0,2,wall(west)).

cell(0,3,wall(west)).

cell(0,4,wall(west)).
cell(1,4,dirt(orange)).

cell(0,5,wall(west)).

cell(0,6,wall(west)).

cell(0,7,wall(west)).

cell(0,8,wall(west)).

cell(0,9,wall(west)).

cell(0,10,wall(south)).
cell(0,10,wall(west)).
cell(1,10,wall(south)).
cell(2,10,wall(south)).
cell(3,10,wall(south)).
cell(4,10,wall(south)).
cell(5,10,wall(south)).
cell(6,10,wall(south)).
cell(7,10,wall(south)).
cell(8,10,wall(south)).
cell(9,10,wall(south)).
cell(10,10,wall(east)).
cell(10,10,wall(south)).

cell(3,3,dirt(orange)).
cell(3,6,dirt(orange)).

cell(5,7,dirt(orange)).

cell(7,5,dirt(green)).

cell(9,2,dirt(green)).
cell(9,7,dirt(green)).

cell(10,1,wall(east)).
cell(10,2,wall(east)).
cell(10,3,wall(east)).
cell(10,4,wall(east)).
cell(10,5,wall(east)).
cell(10,6,wall(east)).
cell(10,7,wall(east)).
cell(10,8,wall(east)).
cell(10,9,wall(east)).

inside_grid(X,Y) :-
    size(W,H),
    X >= 0,
    Y >= 0,
    X < W,
    Y < H.

wall_at(X,Y,Dir) :-
    cell(X,Y,wall(Dir)).

wall_at(X,Y,north) :-
    inside_grid(X,Y),
    Y =:= 0.

wall_at(X,Y,south) :-
    inside_grid(X,Y),
    size(_,H),
    Y =:= H - 1.

wall_at(X,Y,west) :-
    inside_grid(X,Y),
    X =:= 0.

wall_at(X,Y,east) :-
    inside_grid(X,Y),
    size(W,_),
    X =:= W - 1.