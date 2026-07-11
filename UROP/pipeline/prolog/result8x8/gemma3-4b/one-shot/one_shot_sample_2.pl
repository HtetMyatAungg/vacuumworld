grid_size(8).
grid(X, Y) :- X >= 0, X < 8, Y >= 0, Y < 8.
dirt(X, Y, color) :- X >= 0, X < 8, Y >= 0, Y < 8, color = 'green'|color = 'orange'.
agent(Id, X, Y, color) :- X >= 0, X < 8, Y >= 0, Y < 8, substring(Id, _, '_', 1), length(Id, _, len), len > 5, strpos(Id, 'agent-') = 1, color = 'white'|color = 'orange'|color = 'green'.
empty(X, Y) :- X >= 0, X < 8, Y >= 0, Y < 8.
wall(X, Y, north) :- X >= 0, X < 8, Y = 7.
wall(X, Y, south) :- X >= 0, X < 8, Y = 0.
wall(X, Y, east) :- X = 7, Y >= 0, Y < 8.
wall(X, Y, west) :- X = 0, Y >= 0, Y < 8.