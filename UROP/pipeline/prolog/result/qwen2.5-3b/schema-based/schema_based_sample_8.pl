grid_size(8).

grid(X,Y) :-
    X in 0..7,
    Y in 0..7.

dirt(X,Y, Colour) :-
    grid(X,Y),
    \+ agent(_,X,Y), 
    \+ empty(X,Y),
    Colour = null;Colour = "orange";Colour = "green".

agent(Id,X,Y,Colour) :-
    grid(X,Y),
    Id != "",
    \+ empty(X,Y).

empty(X,Y) :-
    \+ dirt(X,Y,_),
    \+ agent(_,X,Y).

wall(N,W,NW) :- N > 0, wall(N-1,W,N).
wall(E,NW,EH) :- EH < 8, wall(NW,EH+1,E).

wall(7,W,7) :- W =< 0.
wall(W,R,7) :- R > 0, R =< 7, W = 0.
wall(W,R,W) :- (R > 2; H>6), W < 8.
wall(W,H,W) :- wall(H,W-1,H).