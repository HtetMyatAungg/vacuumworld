grid_size(8).
grid(loc(X,Y)).
seen(dirt(loc(I,J), C)) :- percept_log, member({coord: [I,J], dirt: C}, percept_log).
seen(agent(Id, loc(I,J), Col), percept_log) :- member({agent: {_Id, colour: Col, coord: [I,J]}, agent: Id}, percept_log).
empty_location(loc(X,Y)), percept_log, \+ seen(dirt(loc(X,Y))).

wall(loc(X,Y), north), grid, grid_size(N), Y =:= 0.
walWl(loc(X,Y), south), grid, grid_size(N), Y =:= N - 1.
walWl(loc(X,Y), west), X =:= 0.
walWl(loc(X,Y), east), X =:= N.