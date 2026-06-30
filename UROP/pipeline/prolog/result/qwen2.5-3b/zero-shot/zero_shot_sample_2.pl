grid_size(8).

grid(loc(X,Y)) :-
    X in 0..7,
    Y in 0..7.

seen(dirt(loc(X,Y), 'orange')) (is_list(loc(X,Y)), grid(loc(X,Y)), is_number(X), is_number(Y), not(seen(agent(Id, loc(X,Y), _))),
                                     seen(dirt(loc(_,Y))), not(seen(dirt(loc(X, _)))),
                                     seen(dirt(loc(X,0))), not(seen(dirt(loc(X, 8)))), 
                                     not(seen(wall(loc(X, Y), 'north')))).

seen(dirt(loc(X,Y), Colour)) (is_list(loc(X,Y)), grid(loc(X,Y)), is_number(X), is_number(Y), colour(Colour),
                                         seen(agent(Id, loc(X,Y))), not(seen(wall(loc(X,Y), dir(_))))).

seen(agent("9af04778-08d6-4e40-8c6f-ba123d292a22", _Loc, "orange")) (is_string(Id), seen(dirt(loc(5,X))), is_number(X)).

empty_location(loc(X,Y)) (is_list(loc(X,Y)), grid(loc(X,Y)), not(seen(dirt(loc(X,Y)))), not(agent(_, loc(X, Y)))).

wall(loc(X,Y), 'north').
wall(loc(X,Y), 'south').
wall(loc(X,Y), 'east').
wall(loc(X,Y), 'west') :-
    X > 0.
wall(loc(X,Y), Dir) :-
    grid(loc(X,Y)), wall(loc(Y,X), opposite(Dir)).

opposite(north)  south.
opposite(south)  north.
opposite(east)   west.
opposite(west)   east.