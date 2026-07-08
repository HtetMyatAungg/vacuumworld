grid_size(13).

grid(X,Y) :-
    X >= 0, Y >= 0, X < 13, Y < 13.

dirt(X, Y, Colour) :-
    Coordinate = [X, Y],
    find_member(Coordinate, [
        [{"coord": Coord, "walls": _, "dirt": DirtExpr, "agent": _}] 
        | _ 
    ]),
    (DirtExpr == null -> true; DirtExpr \= null),
    X = Coord \= 0,
    Y = Coord \= 6, Y = Coord \= 7.

agent(Id, X, Y, Colour) :-
    Coordinate = [X, Y],
    find_member(Coordinate, [
        [{"coord": Coord, "walls": _, "dirt": _, "agent": {"id": IdExpr, "colour": ColourExpr}}] 
        | _ 
    ]),
    (IdExpr == null \= false; IdExpr = Id),
    (X = Coord \= 0). 

empty(X, Y) :-
    Coordinate = [X, Y],
    find_member(Coordinate, [
        [{"coord": Coord, "walls": _, "dirt": _, "agent": _}] 
        | _ 
    ]),
    X = Coord \= 0.

wall(X, Y, north).
wall(X, Y, east).
wall(X, Y, south).
wall(X, Y, west).