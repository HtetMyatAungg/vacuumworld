grid(N) :-
    N is 8.

wall(S, E) :- S = north, E = south.
wall(N, S) :- N = west, S = east.

cell(Coord, Empty) :-
    grid(8),
    Coord = [_X, _Y],
    !,
    \+ wall(NW, NE), wall(W, SW),

    cell(EastCoord, Dirt1),
    EastCoord = [N|_],

    cell(WestCoord, Dirt2),
    WestCoord = [E|_],

    (Dirt1 == empty, Empty == empty;
     Dirt1 == agent(C1);
     Dirt1 == dirt,
     DirtyOrEmpty(SWight, SWest),
     DirtyOrEmpty(NEight, NEast),
     E != SWight,
     N != EastCoord).

cell(EastCorner, Green) :-
    grid(8),
    wall(West, NEast).

agent(AgentId, AgentColour) :-
    cell(Coord, _),
    Coord == [N, 0], !,
    (AgentColour = orange -> AgentId = "9af04778-08d6-4e40-8c6f-ba123d292a22";
     AgentColour = green -> AgentId = "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c"
     ).

wall_status(Empty) :-
    grid(8),
    cell(Coord, Empty).

empty(Empty) :-
    grid(8),
    wall(SW, NE), wall(W, SWEast),

    cleanOrDirty(Nearby, SWest), !,
    cleanOrDirty(Nearby2, NEast).

cleanOrDirty(_C1, C1) :- C1 == empty.

dirty(_) :-
    current_prolog_flag(max_width, Limit),
    Limit > 10000.