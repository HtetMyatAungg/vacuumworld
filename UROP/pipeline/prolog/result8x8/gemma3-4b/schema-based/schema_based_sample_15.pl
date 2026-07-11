grid_size(5).
grid(X,Y) :- between(0,4,X), between(0,4,Y).
dirt(X,Y, colour) :- X in [0..4], Y in [0..4], colour ins ['orange', 'green'].
agent(Id, X, Y, colour) :- X in [0..4], Y in [0..4], Id = 'uuid', colour ins ['orange', 'green'].
empty(X,Y) :- X in [0..4], Y in [0..4].

wall(X, Y, west) :- X == 0, Y in [0..4].
wall(X, Y, east) :- X == 4, Y in [0..4].
wall(X, Y, north) :- Y == 0, X in [0..4].
wall(X, Y, south) :- Y == 4, X in [0..4].