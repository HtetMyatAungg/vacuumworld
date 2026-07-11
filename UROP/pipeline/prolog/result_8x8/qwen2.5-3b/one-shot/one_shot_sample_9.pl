grid_size(14).

grid(X,Y) :-
    Y >= 0,
    X >= 0,
    (Y =< 13; X =< 13).

dirt(X,Y,_) :-
    grid(X,Y),
    findall(L, element_2(member(L, [{"coord": [X,Y], "walls": W, "dirt": D} | _]), Ls),
        member(dirt(_,_,_), Ls)).

agent(Id,X,Y,C) :-
    grid(X,Y),
    findall(E, element_2(member(E, [{"id": Id, "colour": C}, {"coord": [X,Y], "walls": W, "agent": A} | _]), E), Es),
    member(agent(_,_,Id,C), Es).

empty(X,Y) :-
    grid(X,Y),
    \+ (dirt(X1,Y; X,Y1,_) ; agent(Id,X,Y,_)).

walk(X,Y,north) :- Y > 0, grid(X,Y1), not(walk(X,Y1,north)).
walk(X,Y,south) :- Y < _Size, grid(X,Y1), not(walk(X,Y1,south)).
walk(X,Y,east)   :- X < _Size, grid(X1,Y), not(walk(X1,Y)).
walk(X,Y,west)   :- X > 0, grid(X1,Y), not(walk(X1,Y)).

_size is 14.

wall(X,Y,north).
walk(X,Y,south).
walk(X,Y,east).
walk(X,Y,west).

SizeValidationError. Cannot use variable _Size in this context without defining it first.