grid_size(9).
grid(X,Y) :- X in [0..8], Y in [0..8].
dirt(X,Y,C) :- X in [0..8], Y in [0..8], C in {'orange','green'}.
agent(Id,X,Y,C) :- X in [0..8], Y in [0..8], Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', C in {'orange','green'}.
empty(X,Y) :- X in [0..8], Y in [0..8].
wall(X,Y,'north') :- X in [0..8], Y in [0..8], Y = 0.
wall(X,Y,'south') :- X in [0..8], Y in [0..8], Y = 8.
wall(X,Y,'east') :- X in [0..8], Y in [0..8], X = 8.
wall(X,Y,'west') :- X in [0..8], Y in [0..8], X = 0.