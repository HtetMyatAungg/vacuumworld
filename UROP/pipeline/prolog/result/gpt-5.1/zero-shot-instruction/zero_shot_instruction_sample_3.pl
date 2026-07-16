:- dynamic size/1.
:- dynamic dirt/3.
:- dynamic agent/4.

size(11).

dirt(1,4,orange).
dirt(3,3,orange).
dirt(3,6,orange).
dirt(5,7,orange).
dirt(7,5,green).
dirt(9,2,green).
dirt(9,7,green).

agent(1,0,d3af9897-9139-4ffe-8a15-2e9c6f06e71a,orange).
agent(5,0,d6428e63-73b7-40a5-9cc9-ea3b5e61a86d,green).

inside_grid(X,Y) :-
    size(N),
    X >= 0,
    Y >= 0,
    X < N,
    Y < N.

wall_north(X,Y) :-
    inside_grid(X,Y),
    Y =:= 0.

wall_south(X,Y) :-
    inside_grid(X,Y),
    size(N),
    Y =:= N-1.

wall_west(X,Y) :-
    inside_grid(X,Y),
    X =:= 0.

wall_east(X,Y) :-
    inside_grid(X,Y),
    size(N),
    X =:= N-1.

empty(X,Y) :-
    inside_grid(X,Y),
    \+ dirt(X,Y,_),
    \+ agent(X,Y,_,_).