section_a(1).
grid_size(_N).
grid(loc(X, Y)) :- between(0, N-1, X), between(0, N-1, Y).
seen(dirt(loc(X,Y, Colour)), Id) :-
  seen(agent(Id, loc(X,Y)), _),
  dirty(Y, Colour).

empty_location(loc(X,Y)).

section_b_clause(wall(_X, north)).
section_b_clause(walk(_X, south)).
section_b_clause(walk(_X, east)).
section_b_clause(walk(_X, west)).