grid_size(9).

grid(X, Y) :- XYwithinGrid(X, Y), \+ dirt(X, Y, _), \+ agent(_X, Y, _Cd), \+ wall(NW, X, Y), \+ \+ wall(SE, SW, X, Y), \+ \+ agent(SE, _, _), \+ \+ agent(W, _, _), \+ \+ wall(SS, X, Y), \+ \+ \+ dirt(SS, _, _).

dirt(X, Y, Cd) :- XYwithinGrid(X, Y), \+ grid(X, Y), \+ agent(_X, Y, _C_), \+ empty(X, Y).

agent(Id, X, Y, Cd) :- XYwithinGrid(X, Y), agent_at(Id, X, Y, Cd), \+ dirt(X, Y, Cd).

empty(X, Y) :- XYwithinGrid(X, Y), \+ grid(X, Y), \+ agent(_X, Y, _C_), \+ dirt(X, Y, _Cd), \+ wall(NW, X, Y), \+ \+ wall(SE, SW, X, Y), \+ \+ agent(SE, _, _), \+ \+ agent(W, _, _), \+ \+ wall(SS, X, Y), \+ \+ \+ dirt(SS, _, _).

NX is X + 1.
NY is Y + 1.

agent_at(Id, X, Y) :- grid(X, Y), XYwithinGrid(X, Y), agent(Id, X, Y, _Cd).

wall(North, X, _) :- North == 1.

wall(East, X, _) :- X = N - 1.

wall(South, X, _) :- X = M, M > N-1.

wall(West, X, _) :- X == 0.