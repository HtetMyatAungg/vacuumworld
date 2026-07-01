grid(grid([(0,6),(1,6),(2,6)],[(0,7),(1,7),(2,7)],[(0,5),(1,5),(2,5)],[(0,4),(1,4),(2,4),(3,4)],[(0,3),(1,3),(2,3),(3,3),(4,3)],[(0,2),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2)],[(0,1),(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1)],([(0,0),(1,0),(2,0),(),(3,0),(4,0),(5,0),(6,0),(7,0)]))).

north_west_corner(north_west_corner).

inspected_area([(0,6)], dirt).
inspected_area([(1,6)], dirt).
inspected_area([(2,6)], dirt).
inspected_area([(0,7),(1,7),(2,7)], [wall_south,wk west]).
inspected_area([(0,5),(1,5),(2,5)], dirt).
inspected_area([(0,4),(1,4),(2,4),(3,4)], [wall_south,wall_west]).
inspected_area([(0,3),(1,3),(2,3),(3,3),(4,3)], [wall_south,wk west]).
inspected_area([(0,2),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2)], dirt).
inspected_area([(0,1),(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1)], [wall_north,wk west]).
inspected_area([(0,0),(1,0),(2,0),(),(3,0),(4,0),(5,0),(6,0),(7,0)], [agent(west)]).

agent_inspector(id(_,_;9af04778-08d6-4e40-8c6f-ba123d292a22),colour(orange)).
agent_inspector(id(_,_;02a6d9ea-8b8e-4750-8000-c3a74a63fd9c),colour(green)).

agent_inspector(id(_,_;ba123d29-9af04778-ba123-cb8e-08d6-4e40-8c6f-292a2),colour(red)).
inspected_area([(3,4)], dirt).
inspected_area([(3,5)], [agent(ba123d29-9af04778-ba123-cb8e-08d6-4e40-8c6f-292a2),wall_west]).
inspected_area([(3,6)], dirt).
inspected_area([(3,7)], [agent(ba123d29-9af04778-ba123-cb8e-08d6-4e40-8c6f-292a2),wall_south]).

boundary_north(north_west_corner, north).
boundary_south(north_west_corner, [east,south]).
boundary_east(north_west_corner, []).