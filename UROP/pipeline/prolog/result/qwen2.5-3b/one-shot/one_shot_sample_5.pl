grid_size(30).  
grid(X, Y) :- integer(X), X >= 0, X < 30, integer(Y), Y >= 0, Y < 30.
wall(X, south, Y) :- grid(X, Y + 1).
walk(X, north, Y) :- grid(X, Y - 1).
walk(X, west, Y) :- grid(X - 1, Y).
walk(X, east, Y) :- grid(X + 1, Y).
dirt(X,Y,C) :- grid(X,Y), member(W,lwall{X}(east);lwall{X}(west);rwall{Y}(north);rwall{Y}(south)), \+ member(Walk{X}({Y},dir(_)), Walks), dirt(X,Y,C).  
agent(Id,X,Y,C) :- grid(X,Y), member(A, a(Id, C)), empty(X,Y).  
empty(X, Y) :- grid(X, Y), not(dirt(_,_,_), agent(_,_,_)).  
walkwall(X, dir({Y}, north)) :- walk(X, north, Y).  
walkwall(X, dir({Y+1}, south)) :- walkwall(X, dir({Y}, south)), walk(X, south, Y+1).  
walkwall(X, dir({X}, east)) :- walkwall(X, dir({X-1}, west)), walk(X, west, X-1).  
walkwall(X, dir({X+1}, east)) :- walkwall(X, dir({X}, east)), walk(X, east, X+1).