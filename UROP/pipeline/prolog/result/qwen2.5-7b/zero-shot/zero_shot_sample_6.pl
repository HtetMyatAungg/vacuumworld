grid_size(8).
walls_at(_N, 0) :- between(1, 7, _N).
walls_at(0, Y) :- between(1, 7, Y).
walls_at(N, Y) :- N = 7, between(0, 7, Y).

dirt_at(3, 3).
dirt_at(4, 5).
dirt_at(6, 1).
dirt_at(6, 4).
agent_at('9af04778-08d6-4e40-8c6f-ba123d292a22', 0, 3, orange).
agent_at('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4, 0, green).