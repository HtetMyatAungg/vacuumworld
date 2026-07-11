grid(N) :-
    N is 8.

walls(N, X1, Y1, X2, Y2, Ws) :-
    grid(N),
    (   between(X1, X2, X),
         between(Y1, Y2, Y),
         member(W, Ws);
    true).

coordinate(Coor) -->
    coord(CoordX),
    coord(CoordY),
    { Coor = [CoordX, CoordY] }.

wall(N, Coor, Wl) :-
    grid(N),
    (   walls(N,
            X1, Y1,
            X2, Y2,
            Wl);
         Wl = []
    ),
    coordinate(Coor).

cell(N, Coor0, Dirt0, AgentId0, Colour0) :-
    grid(N),
    coordinate(Coor0),
    wall(N, Coor0, WallL),
    atom_list(Walls, WallL, WallsInCoor, []),
    cell_wall(Wall, WallL, WallsInCoor).

cell_wall(W, WallL2, WallsInCoor) :-
    (   memberchk((X1, Y2-YS3=T, CoorX0=CoorW), KS0),
         W = WK0-X1-Wls);
    not(member(Bndl, WallsInCoor)).

cell(N, _, Dirt, AgentId, Colour) :-
    grid(N),
    (   Dirt == "orange",
         AgentId == "9af04778-08d6-4e40-8c6f-ba123d292a22",
         Colour == orange;
    AgentId == green,
         CoorX0 = 4, CoorY0 = 0,
         Dirt == "green",
         Colour == green;
    Dirt == "",
         AgentId == _,
         Colour == ""
    ).

cell(N, _, Dirt, AgentId, Colour) :-
    grid(N),
    N > 1,
    not(Dirt == ""),
    not(AgentId == "").
  
wall(8, [0, 7], [[west, south]]);
wall(8, [1, 5], []);
wall(8, [2, 4], [{north}]);
wall(8, [0, 3], [{north, west}]);
wall(8, [1, 2], [{north}]);  
wall(8, [2, 1], [{east}, {north}]);
wall(8, [0, 2], [{south}, {west}]);
wal(8, [1, 0], [{east}, {north}]);
wal(8, [3, 4], [{west}, {north}]);  
wal(8, [4, 5], [{north}, {east}]);
wal(8, [3, 5], [{north}, {east}, {west}]).
wal(8, [6, 6], [{north}, {south}]);  
wal(8, [7, 0], [{north}, {east}, {south}]), 
wal(8, [7, 1], [{east}, {north}],  
wal(8, [7, 2], [{east}], 
wal(8, [7, 3], [{east}],  
wal(8, [7, 4], [{east}],  
wal(8, [7, 5], [{east}],  
wal(8, [7, 6], [{east}],  
wal(8, [7, 7], [{south}, {east}]).