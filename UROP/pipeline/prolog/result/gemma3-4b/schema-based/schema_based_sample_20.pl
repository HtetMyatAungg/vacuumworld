grid_size(N).
grid(X, Y) :- X > 0, X =< N, Y > 0, Y =< N.

dirt(X, Y, Colour) :-
    X > 0, X =< N,
    Y > 0, Y =< N,
    Colour ins 'orange'.

dirt(X, Y, Colour) :-
    X > 0, X =< N,
    Y > 0, Y =< N,
    Colour ins 'green'.


agent(Id, X, Y, Colour) :-
    X > 0, X =< N,
    Y > 0, Y =< N,
    Id in ['02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', '9af04778-08d6-4e40-8c6f-ba123d292a22'].

empty(X, Y) :-
    X > 0, X =< N,
    Y > 0, Y =< N.

wall(X, Y, west) :-
    X > 0, X =< N,
    Y > 0, Y =< N,
    X = 0.

wall(X, Y, south) :-
    X > 0, X =< N,
    Y > 0, Y =< N,
    Y = N.

wall(X, Y, east) :-
    X > 0, X =< N,
    Y > 0, Y =< N,
    X = N.

wall(X, Y, north) :-
   X > 0, X =< N,
   Y > 0, Y =< N,
   Y = 0.