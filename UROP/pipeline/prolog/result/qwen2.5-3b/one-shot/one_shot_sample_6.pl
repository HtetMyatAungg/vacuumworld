grid_size(17).
grid(X,Y).

dirt(0,6, null).
dirt(1,6, null).
dirt(2,6, null).
dirt(0,7, 'south').
dirt(1,7, 'south').
dirt(2,7, 'south').

dirt(0,5, null).
dirt(1,5, null).
dirt(2,5, null).

dirt(0,4, 'orange').
dirt(3,4, 'orange').
dirt(4,4, null).
dirt(6,4, 'orange').

dirt(0,3, null).
dirt(1,3, null).
dirt(2,3, null).

dirt(0,2, null).
dirt(1,2, null).
dirt(2,2, null).
dirt(0,1, null).
dirt(1,1, 'orange').
dirt(2,1, 'orange').

dirt(0,0, null).
dirt(1,0, null).
dirt(2,0, null).
dirt(4,0, 'green').
dirt(5,1, 'green').
dirt(6,6, 'orange').
dirt(7,6, 'south').

dirt(6,3, 'orange').
dirt(7,7, 'south').

empty(X,Y) :-
    grid_size(_),
    (X>0; X<8; Y>0; Y<8).