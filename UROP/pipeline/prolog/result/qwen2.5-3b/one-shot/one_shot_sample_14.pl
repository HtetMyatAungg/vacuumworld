grid_size(12).

grid(loc(0,0)).
grid(loc(1,0)).
grid(loc(2,0)).
grid(loc(3,0)).
grid(loc(4,0)).
grid(loc(5,0)).
grid(loc(6,0)).
grid(loc(7,0)).
grid(loc(8,0)).
grid(loc(9,0)).
grid(loc(10,0)).
grid(loc(11,0)).

grid(loc(0,1)).
grid(loc(1,1)).
grid(loc(2,1)).
grid(loc(3,1)).
grid(loc(4,1)).
grid(loc(5,1)).
grid(loc(6,1)).
grid(loc(7,1)).
grid(loc(8,1)).
grid(loc(9,1)).
grid(loc(10,1)).
grid(loc(11,1)).

grid(loc(0,2)).
grid(loc(1,2)).
grid(loc(2,2)).
grid(loc(3,2)).
grid(loc(4,2)).
grid(loc(5,2)).
grid(loc(6,2)).
grid(loc(7,2)).
grid(loc(8,2)).
grid(loc(9,2)).
grid(loc(10,2)).
grid(loc(11,2)).

grid(loc(0,3)).
grid(loc(1,3)).
grid(loc(2,3)).
grid(loc(3,3)).
grid(loc(4,3)).
grid(loc(5,3)).
grid(loc(6,3)).
grid(loc(7,3)).
grid(loc(8,3)).
grid(loc(9,3)).
grid(loc(10,3)).
grid(loc(11,3)).

grid(loc(0,4)).
grid(loc(1,4)).
grid(loc(2,4)).
grid(loc(3,4)).
grid(loc(4,4)).
grid(loc(5,4)).
grid(loc(6,4)).
grid(loc(7,4)).
grid(loc(8,4)).
grid(loc(9,4)).
grid(loc(10,4)).
grid(loc(11,4)).

grid(loc(0,5)).
grid(loc(1,5)).
grid(loc(2,5)).
grid(loc(3,5)).
grid(loc(4,5)).
grid(loc(5,5)).
grid(loc(6,5)).
grid(loc(7,5)).
grid(loc(8,5)).
grid(loc(9,5)).
grid(loc(10,5)).
grid(loc(11,5)).

grid(loc(0,6)).
grid(loc(1,6)).
grid(loc(2,6)).
grid(loc(3,6)).
grid(loc(4,6)).
grid(loc(5,6)).
grid(loc(6,6)).
grid(loc(7,6)).
grid(loc(8,6)).
grid(loc(9,6)).
grid(loc(10,6)).
grid(loc(11,6)).

grid(loc(0,7)).
grid(loc(1,7)).
grid(loc(2,7)).
grid(loc(3,7)).
grid(loc(4,7)).
grid(loc(5,7)).
grid(loc(6,7)).
grid(loc(7,7)).
grid(loc(8,7)).
grid(loc(9,7)).
grid(loc(10,7)).
grid(loc(11,7)).

seen(dirt(loc(X,Y), Colour)) :-
    grid(size(_)),
    grid(loc(X,Y)),
    (   dirty(loc(X,Y))
    ->  true
    ;   false).

dirty(loc(X,Y)) :-
    seen(dirt(loc(X,Y,_)),
         grid(size(Side)),
         wall(boundary(Side, X,Y), Dir)).

seen(agent(Id, loc(X,Y), Colour)) :-
    grid(size(_)),
    grid(loc(X,Y)),
    (agent(Id,X,Y);not(agent(Id,X,Y))).


cleaned(loc(X,Y)) :-
    grid(size(_)),
    grid(loc(X,Y)).


empty_location(loc(X,Y)) :-
    grid_size(Side),
    \+ seen(dirt(_,loc(X,Y)), _, _),
    \+ seen(agent(_,loc(X,Y),_), _, _).
wall(boundary(L, X, Y), dir(up)).
wall(boundary(R, X, Y), dir(right)).
wall(boundary(B, X, Y), dir(down)).
wall(boundary(L, X, Y), dir(left)).

wall(Size) :-
    Size > 2,
    \+ wall(Size-1, _).

wall(Size, L) :-
    L >= -Size+1, L < Size.

wall(Size, R) :-
    R < Size, Size > 0, Size \= 1.

wall(Size, D) :-
    Size >= 3, Size \= 2,
    \+ wall(Size-1, _),
    (wall(Size, d(D)) ; walk(Size, r(R))).