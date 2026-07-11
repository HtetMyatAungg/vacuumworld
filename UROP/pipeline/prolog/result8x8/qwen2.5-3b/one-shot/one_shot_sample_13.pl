grid_size(8).

grid(X,Y) :-
    between(0,7,X), between(0,7,Y).

dirt(X,Y, Colour) :-
    member({X,Y}, [[3,4],[3,6],[6,1],[6,5]]),
    member(Colour,[orange,green]).

agent(Id, X,Y, Colour) :-
    member({X,Y},{[4,0]}), Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', member(Colour,[green]).

empty(X,Y) :-
    grid(X,Y),
    \+ dirt(_,Y,C),
    \+ agent(Id,_X,Y,C).

wal(East, X, N, North) :- N > X.
wal(West, N, E, South) :- N < E.
wal(North, X, N, East) :- X > N.
wal(South, N, W, Y) :- N < W.