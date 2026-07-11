grid_size(8).

empty(0,0).
empty(1,0).
empty(2,0).
empty(3,0).
empty(4,0).
empty(5,0).
empty(6,0).
empty(7,0).
empty(0,1).
empty(1,1).
empty(2,1).
empty(3,1).
empty(4,1).
empty(5,1).
empty(6,1).
empty(7,1).
empty(0,2).
empty(1,2).
empty(2,2).
empty(3,2).
empty(4,2).
empty(5,2).
empty(6,2).
empty(7,2).
empty(0,3).
empty(1,3).
empty(2,3).
empty(3,3).
empty(4,3).
empty(5,3).
empty(6,3).
empty(7,3).
empty(0,4).
empty(1,4).
empty(2,4).
empty(3,4).
empty(4,4).
empty(5,4).
empty(6,4).
empty(7,4).
empty(0,5).
empty(1,5).
empty(2,5).
empty(3,5).
empty(4,5).
empty(5,5).
empty(6,5).
empty(7,5).
empty(0,6).
empty(1,6).
empty(2,6).
empty(3,6).
empty(4,6).
empty(5,6).
empty(6,6).
empty(7,6).
empty(0,7).
empty(1,7).
empty(2,7).
empty(3,7).
empty(4,7).
empty(5,7).
empty(6,7).

dirt(0,6, null).
dirt(1,6, null).
dirt(2,6, null).
dirt(0,7, ["south","west"]).
dirt(1,7, ["south"]).
dirt(2,7, ["south"]).
dirt(0,5, ["west"]).
dirt(1,5, null).
dirt(2,5, null).
dirt(0,4, ["west"]).
dirt(1,4, null).
dirt(2,4, null).
dirt(0,3, ["west"]).
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 2,0, 'orange').
empty(1,3, null).
empty(2,3, null).
dirt(0,1, null).
dirt(1,1, null).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4,0, 'green').
empty(1,2, null).
empty(2,2, null).
dirt(0,0, ["north","west"]).
empty(1,0, null).
dirt(2,0, ["north"]).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4,0, 'green').
dirt(4,1, "orange").
empty(5,0, null).
dirt(5,1, "green").
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4,0, 'green').
dirt(4,2, null).
empty(5,2, null).
dirt(4,3, null).
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 4,0, 'orange').
empty(5,3, null).
dirt(4,4, "green").
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 4,0, 'orange').
empty(5,4, null).
dirt(4,5, "orange").
agent(null, 4,4, null).
empty(5,5, null).
dirt(4,6, null).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4,0, 'green').
empty(5,6, null).
dirt(4,7, ["south"]).
agent(null, 4,7, null).