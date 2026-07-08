grid_size(8).

grid(X,Y) :-
    ( X == 0 ; Y == 0 ),
    between(1,7,X),
    between(1,7,Y).
grid(X,Y) :-
    between(1,7,X), 
    between(1,7,Y).

dirt(X,Y, Colour) :-
    grid_size(N),
    ( X > 0 ; X < N-1 ),
    ( Y > 0 ; Y < N-1 ),
    grid(X,Y).

agent(Id, X,Y, Colour) :-
    grid_size(N),
    ( X == 0 ; X == N-1 ),
    ( Y > 0 ; Y < N-1 ),
    grid(X,Y), 
    agent(Id,Colour).

empty(X,Y) :-
    grid_size(N),
    grid(X,Y),
    \+ dirt(_X,_Y_),
    \+ agent(_,_,_Y).

wall(East,X,Y) :- X > 0, X < N-1 , East == east.
wall(Up,Y,X) :- Y > 0, Y < N-1 , Up == north.
wall(West,X,Y) :- grid_size(N), X == 0, ( N mod 2 == 0 -> Y == Y/N ; Y > Y/N ).
wall(Down,Y,X) :- grid_size(N), Y == N-1, Up == south.