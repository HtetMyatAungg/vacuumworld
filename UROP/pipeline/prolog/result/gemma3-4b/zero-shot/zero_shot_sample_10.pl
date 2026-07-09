domain(N) :-
    N is 8.  % Define the size of the grid

edge(Cell, (Col, Row), wall) :-
    Col between(0, N-1),
    Row between(0, N-1),
    wall == 'west' ? row_map(Col, Row, wall),
    wall == 'east' ? row_map(Col, Row, wall),
    wall == 'north' ? row_map(Col, Row, wall),
    wall == 'south' ? row_map(Col, Row, wall).

edge(Cell, (Col, Row), dirt) :-
    Col between(0, N-1),
    Row between(0, N-1),
    row_map(Col, Row, dirt).

edge(Cell, (Col, Row), agent) :-
   Col between(0, N-1),
   Row between(0, N-1),
   row_map(Col, Row, agent).

row_map(Col, Row, content) :-
    (Col == 0 and Row==0 and (Col==0,Row==0)==(0