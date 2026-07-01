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

seen(dirt(loc(X,Y), Colour)) :- grid(loc(X,Y)), non_var(Colour), non_var(Y), per_coord(coord(X,Y), [Color], Dirt), member(empty_location(Color), Dirt).

seen(agent(Id, loc(X,Y), Colour)) :-
  grid(loc(X,Y)), non_var(Id), non_var(Colour), non_var(Y),
  per_agent(agent(_, Id, LocA, _), coord(X,Y)),
  remove_from_set(Loc, [LocA], SetB),
  seen(empty_location(Location) | SetB).

empty_location(loc(0,Y)).
empty_location(loc(X,8)).

% Rest of the Section B
wallow(loc(X,Y,west)) :- grid_size(N), X > 0, !.
wallow(loc(X,Y,east)) :- grid_size(N), Y < N - 1, !.
wallow(loc(X,Y,north)) :- grid_size(N), Y > 0, !.
wallow(loc(X,Y,south)) :- grid_size(N), X < N - 1, !.

wallow/3.