grid_size(8).

grid((0,0)).
grid((1,0)).
grid((2,0)).
grid((3,0)).
grid((4,0)).
grid((5,0)).
grid((6,0)).
grid((7,0)).

grid((0,1)).
grid((1,1)).
grid((2,1)).
grid((3,1)).
grid((4,1)).
grid((5,1)).
grid((6,1)).
grid((7,1)).

grid((0,2)).
grid((1,2)).
grid((2,2)).
grid((3,2)).
grid((4,2)).
grid((5,2)).
grid((6,2)).
grid((7,2)).

grid((0,3)).
grid((1,3)).
grid((2,3)).
grid((3,3)).
grid((4,3)).
grid((5,3)).
grid((6,3)).
grid((7,3)).

grid((0,4)).
grid((1,4)).
grid((2,4)).
grid((3,4)).
grid((4,4)).
grid((5,4)).
grid((6,4)).
grid((7,4)).

grid((0,5)).
grid((1,5)).
grid((2,5)).
grid((3,5)).
grid((4,5)).
grid((5,5)).
grid((6,5)).
grid((7,5)).

grid((0,6)).
grid((1,6)).
grid((2,6)).
grid((3,6)).
grid((4,6)).
grid((5,6)).
grid((6,6)).
grid((7,6)).

grid((0,7)).
grid((1,7)).
grid((2,7)).
grid((3,7)).
grid((4,7)).
grid((5,7)).
grid((6,7)).
grid((7,7)).

dirt(0, 6, null).
dirt(1, 6, null).
dirt(2, 6, null).

dirt(0, 7, "south west").
dirt(1, 7, null).
dirt(2, 7, null).

dirt(0, 5, null).
dirt(1, 5, null).
dirt(2, 5, null).

dirt(0, 4, null).
dirt(1, 4, null).
dirt(2, 4, null).

agent(id(C9af04778-08d6-4e40-8c6f-ba123d292a22), color orange).

dirt(0, 3, "west").
agent(id(C9af04778-08d6-4e40-8c6f-ba123d292a22), color orange).
agent(id(C9af04778-08d6-4e40-8c6f-ba123d292a22), color orange).

dirt(0, 2, "west").
agent(id(C9af04778-08d6-4e40-8c6f-ba123d292a22), color orange).
agent(id(C9af04778-08d6-4e40-8c6f-ba123d292a22), color orange).

dirt(0, 1, "west").
agent(id(C9af04778-08d6-4e40-8c6f-ba123d292a22), color orange).
agent(id(C9af04778-08d6-4e40-8c6f-ba123d292a22), color orange).

empty((X,Y)) :- \+ grid(X, Y); \+ dirt(X, Y, _); \+ agent(id(_, X, Y, _)).
wall(W, Xo, Yo) :-
  not (grid(Xo + W, Yo)),
  not (dirt(Xo, Yo, _)),
  not(agent(id(_), Xo, Yo, _)).
wall(North, X, Yo) :-
  North = South,
  wall(WaHt, X, YaTo),
  (South == East -> Walldir1 == West; South == West -> Walldir1 == East).

wall(South, Xo, Yo, WeTco) :-
  not(grid(Xo + WaNoht, Yo)),
  not(agent(id(_),Xo, Yo, _)).
empty((WYo,Wro)) :- \+ grid(WRo, WYo); \+ dirt(WRo, WYo, _); \+ agent(id(_, WRo, WYo, _)).