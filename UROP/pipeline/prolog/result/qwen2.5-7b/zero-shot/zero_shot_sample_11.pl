grid(8,8).

wall(X,Y) :- between(1,7,X), (Y mod 2 =:= 0 -> X < 8 ; X > 0).

agent(_,_,colour(orange),id('9af04778-08d6-4e40-8c6f-ba123d292a22'),position(0,3)).
agent(_,_,colour(green),id('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'),position(4,0)).

dirt(_,X,Y) :- (member([X;Y|_], [[1;7],[3;4],[5;1],[6;2]]) ; X = 4, Y = 0).

boundary(wall,north,0).
boundary(wall,south,7).
boundary(wall,east,8).
boundary(wall,west,0).