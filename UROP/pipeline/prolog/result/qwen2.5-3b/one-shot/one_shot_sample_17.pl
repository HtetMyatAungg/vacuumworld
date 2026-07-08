grid_size(8).

grid(_,0).
grid(7,_).

dirt(0,5,green).
dirt(3,4,orange).
dirt(6,3,orange).
dirt(6,6,orange).
dirt(7,0,null).
dirt(7,1,null).
dirt(7,2,null).
dirt(7,3,null).

agent('9af04778-08d6-4e40-8c6f-ba123d292a22',2,0,orange).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',4,0,null).

empty(_, _).