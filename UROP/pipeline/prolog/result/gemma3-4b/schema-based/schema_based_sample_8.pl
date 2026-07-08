grid_size(5).
grid(X, Y) :- X in [0..4], Y in [0..4].
dirt(X, Y, Colour) :- X in [0..4], Y in [0..4], Colour = 'orange'| Colour = 'green'.
agent(Id, X, Y, Colour) :- Id = '9af04778-08d6-4e40-8c6f-ba123d292a22', X in [0..4], Y in [0..4], Colour = 'orange'| Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Y in [0..4], X in [0..4], Colour = 'green'.
empty(X, Y) :- X in [0..4], Y in [0..4].

wall(X, Y, west) :- X == 0, Y in [0..4].
wall(X, Y, south) :- Y == 0, X in [0..4].
wall(X, Y, east) :- X == 4, Y in [0..4].
wall(X, Y, north) :- Y == 4, X in [0..4].