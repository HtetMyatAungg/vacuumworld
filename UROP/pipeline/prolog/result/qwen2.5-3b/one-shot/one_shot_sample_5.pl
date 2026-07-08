grid_size(12).

grid(X,Y) :-
    floor_value_between_zero_to_11_including(X),
    floor_value_between_zero_to_11_including(Y).

dirt(X,Y, Colour) :-
    grid(X,Y),
    \+ agent(_,X,Y),
    \+ null(Colour),
    non_empty_neighbouring_squares_dirt_with_same_colour_or_only_non_empty(X,Y,_SameColourOrNone).

agent(Id,X,Y,Colour) :-
    grid(X,Y),
    atom_number(Id,IdNum),
    non_null_id(IdNum),
    member(agent(IdNum,X,Y,Colour),_ObservationEvents).

empty(X,Y) :-
    grid(X,Y),
    null(dirt(_X,_Y,_Col)),
    null(agent(_,_,Y,_Col)).

null(Z) :- var(Z).
grid_size(2).