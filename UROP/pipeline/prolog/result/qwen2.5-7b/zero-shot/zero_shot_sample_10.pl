north(Walls) :- member(north, Walls).
south(Walls) :- member(south, Walls).
west(Walls) :- member(west, Walls).
east(Walls) :- member(east, Walls).

grid_content([[_, _, _], [_, _, _], [_]],
             [[agent(9af04778-08d6-4e40-8c6f-ba123d292a22, orange), _], [], []],
             [[green, _, _], [agent(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c, green), _, _], [], [], [], [green, _, _], [], []],
             [[north, west], [north, west, north], [north, north, north], [north, north, north], [north, north], [north, north], [north, north], [north, south, east]])