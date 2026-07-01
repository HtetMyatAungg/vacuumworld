grid_size(9).
grid(loc(X,Y)) :- X in [0..8], Y in [0..8].
seen(dirt(loc(X,Y), C)) :- X in [0..8], Y in [0..8], C in ['orange', 'green'].
seen(agent(Id, loc(X,Y), C)) :- Id \= null, X in [0..8], Y in [0..8], C in ['orange', 'green'], Id = "9af04778-08d6-4e40-8c6f-ba123d292a22" | Id = "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c".
empty_location(loc(X,Y)) :- X in [0..8], Y in [0..8].
wall(loc(X,Y), west) :- X = 0, Y >= 0, Y < 9.
wall(loc(X,Y), south) :- Y = 0, X >= 0, X < 9.
wall(loc(X,Y), east) :- X = 8, Y >= 0, Y < 9.
wall(loc(X,Y), north) :- Y = 8, X >= 0, X < 9.