coordinate(grid(0,0)).
coordinate(grid(X,Y)) :-
    (   X == 7, Y == 7 ;
        X > 0, Y > 0,
        grid((X-1,Y)),
        grid((X,Y-1).
    
% Walls per coordinate with their location:
walls(grid(0,_); walls(grid(_,6));
walls(grid(_,-3)).

% Agents and dirt locations:
agent(grid(AgentId),grid(X,Y)) :-
    atom_codes(AgentId, Codes),
    \+ (dirt(grid(Dist)), Dist == grid(X,Y)).
dirt(grid(Value),grid(X,Y)) :- nonvar(Value), Value != null.
% Boundary wall specification for each row and column index:
walls(grid(_,-3)).
walls(grid(_,7)).
walls(grid(-2,_)).
walls(grid(8,_)).