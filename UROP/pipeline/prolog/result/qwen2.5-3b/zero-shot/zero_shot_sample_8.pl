grid(grid(_X=cell(\_Z,X), _Y))(NORTH, SOUTH, WEST, EAST) :-
    (X in 0..7), (Y in 0..7).

north_boundary(grid(NORTH, _)).

south_boundary(grid(_NORTH, SOUTH)).

east_boundary(grid(WEST, _EAST)).

west_boundary(grid(_WEST, WEST)).

% Detecting content at a specific location
content_at(grid(X=cell(\_Z,X), _, dirt(Content)), Content).
content_at(grid(_, Y=cell(\Y,_), agent(Id)), Id).
content_at(grid(North, South, West, East, _AgentType))(agent(Id), Id) :-
    member(agent(Id, AgentType)).

empty_cell(grid(WEST, cell(\_W,W))), X != W,
                            not(X = 0).

% Check for blocks in a row
north(BLOCKS, NORTH, BLOCKS1) :-
    member(row(NORTH, [X|_]), Rows),
    \+ member(block(X, _), Rows),
    Ys = maplist(Y, Column)=column(Column),
    Blocks is NORTH + 1.

south(SOUTH, SOUTH_BLOCKS) :- south_boundary(grid(_, SOUTH)).

east(EAST, EAST_BLOCKS) :- east_boundary(grid(NORTH, EAST)).
west(WEST, WEST_BLOCKS) :-
    \+ member(west(WEST, _), Rows),
    BLOCKS is EAST + 1.