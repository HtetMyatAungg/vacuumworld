grid(grid(0, 7; grid(_North, row(6, East), West); grid(North, row(SouthRow), SouthEast); grid(_North, row(SouthRow-1), West); grid(North, row(GridS), West); grid(North, row(SouthRow-1), column(2*N)); grid(North, row(SouthRow-1), south(West)); grid(East, 0, grid(North, 1, West)); grid(_North, row(0, GridE), _SouthEast); grid(North, 1, grid(GridS, 7, GridW)); grid(North, 2, grid(GridS, 5, GridW)); grid(North, 3, grid(GridS, 3, West)); grid(North, 4, grid(GridE, 6, row(0))); grid(North, 5, grid(GridE, 4, row(0)); grid(East, 7), grid(North, 8, East))))

is_wall(North, East, grid(SouthRow, Row, West)) :- 
    not(Row = SouthRow),
    not(West = N),
    N is Row - 1.

is_wall(East, grid(_SouthRow, Row, West)) :-    
    Row < 8,
    West = Row + 1.

is_wall(West, grid(_, _, Row)) :-
    Row > 0,
    Row rem 2 * 1 =:= West.

is_empty(grid(7, _), grid(North, 7, East)) :-
                  ( 
                    is_wall(East) ;
                    (
                        North = 6 ; 
                        (East = GridW)
                   ) ).

is_empty(grid(_, 7, _), grid(North, 7, West)) :-
                  is_wall(West).

is_empty(grid(North, _, grid(GridSouthRow, 0, West)), grid(_North, 0, GridE) :-
                    (  
                        is_wall(South) ;
                        South = 6 ; 
                        East = GridE
                   ) .

is_empty(grid(7, _, grid(_, _))).

is_dirt(grid(D, rowId, Col), N, M) :-    
    N * E + F = rowId,
    D = dirt(M),
    Col rem E =:= F.

contains(Env, X, Y, T) :-
        env(Env, North, [grid(row(0, 7; % Top row
                                    grid(_North, row(SouthRow), East), _SouthEast)
                           | _]),
    SouthRow > grid,
    Y == SouthRow,
    
    env(Env, grid(GridNorth, row(SouthRow-1), West), South),
    GridNorth rem E =:= North,
    is_wall(East),
    not(is_empty(grid(E, East, West))),
    X == GridNorth,
    Z * W + Q = rowId % Y rem 2 * 1,
    D is _East rem (E \* 3) * F,
    T =: d(0).