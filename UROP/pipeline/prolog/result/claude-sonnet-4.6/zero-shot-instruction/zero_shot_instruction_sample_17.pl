:- dynamic dirt/3.
:- dynamic agent/3.
:- dynamic wall/3.

grid_size(11, 11).

wall(0, 9, west).
wall(0, 10, south).
wall(0, 10, west).
wall(0, 8, west).
wall(0, 7, west).
wall(0, 6, west).
wall(0, 5, west).
wall(0, 4, west).
wall(0, 3, west).
wall(0, 2, west).
wall(0, 1, west).
wall(0, 0, north).
wall(0, 0, west).
wall(1, 10, south).
wall(2, 10, south).
wall(1, 0, north).
wall(2, 0, north).
wall(3, 10, south).
wall(3, 0, north).
wall(4, 10, south).
wall(4, 0, north).
wall(5, 10, south).
wall(5, 0, north).
wall(6, 10, south).
wall(6, 0, north).
wall(7, 10, south).
wall(7, 0, north).
wall(8, 10, south).
wall(8, 0, north).
wall(9, 10, south).
wall(9, 0, north).
wall(10, 10, south).
wall(10, 10, east).
wall(10, 9, east).
wall(10, 8, east).
wall(10, 7, east).
wall(10, 6, east).
wall(10, 5, east).
wall(10, 4, east).
wall(10, 3, east).
wall(10, 2, east).
wall(10, 1, east).
wall(10, 0, east).
wall(10, 0, north).

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent(1, 0, 'd3af9897-9139-4ffe-8a15-2e9c6f06e71a').
agent_colour('d3af9897-9139-4ffe-8a15-2e9c6f06e71a', orange).
agent(5, 0, 'd6428e63-73b7-40a5-9cc9-ea3b5e61a86d').
agent_colour('d6428e63-73b7-40a5-9cc9-ea3b5e61a86d', green).

boundary_wall(X, Y, north) :-
    grid_size(_, _),
    Y =:= 0.
boundary_wall(X, Y, south) :-
    grid_size(_, Rows),
    MaxY is Rows - 1,
    Y =:= MaxY.
boundary_wall(X, Y, west) :-
    grid_size(_, _),
    X =:= 0.
boundary_wall(X, Y, east) :-
    grid_size(Cols, _),
    MaxX is Cols - 1,
    X =:= MaxX.

has_wall(X, Y, Dir) :-
    wall(X, Y, Dir).
has_wall(X, Y, Dir) :-
    boundary_wall(X, Y, Dir).

empty(X, Y) :-
    grid_size(Cols, Rows),
    MaxX is Cols - 1,
    MaxY is Rows - 1,
    between(0, MaxX, X),
    between(0, MaxY, Y),
    \+ dirt(X, Y, _),
    \+ agent(X, Y, _).