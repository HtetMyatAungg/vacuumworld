grid_size(8).

% Section B: Wall rules
wall(NorthEast, SouthWest, north).
wall(SouthEast, NorthWest, south).
wall(East, North, east).
wall(West, South, west).

grid(X,Y) :- between(0,N,X), between(0,M,Y), N is X + 1, M is Y + 1.

dirt(X,Y,C) :-
   grid(X,Y),
   key(dirt(X,Y,C)).

agent(Id,X,Y,C) :-
   grid(X,Y),
   key(agent(Id,X,Y,C)).

empty(X,Y).
Start
wall(West,NorthEast,Cwest).
wall(North,BottomLeft,nsouthcapedown).

End