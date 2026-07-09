grid_size(13).
grid(X,Y) :- X between 0, 12 ; Y between 0, 12.
dirt(X,Y,C) :-
    percept_log,
    percept(Coord,Walls,Dirt,Agent),
    member(XCoord,Coord), member(YCoord,Coord),
    XCoord = X, YCoord = Y,
    some_element(dirt, Dirt),
    Color = Dirt.
agent(Id,X,Y,C) :-
    percept_log, percept(Coord,Walls,Dirt,Agent),
    member(XCoord,Coord), member(YCoord,Coord),
    XCoord = X, YCoord = Y,
    Id == Agent,
    Color = C.
empty(X,Y) :-
    grid(X,Y),
    not(some_element(dirt,X,Y)),
    not(agent(Id,X,Y,C)).
wall(W, N, Y) :- Y > 0, wall(W, NorthWallY), wind(N, W, Y).
wall(W, N, Y) :- X < pred(pred(maxWALLRowCount)), wall(X, SouthWallXW, Y).

XCoord = floor((X + 1) / 2) * 2 - 1.
YCoord = floor((Y + 1) / 2) * 2 - 1.
NORTH = north if X == maxWALLRowCount ; ( south if not west_wall ).
SouthWallXW = Y if west_wall ; (X + 1).
west_wall = true if X > 0 and member(W,YCoord,NorthWallY,WestWalls).
north_wall = true if Y > 0 and member(N,WestX,Row).
east_wall = true if maxWidth(XCoord) or exists element(ROW, Row, WestW)
wall(W, N, Y) :- not(membered(W,XCoord)).
wind(_, _, _) :- false.