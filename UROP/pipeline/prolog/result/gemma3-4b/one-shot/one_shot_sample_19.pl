grid_size(8).
grid(loc(X,Y)) :- X `between`(0,7), Y `between`(0,7).
seen(dirt(loc(X,Y), Colour)) :- X `between`(0,7), Y `between`(0,7), Colour ins ['orange', 'green'].
seen(agent(Id, loc(X,Y), Colour)) :- X `between`(0,7), Y `between`(0,7), Id exists, Colour ins ['green'].
empty_location(loc(X,Y)) :- X `between`(0,7), Y `between`(0,7), not (seen(dirt(loc(X,Y), _)) or seen(agent(_, loc(X,Y), _))).
wall(loc(X,Y), north) :- X `between`(0,7), Y = 0.
wall(loc(X,Y), south) :- X `between`(0,7), Y = 7.
wall(loc(X,Y), east) :- Y `between`(0,7), X = 7.
wall(loc(X,Y), west) :- Y `between`(0,7), X = 0.