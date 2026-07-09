grid_size(8).
grid(X,Y) :- X in [1..8], Y in [1..8].
dirt(X,Y,orange) :- X in [1..4], Y in [4..8].
dirt(X,Y,green) :- X = 4, Y in [0..3].
agent(id,X,Y,green) :- X = 4, Y = 0.
empty(X,Y) :- between(1,8,X), between(1,8,Y), not (dirt(_,X,_) or agent(_,X,Y,_)).
wall(X,Y,north) :- X in [1..8], Y = 0.
wall(X,Y,south) :- X in [1..8], Y = 7.
wall(X,Y,west) :- Y in [1..8], X = 0.
wall(X,Y,east) :- Y in [1..8], X = 7.