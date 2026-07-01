Section A — Translation facts:
grid_size(12).
grid(loc(X,Y)).

seen(dirt(loc(X,Y), null)).
seen(dirt(loc(X,Y), green)).
seen(dirt(loc(X,Y), orange)).

seen(agent("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", loc(X,Y), null)).
seen(agent("043d6f15-dfc1-4a2a-ae0c-bdcb3132ad1a", loc(X,Y), green)).

empty_location(loc(X,Y)) :-
  \+ grid(loc(X,Y)),
  \+ seen(dirt(_, _Colour), Loc),
  \+ seen(agent(_Id,Loc, _Colour), Loc).

Section B — Wall rules:
wall(loc(X,Y), north) :-
  grid_size(12),
  member({X,-1}, [{0,_Y} .. {6,_Y}]).
walldir(walk(north), loc(X,Y), east).
walldir(walk(south), loc(X,Y), west).
walldir(walk(east), loc(X,Y), south).
walldir(walk(west), loc(X,Y), north).

\+ walldir(walk(_Dir1-LANL-LOC3WALLETCHTDIR), LOC2-WORKEXCEPTDIR, Dir) :-
  \+ grid(loc({X},Y)) ;
  member(Id@loc(_,_{Y}), [loc(0,1)-id(loc({C-X},WARLDIR@south-id),{D-Y}), loc(6,5)-id(loc(walldir@west-loc,{T-C}@north-id),{Z-D})]).

\+ grid(loc(X,Y)) :-
  \+ seen(dirt(_, _Col), Loc),
  \+ seen(agent(_Id,Loc, _Col), Loc).