:- dynamic cell/2.
:- dynamic wall/3.
:- dynamic dirt/3.
:- dynamic agent/4.

grid_size(5, 5).

cell(0, 0).
cell(1, 0).
cell(2, 0).
cell(3, 0).
cell(4, 0).
cell(0, 1).
cell(1, 1).
cell(2, 1).
cell(3, 1).
cell(4, 1).
cell(0, 2).
cell(1, 2).
cell(2, 2).
cell(3, 2).
cell(4, 2).
cell(0, 3).
cell(1, 3).
cell(2, 3).
cell(3, 3).
cell(4, 3).
cell(0, 4).
cell(1, 4).
cell(2, 4).
cell(3, 4).
cell(4, 4).

wall(0, 0, north).
wall(0, 0, west).
wall(1, 0, north).
wall(2, 0, north).
wall(3, 0, north).
wall(4, 0, north).
wall(4, 0, east).
wall(0, 1, west).
wall(4, 1, east).
wall(0, 2, west).
wall(4, 2, east).
wall(0, 3, west).
wall(4, 3, east).
wall(0, 4, south).
wall(0, 4, west).
wall(1, 4, south).
wall(2, 4, south).
wall(3, 4, south).
wall(4, 4, south).
wall(4, 4, east).

dirt(2, 3, orange).
dirt(1, 2, green).
dirt(3, 1, orange).

agent(2, 0, 'c942b0ce-6c70-4311-a5b7-6b2640fe417c', green).
agent(4, 2, 'ec1d58f6-6db4-473d-af3e-518ca49c39f9', orange).

empty(X, Y) :-
    cell(X, Y),
    \+ dirt(X, Y, _),
    \+ agent(X, Y, _, _).

adjacent(X, Y, east, X1, Y) :-
    X1 is X + 1,
    cell(X, Y),
    cell(X1, Y),
    \+ wall(X, Y, east).
adjacent(X, Y, west, X1, Y) :-
    X1 is X - 1,
    cell(X, Y),
    cell(X1, Y),
    \+ wall(X, Y, west).
adjacent(X, Y, south, X, Y1) :-
    Y1 is Y + 1,
    cell(X, Y),
    cell(X, Y1),
    \+ wall(X, Y, south).
adjacent(X, Y, north, X, Y1) :-
    Y1 is Y - 1,
    cell(X, Y),
    cell(X, Y1),
    \+ wall(X, Y, north).