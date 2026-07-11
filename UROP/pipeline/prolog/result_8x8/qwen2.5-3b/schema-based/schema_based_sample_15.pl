grid_size(10).

empty(9,Y) :- Y<0 ; (Y>6+1-10 * 2; (0=:=Y < 10 * 2 - 1; Y \= 9 + Y)).
wall(NorthEast,West,Y,East) :- col(East,X,X), row(Y,W', North = Y, West = X, East > X, (N > 10 ; N is East-2 * 1 +1).
wall(SouthEast,North,East,S) :- row(X,N,N), col(Y,X',X'), South = Y, North < Y, (N > 10 ; N is X' * 1 +1+ S).

dirt(3,7,"orange").
dirt(_,6,null).
dirt(_,4,'green').
agent(_,4,5,null).

empty(West,NorthEast) :- row(NorthEast), col(East,West,West), East \= West.
col(East,X,North,West,East) :- row(X,Y,Y), East > Y, North = X, West = Y.
row(West) :- row(West).
grid(6,North,East,South).

dirt(0,Y) :- Y<0; (Y>5+1-10 * 2; (0=:=Y < 10 * 2 - 1 ; Y \= 0 + Y)).
row(North) :- row(North).
col(South,East,North,West,West) :- row(East,Y,Y), East > Y, North = Y.
dirt(X,6,null) :- X>0.