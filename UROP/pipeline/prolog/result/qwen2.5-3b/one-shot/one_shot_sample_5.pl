Section A — Translation facts:
grid_size(8).

grid(loc(0,0)).
grid(loc(1,0)).
grid(loc(2,0)).
grid(loc(3,0)).
grid(loc(4,0)).
grid(loc(5,0)).
grid(loc(6,0)).
grid(loc(7,0)).

grid(loc(0,1)).
grid(loc(1,1)).
grid(loc(2,1)).
grid(loc(3,1)).
grid(loc(4,1)).
grid(loc(5,1)).
grid(loc(6,1)).
grid(loc(7,1)).

grid(loc(0,2)).
grid(loc(1,2)).
grid(loc(2,2)).
grid(loc(3,2)).
grid(loc(4,2)).
grid(loc(5,2)).
grid(loc(6,2)).
grid(loc(7,2)).

grid(loc(0,3)).
grid(loc(1,3)).
grid(loc(2,3)).
grid(loc(3,3)).
grid(loc(4,3)).
grid(loc(5,3)).
grid(loc(6,3)).
grid(loc(7,3)).

grid(loc(0,4)).
grid(loc(1,4)).
grid(loc(2,4)).
grid(loc(3,4)).
grid(loc(4,4)).
grid(loc(5,4)).
grid(loc(6,4)).
grid(loc(7,4)).

grid(loc(0,5)).
grid(loc(1,5)).
grid(loc(2,5)).
grid(loc(3,5)).
grid(loc(4,5)).
grid(loc(5,5)).
grid(loc(6,5)).
grid(loc(7,5)).

grid(loc(0,6)).
grid(loc(1,6)).
grid(loc(2,6)).
grid(loc(3,6)).
grid(loc(4,6)).
grid(loc(5,6)).
grid(loc(6,6)).
grid(loc(7,6)).

grid(loc(0,7)).
grid(loc(1,7)).
grid(loc(2,7)).
grid(loc(3,7)).
grid(loc(4,7)).
grid(loc(5,7)).
grid(loc(6,7)).
grid(loc(7,7)).

seen(dirt(loc(X,Y), Colour)) :-
  member(coord([X,Y], _Coord)),
  \+ grid(loc(X,Y)),
  seen_dirt(Colour),
  union(Dirs, Walls, Union),
  setof(L, member(WKLList, Union), WKLs),
  (WKLs = ["east"], X > 0 -> true
   ; WKLs = [], X < size(_,7) -1 -> true
   ; WKLs = [], Y < 6 -> true).

seen_dirt(orange).  
seen_dirt(_Colour). 

empty_location(loc(X,Y)) :-
    \+ grid(loc(X,Y)),
    non_member(id(X,Y), [id(0,0), id(1,0), id(2,0),
                           id(3,0), id(4,0), id(5,0),
                           id(6,0), id(7,0)]).

walled(loc(_, north)).
walled(loc(_, south)).

walled(loc(X,Y), east) :-
    X < size(_, 7)-1.
walled(loc(X,Y), west) :-
    \+ walled(loc(X-1,Y),east),
    X > 0.
walled(loc(X,Y), north) :-
    Y < size(_, 8)-1.
walled(loc(X,Y), south) :-
    \+ walled(loc(X-1,Y),north),
    Y > 0.