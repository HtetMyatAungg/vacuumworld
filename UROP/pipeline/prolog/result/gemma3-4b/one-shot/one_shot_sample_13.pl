grid_size(9).
grid(loc(X,Y)) :- X in [0..8], Y in [0..8].
seen(dirt(loc(X,Y), Colour)) :- X in [0..8], Y in [0..8], (X == 3 && Y == 7) , Colour \= unknown.
seen(agent(Id, loc(X,Y), Colour)) :- X in [0..8], Y in [0..8], (X == 4 && Y == 0).
empty_location(loc(X,Y)) :- X in [0..8], Y in [0..8], not (seen(dirt(loc(X,Y), _)) or seen(agent(_, loc(X,Y), _))).
wall(loc(X,Y), north) :- X == 0, Y in [0..8].
wall(loc(X,Y), south) :- X == 8, Y in [0..8].
wall(loc(X,Y), east) :- Y == 0, X in [1..8].
wall(loc(X,Y), west) :- Y == 8, X in [1..8].