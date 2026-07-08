grid_size(9).

% Section B - Wall rules

wall(NorthWest,NorthEast,EastWest,WestNorth) :-
    NorthEast is N + 1,
    WestNorth is N - 1,
    X1 is coord_x(NorthWest), X2 is coord_x(WestNorth),
    Y1 is coord_y(NorthEast), Y2 is coord_y(EastWest).

grid(X,Y) :- grid_size(Side), (X =< Side, Y =< Side; X > Side, Y > Side).

dirt(X,Y, Colour) :-
    member(grid(X,Y), Grid),
    dirt(Grid, X, Y, Colour).

agent(Id,X,Y,Colour) :-
    member(agent(Id,X,Y,Colour), Agents).

empty(X,Y) :-
    \+ member(grid(X,Y), Grid),
    \+ agent(Id,X,Y,_Colour),
    \+ dirt(X,Y,_Colour).

wall(0,NorthW,EastW,SouthW) :- NorthW is 0, SouthW is N - 1, Wall(NorthW,EastW,SouthW,WestN).
wall(EastW,WestE,SouthE,NorthS) :- EastW > 0, WestE < N, SouthE = N, wall(WestN,EastW,WestE,NorthS).