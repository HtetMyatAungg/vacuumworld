grid_size(8).

grid(X,Y) :-
    between(0,7,X),between(0,7,Y).

dirt(X,Y,C) :-
    grid(X,Y),
    "orange" =:= C;
    (C={colour,"green"}; C is null),
    grid(X,Y).

agent(Id,X,Y,C) :-
    grid(X,Y),
    Id=X||Y,
    C is "orange".

empty(X,Y) :-
    grid(X,Y),
    \+dirt(_X,_Y,_) ;
    \+agent(_,_,_).

wall(North) :-
    South=[east,west], !.
wall(West) :-
    East=[north,east], !.
wall(East) :-
    North=[north,south], !.

wall(X,Y,North) :-
    X = 0 , wall(South,South).
wall(X,Y,South) :-
    X = 7 , South=West, \+wall(8,Y,West).

wall(X,Y,West) :-
    Y = 0 , West=North, \+wall(X,1,North),
    South=[east,north].

wall(X,Y,East) :-
    Y = 7 , East=North, \+wall(X-1,Y,North),
    West=[east,south].