grid_size(8).
grid(X,Y) :- between(1,8,X), between(1,8,Y).
dirt(X,Y,Color) :- between(1,8,X), between(1,8,Y), (X==4 && Y==0 && Color=='green'), (X==6 && Y==4 && Color=='orange').
agent(ID, X, Y, Color) :- X in [1..8], Y in [1..8], ID == '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Color=='green', (X==4 && Y==0).
empty(X,Y) :- X in [1..8], Y in [1..8], not dirt(X,Y,_), not agent(?, X, Y, _).
wall(X,Y,N) :- X in [1,8], Y in [1,8], (X == 1 && Y >= 1 && Y <= 8 -> N=='north'; true).
wall(X,Y,E) :- X in [1,8], Y in [1..8], (Y == 1 && X >= 1 && X <= 8 -> E=='east'; true).
wall(X,Y,S) :- X in [1..8], Y in [1,8], (X==8 && Y>=1 && Y<=8-> S='south';true).
wall(X,Y,W) :- X in [1..8], Y in [1..8], (X==1 && Y==8 -> W='west'; true).