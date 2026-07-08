int(N,0).
int(N,N).

grid(X,Y) :- X >= 0 , X < N , Y >= 0 , Y < N .

dirt(X, Y, orange) :- X >= 0 , X < N , Y >= 0 , Y < N , X mod 3 = 1 , Y mod 3 = 1 .
dirt(X, Y, green) :- X >= 0 , X < N , Y >= 0 , Y < N , X mod 3 = 2 , Y mod 3 = 2 .
dirt(X, Y, orange) :- X >= 0 , X < N , Y >= 0 , Y < N , X = 3 , Y = 4 .

agent(id1, 3, 5, orange) :- id1 = '9af04778-08d6-4e40-8c6f-ba123d292a22'.
agent(id2, 4, 5, green) :- id2 = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.

empty(X, Y) :- X >= 0 , X < N , Y >= 0 , Y < N .

wall(x,y,'north') :- x = 0, y>=0, y<N.
wall(x,y,'south') :- x = 0, y>0, y<N.
wall(x,y,'east') :- x>0, x<N, y=N-1.
wall(x,y,'west') :- x>0, x<N, y=0.

wall(x,y,'north') :- (x = 0) and (y>=0) and (y<N).
wall(x,y,'south') :- (x = 0) and (y > 0) and (y < N).
wall(x,y,'east') :- (x > 0) and (x < N) and (y = N - 1).
wall(x,y,'west') :- (x > 0) and (x < N) and (y = 0).