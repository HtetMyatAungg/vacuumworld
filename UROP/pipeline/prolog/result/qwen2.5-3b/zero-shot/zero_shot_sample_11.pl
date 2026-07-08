grid(X1-Y1;X2-Y2) :-
    ( X1 > 0 ; Y1 > 0 ),
    ( X1 < 8 ; Y1 < 8 ),
    !,
    grid(X1-H1-X2-;Y1-H1-Y2).

walled(North-South, East-West) :-
    North =< South,
    East =< West,
    North #>\ 0,
    East #>\ 0.

grid(0-6;5-7 ; walled(1/7) ; walled(7/1)).

agent(9af04778-08d6-4e40-8c6f-ba123d292a22, 0-5).

wall(west, 0-Y ; _-Y).
wall(north, X-6 ; X-0).