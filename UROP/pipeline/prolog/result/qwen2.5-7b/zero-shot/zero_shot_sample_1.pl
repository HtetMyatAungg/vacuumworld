grid(8).

wall(X,Y) :- member((X,Y,['west'])),between(1,7,X),between(0,6,Y).
wall(X,Y) :- member((X-1,Y,['east'])),between(2,8,X),between(0,6,Y).
wall(X,Y) :- member((X,Y,['north'])),between(1,7,X),between(1,7,Y).
wall(X,Y) :- member((X,Y-1,['south'])),between(1,7,X),between(2,8,Y).

dirt(_,6). dirt(_,7).

agent(_,0,'9af04778-08d6-4e40-8c6f-ba123d292a22','orange').
agent(_,5,'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c','green').

dirt(_,1). dirt(3,4). dirt(_,2).