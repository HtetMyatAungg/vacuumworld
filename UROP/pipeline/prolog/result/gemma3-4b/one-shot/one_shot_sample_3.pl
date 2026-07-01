grid_size(9).
grid(loc(_,_)) :- total_range(9).
seen(dirt(loc(_,Y),Colour)) :- Y in [0..8], Colour insitu[Colour].
seen(agent(Id, loc(_,Y), Colour)) :- Id in agent_ids, Y in [0..8], Colour insitu[Colour].
empty_location(loc(X,Y)) :- X in [0..8], Y in [0..8], not (seen(dirt(_, _, _)) or seen(agent(_, _, _))).
wall(loc(X,Y), north) :- X = 0, Y in [0..8].
wall(loc(X,Y), south) :- X = 8, Y in [0..8].
wall(loc(X,Y), east) :- Y = 0, X in [1..8].
wall(loc(X,Y), west) :- Y = 8, X in [1..8].