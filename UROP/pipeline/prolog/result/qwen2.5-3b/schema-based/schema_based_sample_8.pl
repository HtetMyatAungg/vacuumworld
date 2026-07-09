grid_size(9).  
grid(X,Y) :- grid_size(N), (X between 0,N \+ 1;Y between 0,N \+ 1).  
dirt(X,Y,Colour) :-
	grid(X,Y),
	dirty_fact(Colour, X, Y).
agent(Id,X,Y,Color) :-
	grid(X,Y),
	agent_fact(Id, Color, X, Y).  
empty(X,Y) :-
	grid(X,Y), not(dirt(_,X,Y)), not(agent(_,X,Y)).
wall(X1, X2, north).
wal_(X1, X2, south).
wal_(X1, X2, east).
wal_(X1, X2, west).

dirty_fact(orange, 0, 6);dirty_fact(orange, 3, 4);dirty_fact(orange, 3, 7);dirty_fact(orange, 4, 7);dirty_fact(orange, 6, 4);
agent_fact("9af04778-08d6-4e40-8c6f-ba123d292a22", "orange", 0, 5).
dirty_fact(orange, 4, 5);dirty_fact(orange, 6, 3);dirty_fact(orange, 7, 4);
agent_fact("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", "green", 3, 4).
wall(X, X1, east) :-
   grid_size(N), (X1 = 0 -> true ; X < X1 - 1 \+ N).
wal_(X, X1, south) :-
   grid_size(N), (X1 = 0 -> true ; Y > Y1 + 1 \+ N).