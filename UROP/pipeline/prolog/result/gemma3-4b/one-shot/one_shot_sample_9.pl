grid_size(9).
grid(0,0).
grid(1,0).
grid(2,0).
grid(0,1).
grid(1,1).
grid(2,1).
grid(0,2).
grid(1,2).
grid(2,2).
grid(0,3).
grid(1,3).
grid(2,3).
grid(0,4).
grid(1,4).
grid(2,4).
grid(0,5).
grid(1,5).
grid(2,5).
grid(0,6).
grid(1,6).
grid(2,6).
grid(0,7).
grid(1,7).
grid(2,7).
grid(3,0).
grid(3,1).
grid(3,2).
grid(3,3).
grid(3,4).
grid(3,5).
grid(3,6).
grid(3,7).
grid(4,0).
grid(4,1).
grid(4,2).
grid(4,3).
grid(4,4).
grid(4,5).
grid(4,6).
grid(4,7).
grid(5,0).
grid(5,1).
grid(5,2).
grid(5,3).
grid(5,4).
grid(5,5).
grid(5,6).
grid(5,7).

dirt(1,1, green).
dirt(2,0, null).
dirt(2,2, null).
dirt(0,7, null).
dirt(1,7, null).
dirt(2,7, null).
dirt(0,5, null).
dirt(1,5, null).
dirt(2,5, null).
dirt(0,4, null).
dirt(1,4, null).
dirt(2,4, null).
dirt(3,3, orange).
dirt(3,1, green).
dirt(3,2, orange).
dirt(3,4, orange).
dirt(3,5, green).
dirt(3,6, orange).
dirt(3,7, green).
dirt(4,5, orange).
dirt(4,7, null).
dirt(6,5, orange).
dirt(6,6, null).
dirt(6,7, orange).

agent('agent-1', 2,0, white).
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 3,0, green).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4,0, orange).

empty(0,0).
empty(1,0).
empty(2,0).
empty(0,1).
empty(1,1).
empty(2,1).
empty(0,2).
empty(1,2).
empty(2,2).
empty(0,3).
empty(1,3).
empty(2,3).
empty(0,4).
empty(1,4).
empty(2,4).
empty(0,5).
empty(1,5).
empty(2,5).
empty(0,6).
empty(1,6).
empty(2,6).
empty(0,7).
empty(1,7).
empty(2,7).
empty(3,0).
empty(3,1).
empty(3,2).
empty(3,3).
empty(3,4).
empty(3,5).
empty(3,6).
empty(3,7).
empty(4,0).
empty(4,1).
empty(4,2).
empty(4,3).
empty(4,4).
empty(4,5).
empty(4,6).
empty(4,7).
empty(5,0).
empty(5,1).
empty(5,2).
empty(5,3).
empty(5,4).
empty(5,5).
empty(5,6).
empty(5,7).

wall(0,0, north).
wall(0,1, west).
wall(1,0, north).
wall(1,1, east).
wall(2,0, north).
wall(2,1, east).
wall(0,2, south).
wall(1,2, south).
wall(2,2, south).
wall(0,3, west).
wall(1,3, south).
wall(2,3, south).
wall(0,4, west).
wall(1,4, south).
wall(2,4, south).
wall(0,5, west).
wall(1,5, south).
wall(2,5, south).
wall(0,6, west).
wall(1,6, south).
wall(2,6, south).
wall(0,7, south).
wall(1,7, east).
wall(2,7, east).
wall(3,0, north).
wall(3,1, east).
wall(3,2, east).
wall(3,3, east).
wall(3,4, east).
wall(3,5, east).
wall(3,6, east).
wall(3,7, south).
wall(4,0, north).
wall(4,1, east).
wall(4,2, east).
wall(4,3, east).
wall(4,4, east).
wall(4,5, east).
wall(4,6, east).
wall(4,7, south).
wall(5,0, north).
wall(5,1, east).
wall(5,2, east).
wall(5,3, east).
wall(5,4, east).
wall(5,5, east).
wall(5,6, east).
wall(5,7, south).
wall(6,0, north).
wall(6,1, east).
wall(6,2, east).
wall(6,3, east).
wall(6,4, east).
wall(6,5, east).
wall(6,6, east).
wall(6,7, south).
wall(7,0, north).
wall(7,1, east).
wall(7,2, east).
wall(7,3, east).
wall(7,4, east).
wall(7,5, east).
wall(7,6, east).
wall(7,7, south).
