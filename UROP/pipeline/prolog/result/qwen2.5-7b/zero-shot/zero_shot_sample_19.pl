grid_size(8).

north_wall(W) :- between(1, 7, W).
south_wall(W) :- between(0, 6, W).
west_wall(Y) :- between(0, 7, Y).
east_wall(Y) :- between(1, 7, Y).

percept([[0,6]], walls([west]), dirt([]), agent_id(_, orange)).
percept([[1,3]], walls([]), dirt([orange]), _).
percept([[2,1]], walls([west]), dirt([]), _).
percept([[4,0]], walls([north]), dirt([]), agent_id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", green)).
percept([[5,1]], walls([north]), dirt([]), _).
percept([[6,0]], walls([north]), dirt([]), _).
percept([[6,5]], walls([west]), dirt([orange]), _).
percept([[7,0]], walls([east,north]), dirt([]), _).