grid_size(14).
grid(loc(X,Y)) :-
    X in 0..13,
    Y in 0..13.
empty_location(loc(X,Y)) :-
    grid(loc(X,Y)),
    not(percept(
      [{ "coord": [X,Y], "walls": [], "dirt": null, "agent": null }]
    ).
seen(agent(Id, loc(X,Y), Colour)) :-
    grid(loc(X,Y)),
    percept(
      [{ "coord": [X,Y], "walls": [], "dirt": null, "agent": id(Id) }],
      atom_chars(Id, Cs),
      append([Id], "_", Cs),
      ord_list_leq(ord_string(Cs, 97), Colour)
    ).
seen(dirt(loc(X,Y), Colour)) :-
    grid(loc(X,Y)),
    percept(
      [{ "coord": [X,Y], "walls": [], "dirt": Colour }],
      not(percept(
        [{ "coord": [X,Y], "walls": [], "dirt": null, "agent": _ }]
      )
    ).
seen(dirt(loc(X,Y), orange)) :-
    grid(loc(X,Y)),
    percept(
      [{ "coord": [X,Y], "walls": [], "dirt": orange }],
      not(percept(
        [{ "coord": [X,Y], "walls": [], "dirt": null, "agent": _ }]
      )
    ).
seen(dirt(loc(X,Y), green)) :-
    grid(loc(X,Y)),
    percept(
      [{ "coord": [X,Y], "walls": [], "dirt": green }],
      not(percept(
        [{ "coord": [X,Y], "walls": [], "dirt": null, "agent": _ }]
      )
    ).
seen(agent(_, loc(X,Y), orange)) :-
    grid(loc(X,Y)),
    percept(
      [{ "coord": [X,Y], "walls": [], "dirt": null }],
      not(percept(
        [{ "coord": [X,Y], "walls": [], "dirt": null, "agent": _ }]
      )
    ).
walldir(walkernortheast).
walldir(walkersoutheast) :- walldir(walkernortheast).