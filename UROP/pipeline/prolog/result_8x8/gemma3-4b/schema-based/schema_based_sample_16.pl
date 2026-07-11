grid_size(8).
grid(X,Y) :- X in [0..7], Y in [0..7].
dirt(X,Y,orange) :- X in [0..2], Y in [3..7].
dirt(X,Y,green) :- X in [5..7], Y in [0..4].
empty(X,Y) :- X in [0..7], Y in [0..7].
agent(Id, X,Y,orange) :- X in [3..7], Y in [0..7].
agent(Id, X,Y,green) :- X in [5..7], Y in [0..4].
agent(_,X,Y,null) :- X in [0..7], Y in [0..7].

wall(X,Y,west) :- X == 0, Y in [0..7].
wall(X,Y,north) :- Y == 0, X in [0..7].
wall(X,Y,east) :- X == 7, Y in [0..7].
wall(X,Y,south) :- Y == 7, X in [0..7].