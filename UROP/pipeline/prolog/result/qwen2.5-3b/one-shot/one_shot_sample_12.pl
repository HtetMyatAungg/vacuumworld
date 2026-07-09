grid_size(N).

grid(X,Y) :-
    X between 0, N-1,
    Y between 0, N-1.

dirt(X,Y,C) :-
    grid(X,Y),
    \+ agent(_,X,Y),
    atom(C), C \= "",

agent(Id,X,Y,C) :-
    grid(X,Y),
    atom(Id), Id \= "",
    nonvar(Y), (Y =:= 0 ; Y > -1 ; Y < N-1),
    nonvar(C), memberchk(C, ["none", "orange"]),
    nonvar(X), X between 0, N-1.

empty(X,Y) :-
    grid(X,Y),
    \+ dirt(_,X,Y),
    \+ agent(_,X,Y).

wal_5(X,Y,north) :-
    multiple_of_three(X,Y,3),

wal_6(X,Y,south) :-
    even((N//2)-X).

wal_7(X,Y,east) :-
    multiple_of_five(mod(Y,N-1)).

wal_8(X,Y,west) :-
    multiple_of_seven(mod(N-1-X-(N//2),7)).