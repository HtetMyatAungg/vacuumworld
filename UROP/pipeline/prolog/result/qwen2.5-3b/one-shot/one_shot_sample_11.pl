grid_size(12).

grid(0,0).
grid(0,1).
grid(0,2).
grid(0,3).
grid(0,4).
grid(0,5).
grid(0,6).
grid(0,7).
grid(1,0).
grid(1,1).
grid(1,2).
grid(1,3).
grid(1,4).
grid(1,5).
grid(1,6).
grid(1,7).
grid(2,0).
grid(2,1).
grid(2,2).
grid(2,3).
grid(2,4).
grid(2,5).
grid(2,6).
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
grid(6,0).
grid(6,1).
grid(6,2).
grid(6,3).
grid(6,4).
grid(6,5).
grid(6,6).
grid(6,7).
grid(7,0).
grid(7,1).
grid(7,2).
grid(7,3).
grid(7,4).
grid(7,5).
grid(7,6).

dirt(0,5, green).
dirt(2,5, orange).
dirt(4,5, orange).
dirt(6,5, orange).
dirt(8,5, orange).
dirt(10,5, green).
dirt(3,6, orange).
dirt(5,6, orange).
dirt(7,6, orange).
empty(0,0).
empty(2,0).
empty(4,0).
empty(6,0).
empty(8,0).
empty(10,0).

wall(0,NW,{north,west}).
wall(NW,EW,{west,east}).
wall(EW,NE,{east,north}).
wall(NE,SE,{north,south}).
wall(SE,SW,{south,west}).
wall(SW,NW,{west,north}).