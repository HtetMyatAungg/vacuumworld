grid_size(9).
grid(loc(_,_)) :- total_size > 0.
seen(dirt(loc(X,Y), Colour)) :- X in [0..8], Y in [0..8], (X = 0, Y = 0, Colour = 'orange') ; (X = 1, Y = 1, Colour = 'green') ; (X = 4, Y = 0, Colour = 'orange') ; (X = 5, Y = 1, Colour = 'green').
seen(agent(Id, loc(X,Y), Colour)) :- X in [4..4], Y in [0..0], Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green'.
empty_location(loc(X,Y)) :- X in [0..8], Y in [0..8].
wall(loc(X,Y), north) :- X in [0..8], Y = 0.
wall(loc(X,Y), south) :- X in [0..8], Y = 8.
wall(loc(X,Y), east) :- X = 7, Y in [0..8].
wall(loc(X,Y), west) :- X = 0, Y in [0..8].