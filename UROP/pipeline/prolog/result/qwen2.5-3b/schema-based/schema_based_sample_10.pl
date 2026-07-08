grid_size(N).
grid(X1,Y1). grid(X2,Y2).
dirt(0,6,_).
agent(9af04778-08d6-4e40-8c6f-ba123d292a22,0,6,orange).
empty(X1,Y1).
wall(X1,Y1,'north').
wall(X1,Y1,'west').
wall(X2,Y1,'east').

dirt(1,6,_).
empty(1,6).

dirt(2,6,_).
empty(2,6).

wall(X2,Y2,'north').
wall(X2,Y2,'south')
.

dirt(0,5,_).
empty(0,5).
wall(X1,Y1,'west').

dirt(1,5,_).
empty(1,5).
wall(X1,Y1,'north').

dirt(2,5,_).
empty(2,5).
wall(X1,Y1,'north').
wall(X2,Y1,'south').

dirt(0,4,_).
empty(0,4).
wall(X1,Y1,'west').
wall(X2,Y1,'east').

dirt(1,4,_).
empty(1,4).
wall(X1,Y1,'north').

dirt(2,4,_).
empty(2,4).
wall(X1,Y1,'north').

dirt(0,3,_).
coloured_agent(9af04778-08d6-4e40-8c6f-ba123d292a22,X1,Y1).

dirt(1,3,_).
empty(1,3).
wall(X1,Y1,'north').

dirt(2,3,_).
empty(2,3).
wall(X1,Y1,'north').

agent(_Id,0,4,color_Orange).
empty(0,4).
wall(X1,Y1,'west').
wall(X2,Y1,'east').

dirt(1,4,_).
coloured_agent(Id,1,4):
Id=9af04778-08d6-4e40-8c6f-ba123d292a22;Id=02a6d9ea-8b8e-4750-8000-c3a74a63fd9c.

dirt(2,4,_).
empty(2,4).
wall(X1,Y1,'north').

agent(Id,0,0,COLOR) :-
Id=9af04778-08d6-4e40-8c6f-ba123d292a22;
coloured_agent(_Id,0,0,COLOR);
Id='02a6d9ea-8b8e-4750-8000-c3a74a63fd9c';
empty(0,0).
wall(X1,Y1,'north').
wall(X1,Y1,'west').

agent(_Id,1,0,COLOR) :-
Id='02a6d9ea-8b8e-4750-8000-c3a74a63fd9c';
empty(1,0,COLOR);
wall(X1,Y1,'north').
wall(X1,Y1,'west').

agent(Id,X1,Y1,color_green) :-
Id='02a6d9ea-8b8e-4750-8000-c3a74a63fd9c';coloured_agent(_Id,X1,Y1=color_green);
empty(X1,Y1).

wall(X8,Y8,'north').
wall(X8,Y8,'south').

dirt(3,0,_).
empty(3,0).