grid_size(5).
grid(X, Y) :- X is 0..4, Y is 0..4.
dirt(X, Y, 'orange') :- X is 0..4, Y is 0..4.
dirt(X, Y, 'green') :- X is 0..4, Y is 0..4.
agent(Id, X, Y, 'orange') :- X is 0..4, Y is 0..4, Id = '9af04778-08d6-4e40-8c6f-ba123d292a22'.
agent(Id, X, Y, 'green') :- X is 0..4, Y is 0..4, Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'.
empty(X, Y) :- X is 0..4, Y is 0..4.
wall(0, 0, north).
wall(0, 1, north).
wall(0, 2, north).
wall(0, 3, north).
wall(0, 4, north).
wall(1, 0, east).
wall(2, 0, east).
wall(3, 0, east).
wall(4, 0, east).
wall(4, 1, east).
wall(4, 2, east).
wall(4, 3, east).
wall(4, 4, east).
wall(0, 4, west).
wall(1, 4, west).
wall(2, 4, west).
wall(3, 4, west).
wall(3, 5, west).
wall(3, 6, west).
wall(3, 7, west).
wall(2, 7, south).
wall(1, 7, south).
wall(0, 7, south).
wall(0, 6, south).
wall(0, 5, south).
wall(0, 4, south).
wall(5, 6, south).
wall(5, 7, south).
wall(6, 5, east).
wall(6, 6, east).
wall(6, 7, east).
wall(7, 5, east).
wall(7, 6, east).
wall(7, 7, east).