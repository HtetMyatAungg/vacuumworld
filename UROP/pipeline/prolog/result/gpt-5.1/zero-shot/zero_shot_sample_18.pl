cell(0,3,[]).
wall(0,3,west).

cell(1,3,[]).

cell(2,3,[dirt(orange)]).

cell(0,4,[]).
wall(0,4,south).
wall(0,4,west).

cell(1,4,[]).
wall(1,4,south).

cell(2,4,[]).
wall(2,4,south).

cell(0,2,[]).
wall(0,2,west).

cell(1,2,[dirt(green)]).

cell(2,2,[]).

cell(0,1,[]).
wall(0,1,west).

cell(1,1,[]).

cell(2,1,[]).

cell(0,0,[]).
wall(0,0,north).
wall(0,0,west).

cell(1,0,[]).
wall(1,0,north).

cell(2,0,[agent(c942b0ce_6c70_4311_a5b7_6b2640fe417c,green)]).
wall(2,0,north).

cell(3,0,[]).
wall(3,0,north).

cell(3,1,[dirt(orange)]).

cell(3,2,[]).

cell(3,3,[]).

cell(3,4,[]).
wall(3,4,south).

cell(4,2,[agent(ec1d58f6_6db4_473d_af3e_518ca49c39f9,orange)]).
wall(4,2,east).

cell(4,3,[]).
wall(4,3,east).

cell(4,4,[]).
wall(4,4,east).
wall(4,4,south).

cell(4,1,[]).
wall(4,1,east).

cell(4,0,[]).
wall(4,0,east).
wall(4,0,north).

grid_size(5,5).

inside_grid(X,Y) :-
    grid_size(W,H),
    X >= 0, X < W,
    Y >= 0, Y < H.

boundary_wall(X,Y,west) :-
    X =:= 0,
    inside_grid(X,Y).

boundary_wall(X,Y,east) :-
    grid_size(W,_),
    X =:= W-1,
    inside_grid(X,Y).

boundary_wall(X,Y,north) :-
    Y =:= 0,
    inside_grid(X,Y).

boundary_wall(X,Y,south) :-
    grid_size(_,H),
    Y =:= H-1,
    inside_grid(X,Y).

has_wall(X,Y,Dir) :-
    wall(X,Y,Dir).
has_wall(X,Y,Dir) :-
    boundary_wall(X,Y,Dir).