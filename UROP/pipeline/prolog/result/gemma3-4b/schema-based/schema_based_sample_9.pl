grid_size(9).
grid(loc(_,_)) :- between(0, 8, _), between(0, 8, _).
seen(dirt(loc(_,_), _)) :- between(0, 8, _), between(0, 8, _).
seen(agent(id, loc(_,_), _)) :- between(0, 8, _), between(0, 8, _).
empty_location(loc(_,_)) :- between(0, 8, _), between(0, 8, _).
wall(north, loc(X,Y)) :- X = 7, Y in [0..8].
wall(south, loc(X,Y)) :- X = 0, Y in [0..8].
wall(east, loc(X,Y)) :- X in [0..7], Y = 8.
wall(west, loc(X,Y)) :- X in [0..7], Y = 0.