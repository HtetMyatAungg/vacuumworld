grid_size(9).
grid(loc(_,_)) :- between(0,8, _).
seen(dirt(loc(_,_),_)) :- between(0,8, _), between(0,8, _).
seen(agent(_, loc(_,_),_)) :- between(0,8, _), between(0,8, _).
empty_location(loc(_,_)) :- between(0,8, _), between(0,8, _).
wall(loc(0, Y), West) :- Y in [0..8].
wall(loc(8, Y), East) :- Y in [0..8].
wall(loc(X, 0), North) :- X in [0..8].
wall(loc(X, 8), South) :- X in [0..8].