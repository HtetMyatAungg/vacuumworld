grid_size(8).

% Section A: Translation facts

grid(X,Y) :-
    between(0,7,X),
    between(0,7,Y).
dirt(X,Y,Colour) :-
    member({X,Y,_}, [
      {1,7,'south'},
      {2,7,'south'},
      {3,5,'orange'},
      {4,5,'orange'},
      {5,1,'green'}
    ]), X > 0.
agent(Id,X,Y,Colour) :-
    member({Id,_,X,Y,_}, [
      {'9af04778-08d6-4e40-8c6f-ba123d292a22',0,0,'orange'},
      {'02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',4,0,'green'}
    ]),
    X > 0.
empty(X,Y) :-
    \+ grid(X,Y),
    \+ dirt(_X,_Y_),
    \+ agent(_,X,Y).

% Section B: Wall rules

wall(X,Y,E) :- X == 7, Y \== 6, E == east.
walY(Wall,Y,N) :- Y == 0, N == north.
wall(X,Y,S) :- Y == 7, S == south.
wall(W,X,E) :- W == 0, E == west.
walW(X,Y,W) :- X > 0, (W == west; W == south), X < 8, walX(_X,Y,W).
walE(X,Y,Ne) :- Y > 0, (Ne == north; Ne == east), Y < 8, walY(_,Y,Ne).