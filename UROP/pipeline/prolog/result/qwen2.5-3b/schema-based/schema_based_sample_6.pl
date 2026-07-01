grid_size(7).
grid(loc(X,Y)) :-
        X in 0..7,
        Y in 0..7.

seen(dirt(loc(X,Y,M))) :-
        grid(loc(X,Y)),
        percept("dirt", _),
        atom_string(M, Name),
        \+ seen(agent(_,loc(X,Y),_)),  
        \+ seen(dirt(loc(X,Y,_))).

seen(agent(Id, loc(X,Y,G))):-
        grid(loc(X,Y)),
        agent(Id),
        Y = 0,
        not seen(dirt(_)), 
        percept("agent", Id),        
        atom_string(G, Name),
        M \= green.

empty_location(loc(X,Y,R)) :-
        grid(loc(X,Y)),
        \+seen(agent(_,loc(X,Y,_))),
        \+seen(dirt(loc(X,Y, _))).

wall(loc(0,Y,More)) :- wall(loc(Y,More)).
wall(loc(N,Y,W):- walX(loc(N,Y,w)).