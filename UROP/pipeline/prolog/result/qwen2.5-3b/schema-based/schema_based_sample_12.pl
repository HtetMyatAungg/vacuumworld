grid_size(13).

grid(loc(X, Y)) :-
    X between 0, 7,
    Y between 0, 7.

seen(dirt(loc(X,Y), 'orange')) :-
    X between 0, 7,
    Y between 4, 7.

seen(agent('9af04778-08d6-4e40-8c6f-ba123d292a22', loc(X,Y), _)) :-
    X between 0, 7,
    Y between 1, 2.

seen(agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', loc(4,1), 'green')).

empty_location(loc(X,Y)) :-
    X between 0, 7,
    Y between 0, 7,
    \+ seen(dirt(loc(X,Y), _)),
    \+ seen(agent(_, loc(X,Y), _)),
    X \= 3, Y \= 4;
    X \= 4, Y \= 5.

w1(wloc(_X, north)).
w2(wloc(_X, south)).
w3(wloc(_Y, west)).
w4(wloc(_Y, east)).

w1(loc(X,Y), north) :- w1(wloc(loc(X,Y)).
w2(loc(X,Y), south) :- w2(wloc(loc(X,Y)).
w3(loc(X,Y), west) :- w3(wloc(loc(X,Y)).
w4(loc(X,Y), east) :- w4(wloc(loc(X,Y)).

w1(loc(X, Y), dir(N)) :-
    X odd,
    N = north;
    X even,
    N = south.

w2(loc(X, Y), dir(N)) :-
    Y odd,
    N = west;
    Y even,
    N = east.

w3(wloc(_X, _Y)).
w4(wloc(_X, _Y)).