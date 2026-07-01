edge(X, Y) :-
    X is in_range(0, N),
    Y is in_range(0, N).

in_range(a, b) :- a < b .
in_range(a, b) :- a > b .

grid(N) :-
    N >= 0.

cell(X, Y) :-
    edge(X, Y).

wall(X, Y, Direction) :-
    edge(X, Y),
    (   Direction = west, X = 0
    ;   Direction = east, X = N
    ;   Direction = north, Y = 0
    ;   Direction = south, Y = N
    ).

dirt(X, Y) :-
  edge(X, Y),
  (Y == 6 , X == 3);
  (Y==4 , X==3);
  (Y==7, X==1);         
  (X == 0, Y==2);      
  (X == 2, Y== 2);
  (X == 1, Y== 2 );
  (X ==0, Y ==7);
  dirt_cell(X,Y).

dirt_cell(X,Y) :- X is in_range(0,4), Y is in_range(0,5).

agent(X, Y, id) :-
    edge(X, Y),
    (   X = 3, Y = 3, id = '9af04778-08d6-4e40-8c6f-ba123d292a22'
    ;   X = 4, Y = 0, id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'
    ).

/* The following defines valid edges of the grid for which coordinate pairs exist */