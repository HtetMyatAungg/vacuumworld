% Grid dimensions
grid_size(11,11).

% Dirt facts
dirt(1,4,orange).
dirt(3,3,orange).
dirt(3,6,orange).
dirt(5,7,orange).
dirt(7,5,green).
dirt(9,2,green).
dirt(9,7,green).

% Agent facts
agent(1,0,'d3af9897-9139-4ffe-8a15-2e9c6f06e71a',orange).
agent(5,0,'d6428e63-73b7-40a5-9cc9-ea3b5e61a86d',green).

% Boundary wall rules
wall(west,X,_Y) :-
    X =:= 0.

wall(east,X,_Y) :-
    grid_size(W,_),
    X =:= W-1.

wall(north,_X,Y) :-
    Y =:= 0.

wall(south,_X,Y) :-
    grid_size(_,H),
    Y =:= H-1.