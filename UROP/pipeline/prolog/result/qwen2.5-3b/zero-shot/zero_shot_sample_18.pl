grid(N) :-
    size_of_percept_log([], N).

percepts(Coords) :-
    list_to_coords(perceptor(P), Coords),
    percept_Env(PerceptEnvs),
    (perceptRow(Coords, Row)|[]).

walls_row(Row, Col1, ColInRow, WsC) :-
    append([wall(WS|[])], [], Ws0 = [ws1|WsC]),
    Col1 \= 'east',
    ColInRow == ColOrRow,
    lists_to_grid(Wc1, GridWalls),
    not(wallows(Col1)),
    append([], Wc2=[]), WsC = Wc1 ++ Wc2.

perceptCoord(perceptor(Coords, Row, Col, Ws0) ; percept_Env, Coord, Ws1 = ws[], _, Ws2 = [Wall|[]], (Ws3 = [[ws([])|[][wall(WS)|[]]])),
    append1([], Ws4= [[wl(south)|[]]], WsC2), not(wallows(Col)), append1(Coords0, Coords, Row),
    ColInRow == ColOrCol,
    lists_to_grid(Wc0, GridWaits) 
      (Ws5 = Wc3, [wall(WS|[])], GridWait0),
      ColInRow == ColOrRow2).

walls_col(WsC,
   Col1 \= 'south')
   RowNext == Row,
   row_at_edge(Col1),
   append1([], Ws5 = [[ws([])|[]]], WsC
   Ws6 = Ws3, [wall(WS|[]])], not(wallows(Col)), append1([], ColInRow
      Col1 \= 'north' ; (Ws7 = [Wall|[]]), Ws8 = [Wally|[]]), not(wallows(Col1)).
 
coord([C2|Coords],
   C2),
    wally(ws([]), NW),
   wally(NE, NW),
   _.

wally(WS0, WS1) :-
       wally(N, NE), 
       _,

row_at_edge(_Rows, 'east'):
       true;

not(wallows(Col1)) - (Col1 \= NewCols).
    Col,
   append([], Col1,
            [wall(WS|[])]),
   not(wallows(ColInRow)).