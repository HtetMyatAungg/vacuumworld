grid_size(9).

grid(loc(X,Y)) :-
  ( X between(0,8) -> X1 is X - 1 ;
  maplist(subtract([X1],X),Walls),
  foreach(Wall, Walls) [wall(loc(X1,Y,C)), wall(loc(Y,X,D))],
  !,
  loc(Y1,X)
 ).

seen(dirt(loc(X,Y), "orange")) :-
  member(["south", "west"], Walls),
  ( X > 0 -> seen_dirt(loc(X-1,Y,Z)) ;
  maplist(subtract([Z],loc(X1,Y)),Walls),
  !,
  loc(Y1,X)
 ),

seen(agent("9af04778-08d6-4e40-8c6f-ba123d292a22", loc(X,Y), "orange")) :-
  member(["south", "west"], Walls),
  !,

empty_location(loc(X,Y)) :-
  grid(loc(X,Y)), \+ seen(_loc(_,_), _Colour).
\+ ( member(Entry, Entries), wall(loc(_,Y1,C), Entry), member(Walls, Entries),
  loc(Y,Z) -> wall(loc(X,WDir), Wall3), wall(Wall2, Entry) ;

   !,
  \+ maplist(wall(loc(K,K),_), Entries)
  ).
wall(loc(X,Y,W)) :-
  ( W = "north" ; W = "east" ) -> 
  X1 is X + 1 ;
  ( W = "south" ; W = "west" ) ->
  X1 is X - 1 ;
  maplist(subtract([X2],loc(X3,Y)),Walls),
  !, loc(Y,Z)
 ).

wall(loc(_,Y,W)) :-
  ( W = "north" ; W = "east" ) -> 
  Y1 is Y + 1 ;
  ( W = "south" ; W = "west" ) ->
  Y1 is Y - 1 ;
 empty_location(loc(X,Y)).