grid_size(9).
grid(X,Y) :- between(0, 8, X), between(0, 8, Y).
dirt(X,Y,orange) :- X mod 2 == 1, between(0, 8, Y).
dirt(X,Y,green) :- X mod 2 == 0, between(0, 8, Y).
agent(Id,X,Y,Colour) :- Id = '9af04778-08d6-4e40-8c6f-ba123d292a22', Colour = 'orange', X in [0..8], Y in [0..8].
agent(Id,X,Y,Colour) :- Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green', X in [0..8], Y in [0..8].
empty(X,Y) :- X in [0..8], Y in [0..8].
wall(west, _, _) :- X == 0, Y in [0..8].
wall(east, _, _) :- X == 8, Y in [0..8].
wall(north, _, _) :- Y == 0, X in [0..8].
wall(south, _, _) :- Y == 8, X in [0..8].