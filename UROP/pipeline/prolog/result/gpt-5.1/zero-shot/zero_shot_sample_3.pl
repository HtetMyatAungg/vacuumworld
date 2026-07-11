size(11,11).

cell(0,0,empty).
wall(0,0,north).
wall(0,0,west).

cell(1,0,agent(d3af9897-9139-4ffe-8a15-2e9c6f06e71a,orange)).
wall(1,0,north).

cell(2,0,empty).
wall(2,0,north).

cell(3,0,empty).
wall(3,0,north).

cell(3,1,empty).

cell(3,2,empty).

cell(3,3,dirt(orange)).

cell(3,4,empty).

cell(3,5,empty).

cell(3,6,dirt(orange)).

cell(3,7,empty).

cell(3,8,empty).

cell(3,9,empty).

cell(3,10,empty).
wall(3,10,south).

cell(4,0,empty).
wall(4,0,north).

cell(4,1,empty).

cell(4,2,empty).

cell(4,3,empty).

cell(4,4,empty).

cell(4,5,empty).

cell(4,6,empty).

cell(4,7,empty).

cell(4,8,empty).

cell(4,9,empty).

cell(4,10,empty).
wall(4,10,south).

cell(5,0,agent(d6428e63-73b7-40a5-9cc9-ea3b5e61a86d,green)).
wall(5,0,north).

cell(5,1,empty).

cell(5,2,empty).

cell(5,3,empty).

cell(5,4,empty).

cell(5,5,empty).

cell(5,6,empty).

cell(5,7,dirt(orange)).

cell(5,8,empty).

cell(5,9,empty).

cell(5,10,empty).
wall(5,10,south).

cell(6,0,empty).
wall(6,0,north).

cell(6,1,empty).

cell(6,2,empty).

cell(6,3,empty).

cell(6,4,empty).

cell(6,5,empty).

cell(6,6,empty).

cell(6,7,empty).

cell(6,8,empty).

cell(6,9,empty).

cell(6,10,empty).
wall(6,10,south).

cell(7,0,empty).
wall(7,0,north).

cell(7,1,empty).

cell(7,2,empty).

cell(7,3,empty).

cell(7,4,empty).

cell(7,5,dirt(green)).

cell(7,6,empty).

cell(7,7,empty).

cell(7,8,empty).

cell(7,9,empty).

cell(7,10,empty).
wall(7,10,south).

cell(8,0,empty).
wall(8,0,north).

cell(8,1,empty).

cell(8,2,empty).

cell(8,3,empty).

cell(8,4,empty).

cell(8,5,empty).

cell(8,6,empty).

cell(8,7,empty).

cell(8,8,empty).

cell(8,9,empty).

cell(8,10,empty).
wall(8,10,south).

cell(9,0,empty).
wall(9,0,north).

cell(9,1,empty).

cell(9,2,dirt(green)).

cell(9,3,empty).

cell(9,4,empty).

cell(9,5,empty).

cell(9,6,empty).

cell(9,7,dirt(green)).

cell(9,8,empty).

cell(9,9,empty).

cell(9,10,empty).
wall(9,10,south).

cell(10,0,empty).
wall(10,0,east).
wall(10,0,north).

cell(10,1,empty).
wall(10,1,east).

cell(10,2,empty).
wall(10,2,east).

cell(10,3,empty).
wall(10,3,east).

cell(10,4,empty).
wall(10,4,east).

cell(10,5,empty).
wall(10,5,east).

cell(10,6,empty).
wall(10,6,east).

cell(10,7,empty).
wall(10,7,east).

cell(10,8,empty).
wall(10,8,east).

cell(10,9,empty).
wall(10,9,east).

cell(10,10,empty).
wall(10,10,east).
wall(10,10,south).

cell(0,1,empty).
wall(0,1,west).

cell(1,1,empty).

cell(2,1,empty).

cell(0,2,empty).
wall(0,2,west).

cell(1,2,empty).

cell(2,2,empty).

cell(0,3,empty).
wall(0,3,west).

cell(1,3,empty).

cell(2,3,empty).

cell(0,4,empty).
wall(0,4,west).

cell(1,4,dirt(orange)).

cell(2,4,empty).

cell(0,5,empty).
wall(0,5,west).

cell(1,5,empty).

cell(2,5,empty).

cell(0,6,empty).
wall(0,6,west).

cell(1,6,empty).

cell(2,6,empty).

cell(0,7,empty).
wall(0,7,west).

cell(1,7,empty).

cell(2,7,empty).

cell(0,8,empty).
wall(0,8,west).

cell(1,8,empty).

cell(2,8,empty).

cell(0,9,empty).
wall(0,9,west).

cell(1,9,empty).

cell(2,9,empty).

cell(0,10,empty).
wall(0,10,south).
wall(0,10,west).

cell(1,10,empty).
wall(1,10,south).

cell(2,10,empty).
wall(2,10,south).

adjacent((X,Y),(X1,Y)) :-
    size(W,_),
    X1 is X+1,
    X1 < W,
    \+ wall(X,Y,east),
    \+ wall(X1,Y,west).
adjacent((X,Y),(X1,Y)) :-
    X1 is X-1,
    X1 >= 0,
    \+ wall(X,Y,west),
    \+ wall(X1,Y,east).
adjacent((X,Y),(X,Y1)) :-
    size(_,H),
    Y1 is Y+1,
    Y1 < H,
    \+ wall(X,Y,south),
    \+ wall(X,Y1,north).
adjacent((X,Y),(X,Y1)) :-
    Y1 is Y-1,
    Y1 >= 0,
    \+ wall(X,Y,north),
    \+ wall(X,Y1,south).