grid(8,8).
wall(X,Y) :- X>0, X=<7, Y>0, Y=<7, (X==1,Y==6;Y==6,X==2;Y==4;X=4,Y=3;Y=5,X=4;Y=6,X=4;Y=7,X=4;X=5,Y=0;Y=1,X=5;Y=2, X=5;Y=3,X=5;X=5,Y=4;Y=5, X=5;X=1,Y=5;Y=6, X=5;X=7,Y=5;X=6,Y=0;Y=1, X=6;Y=2, X=6;Y=3, X=6;Y=4, X=6;X=7,Y=6).
dirt(0,3,"orange").
dirt(2,6,"orange").
dirt(3,5,"orange").
dirt(6,1,"green").
dirt(6,2,"orange").
agent("9af04778-08d6-4e40-8c6f-ba123d292a22", "orange", 0, 3).
agent("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", "green", 4, 0).