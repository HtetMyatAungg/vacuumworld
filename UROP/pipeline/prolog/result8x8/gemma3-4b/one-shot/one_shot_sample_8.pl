grid_size(8).
grid(X,Y) :- X in [0..7], Y in [0..7].
dirt(X,Y,Color) :- X in [0..7], Y in [0..7], Color = null , X >= 0 , X < 8, Y >= 0, Y < 8.
dirt(3,4,orange).
dirt(6,4,orange).
dirt(2,1,orange).
dirt(5,1,green).
agent(id,X,Y,Color) :- id = '9af04778-08d6-4e40-8c6f-ba123d292a22', X in [0..7], Y in [0..7], Color = 'green'.
agent(id,X,Y,Color) :- id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', X in [0..7], Y in [0..7], Color = 'orange'.
empty(X,Y) :- X in [0..7], Y in [0..7], not dirt(_, X, Y), not agent(_, X, Y).
wall(X, 0, north).
wall(X, 7, south).
wall(0, Y, west).
wall(7, Y, east).