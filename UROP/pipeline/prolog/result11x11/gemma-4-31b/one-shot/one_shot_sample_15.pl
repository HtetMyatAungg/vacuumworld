grid_size(11).

grid(0,0). grid(1,0). grid(2,0). grid(3,0). grid(4,0). grid(5,0). grid(6,0). grid(7,0). grid(8,0). grid(9,0). grid(10,0).
grid(0,1). grid(1,1). grid(2,1). grid(3,1). grid(4,1). grid(5,1). grid(6,1). grid(7,1). grid(8,1). grid(9,1). grid(10,1).
grid(0,2). grid(1,2). grid(2,2). grid(3,2). grid(4,2). grid(5,2). grid(6,2). grid(7,2). grid(8,2). grid(9,2). grid(10,2).
grid(0,3). grid(1,3). grid(2,3). grid(3,3). grid(4,3). grid(5,3). grid(6,3). grid(7,3). grid(8,3). grid(9,3). grid(10,3).
grid(0,4). grid(1,4). grid(2,4). grid(3,4). grid(4,4). grid(5,4). grid(6,4). grid(7,4). grid(8,4). grid(9,4). grid(10,4).
grid(0,5). grid(1,5). grid(2,5). grid(3,5). grid(4,5). grid(5,5). grid(6,5). grid(7,5). grid(8,5). grid(9,5). grid(10,5).
grid(0,6). grid(1,6). grid(2,6). grid(3,6). grid(4,6). grid(5,6). grid(6,6). grid(7,6). grid(8,6). grid(9,6). grid(10,6).
grid(0,7). grid(1,7). grid(2,7). grid(3,7). grid(4,7). grid(5,7). grid(6,7). grid(7,7). grid(8,7). grid(9,7). grid(10,7).
grid(0,8). grid(1,8). grid(2,8). grid(3,8). grid(4,8). grid(5,8). grid(6,8). grid(7,8). grid(8,8). grid(9,8). grid(10,8).
grid(0,9). grid(1,9). grid(2,9). grid(3,9). grid(4,9). grid(5,9). grid(6,9). grid(7,9). grid(8,9). grid(9,9). grid(10,9).
grid(0,10). grid(1,10). grid(2,10). grid(3,10). grid(4,10). grid(5,10). grid(6,10). grid(7,10). grid(8,10). grid(9,10). grid(10,10).

dirt(1,4, orange).
dirt(3,3, orange).
dirt(3,6, orange).
dirt(5,7, orange).
dirt(7,5, green).
dirt(9,2, green).
dirt(9,7, green).

agent('d3af9897-9139-4ffe-8a15-2e9c6f06e71a', 1,0, orange).
agent('d6428e63-73b7-40a5-9cc9-ea3b5e61a86d', 5,0, green).

empty(0,0). empty(2,0). empty(3,0). empty(4,0). empty(6,0). empty(7,0). empty(8,0). empty(9,0). empty(10,0).
empty(0,1). empty(1,1). empty(2,1). empty(3,1). empty(4,1). empty(5,1). empty(6,1). empty(7,1). empty(8,1). empty(9,1). empty(10,1).
empty(0,2). empty(1,2). empty(2,2). empty(3,2). empty(4,2). empty(5,2). empty(6,2). empty(7,2). empty(8,2). empty(10,2).
empty(0,3). empty(1,3). empty(2,3). empty(4,3). empty(5,3). empty(6,3). empty(7,3). empty(8,3). empty(9,3). empty(10,3).
empty(0,4). empty(2,4). empty(3,4). empty(4,4). empty(5,4). empty(6,4). empty(7,4). empty(8,4). empty(9,4). empty(10,4).
empty(0,5). empty(1,5). empty(2,5). empty(3,5). empty(4,5). empty(5,5). empty(6,5). empty(8,5). empty(9,5). empty(10,5).
empty(0,6). empty(1,6). empty(2,6). empty(4,6). empty(5,6). empty(6,6). empty(7,6). empty(8,6). empty(9,6). empty(10,6).
empty(0,7). empty(1,7). empty(2,7). empty(3,7). empty(4,7). empty(6,7). empty(7,7). empty(8,7). empty(10,7).
empty(0,8). empty(1,8). empty(2,8). empty(3,8). empty(4,8). empty(5,8). empty(6,8). empty(7,8). empty(8,8). empty(9,8). empty(10,8).
empty(0,9). empty(1,9). empty(2,9). empty(3,9). empty(4,9). empty(5,9). empty(6,9). empty(7,9). empty(8,9). empty(9,9). empty(10,9).
empty(0,10). empty(1,10). empty(2,10). empty(3,10). empty(4,10). empty(5,10). empty(6,10). empty(7,10). empty(8,10). empty(9,10). empty(10,10).

wall(X, Y, north) :- grid_size(N), Y = 0, X < N.
wall(X, Y, south) :- grid_size(N), Y is N - 1, X < N.
wall(X, Y, west) :- grid_size(N), X = 0, Y < N.
wall(X, Y, east) :- grid_size(N), X is N - 1, Y < N.