grid_size(11, 11).

agent(agent_orange, 1, 0).
agent(agent_green, 5, 0).

dirt(orange, 1, 4).
dirt(orange, 3, 3).
dirt(orange, 3, 6).
dirt(orange, 5, 7).
dirt(green, 7, 5).
dirt(green, 9, 2).
dirt(green, 9, 7).

wall(X, Y, north) :-
    grid_size(_, _),
    Y =:= 0.
wall(X, Y, south) :-
    grid_size(_, MaxY),
    Y =:= MaxY.
wall(X, Y, west) :-
    grid_size(_, _),
    X =:= 0.
wall(X, Y, east) :-
    grid_size(MaxX, _),
    X =:= MaxX.

location_content(X, Y, agent(ID)) :-
    agent(ID, X, Y).
location_content(X, Y, dirt(Color)) :-
    dirt(Color, X, Y).
location_content(X, Y, empty) :-
    \+ agent(_, X, Y),
    \+ dirt(_, X, Y).