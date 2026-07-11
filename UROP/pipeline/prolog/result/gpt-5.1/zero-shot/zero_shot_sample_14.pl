cell(0,0,empty,[north,west]).
cell(1,0,empty,[north]).
cell(2,0,agent('c942b0ce-6c70-4311-a5b7-6b2640fe417c',green),[north]).
cell(3,0,empty,[north]).
cell(4,0,empty,[east,north]).
cell(0,1,empty,[west]).
cell(1,1,empty,[]).
cell(2,1,empty,[]).
cell(3,1,dirt(orange),[]).
cell(4,1,empty,[east]).
cell(0,2,empty,[west]).
cell(1,2,dirt(green),[]).
cell(2,2,empty,[]).
cell(3,2,empty,[]).
cell(4,2,agent('ec1d58f6-6db4-473d-af3e-518ca49c39f9',orange),[east]).
cell(0,3,empty,[west]).
cell(1,3,empty,[]).
cell(2,3,dirt(orange),[]).
cell(3,3,empty,[]).
cell(4,3,empty,[east]).
cell(0,4,empty,[south,west]).
cell(1,4,empty,[south]).
cell(2,4,empty,[south]).
cell(3,4,empty,[south]).
cell(4,4,empty,[east,south]).

grid_size(5,5).

inside_grid(X,Y) :-
    grid_size(W,H),
    X >= 0, X < W,
    Y >= 0, Y < H.

wall(X,Y,north) :-
    cell(X,Y,_,Walls),
    member(north,Walls).
wall(X,Y,south) :-
    cell(X,Y,_,Walls),
    member(south,Walls).
wall(X,Y,west) :-
    cell(X,Y,_,Walls),
    member(west,Walls).
wall(X,Y,east) :-
    cell(X,Y,_,Walls),
    member(east,Walls).

adjacent((X,Y),(X1,Y),east) :-
    X1 is X+1,
    inside_grid(X1,Y),
    \+ wall(X,Y,east),
    \+ wall(X1,Y,west).
adjacent((X,Y),(X1,Y),west) :-
    X1 is X-1,
    inside_grid(X1,Y),
    \+ wall(X,Y,west),
    \+ wall(X1,Y,east).
adjacent((X,Y),(X,Y1),south) :-
    Y1 is Y+1,
    inside_grid(X,Y1),
    \+ wall(X,Y,south),
    \+ wall(X,Y1,north).
adjacent((X,Y),(X,Y1),north) :-
    Y1 is Y-1,
    inside_grid(X,Y1),
    \+ wall(X,Y,north),
    \+ wall(X,Y1,south).