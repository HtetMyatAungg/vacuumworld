grid_size(8).
grid(X, Y) :-
    X between 0, 7,
    Y between 0, 7.
dirt(X, Y, Colour) :-
    X between 0, 7,
    Y between 0, 7,
    grid(X,Y),
    \+ agent(Id,X,Y,_),
    colour(Colour).
agent(Id, X, Y, Colour) :-
    X between 0, 7,
    Y between 0, 7,
    grid(X,Y),
    Id \= null,
    colour(Colour).
empty(X, Y) :-
    X between 0, 7,
    Y between 0, 7.
wall_west(SouthWall, WestWal, X, Y) :-
    Y > 0,
    grid(X, Y-1,WestWal),
    \+ \+ _XEast_South, SouthWall, X, Y).
walleyastastatual(Direction, Wall, X, Y) :-
    \+ Y = 0,
    (Direction \= south -> _EastWal, Direction \= west -> empty(X,Y); Wal_Xeast_Wallwesteast(Direction, WestWall, X, Y)),
    (direction \= north -> wal_northStatus_westeast(Direction, Wall, X, Y); WestWal),
    (\+ grid(_X, Y, NorthWall)).
wal_yeastal(Direction, EastWal, X, Y) :-
    \+ Direction = south &&\+ \= Direction = west -> wall_east_xeast_directionDirection, EastWal, grid(X,Y+1,EastWal),
    (direction = north -> wal_north_westeastDirection; Wal_SouthWall),
    (\+ grid(_X, Y, NorthWall)).
dirt(X, Y, Colour) :-
    X between 0, 7,
    Y between 0, 7,
    clean(_X,_Y),
    (Colour = orange; Colour = green).