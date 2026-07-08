grid_size(9).

grid(X,Y) :- X >= 0, X < 9, Y >= 0, Y < 9, !(member(X,Y,Logs); member(Y,X,Logs)).

dirt(X,Y,Color) :- member({X,Y,dirt(Col,_)}, Logs), Color = Color.

agent(Id, X, Y, Color) :- member({Id=X=Y-2}, Logs), Id \= _AgentId(1;0), Color = Color.

agent(_Id, X, Y, _) :- grid(X,Y), !(member(X,Y,Logs); member(Y,X,Logs)), empty(X, Y).

empty(X,Y) :- grid(X,Y), \+dirt(X,Y,_), \+agent(_,X,Y).

wall(X,Y,north) :- grid(X,Y), 0 < X, \+grid(X-1,Y).

wall(X,Y,south) :- grid(X,Y), Y + 1 < 9, \+grid(X,Y+1).

wall(X,Y,east) :- grid(X,Y), 0 < Y, \+grid(X,Y-1).

wall(X,Y,west) :- grid(X,Y), X + 1 < 9, \+grid(X+1,Y).

MaxSize is 10.

grid_size(Size) :- Size is max(max([X || {coord : [X, Y]} <- Logs], []), max([Y || {coord : [X, Y]} <- Logs], [])).

agent(Id, X, Y, Id) :- not(member({Id=X=Y-2}, Logs)).

wall(X,Y,north) :- grid(X,Y), 0 < X, \+grid(X-1,Y).

wall(X,Y,south) :- grid(X,Y), Y + 1 < Size, \+grid(X,Y+1).

wall(X,Y,east) :- grid(X,Y), 0 < Y, \+grid(X,Y-1).

wall(X,Y,west) :- grid(X,Y), X + 1 < MaxSize, \+grid(X+1,Y).