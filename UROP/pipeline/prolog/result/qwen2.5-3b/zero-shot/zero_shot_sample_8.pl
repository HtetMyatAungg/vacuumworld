grid(N) :-
    N is 8.

walls(W) :-
    W = [e|Ns],
    walls(Wells),
    Walls \= e,
    append(walls(S), Wells, S).

walls([]).
walls([W|Ws]) :-
    walls(Ws),
    (   W == n
    -> Next is W + 1
    ;   Next is W - 1
    ),
    N <- Next.


observe(N, Pos, Observed) :-
    grid(N),
    nth0(pos(Pos), [], [Observed|_]).

wall_at(edge(WallPos1, EdgeWalls), Coord, WallPos2, Direction) :-
    edge(Coord, Walls),
    memberchk(WallPos1, Walls),
    WallPos2 is WallPos1 - (Direction \= e; 0, Direction \= n; -1, Direction \= s; 1).

detect_edge(Pid, Pos, XCoord, YCoord) :-
    observe(grid_sz, pos(Pos), [wall(Coord)|_] ),
    Coord = C,
    wall_at(edge(North, [n|Ws]), C2, _Nw, e),
    atom_number(NY, XY),
    NY is Y+1,
    detect_edge(Pid, (C2,Y), XCoord+NW, NY),
    (   member(Ws, [sw;se])
    -> wall_at(edge(South,Ws), C3, Nw, s)
    ;   (member([e|_],Ws), north(C3); member([w|_],Ws), south(C3)),
        atom_number(NY2, XY),
        NY2 is Y-Ni,
        detect_edge(Pid, (C3,NY2), XCoord+Nw, NY)
    ).

detect_edges(Pos) :-
    wall_at(edg(CoordPos1, [e|Ews]), C2, Nw, e),
    member(Ews, [sw;se]),
    C2 = C,
    detect_edge(_Pid0, (C,NY), X, Y),
    atom_number(XI, Xi),
    XI is X-Nw,
    wall_at(edg(CoordPos2, Ews), C3, Nw, s),
    member(Ews2, [se;ne]),
    member(Ews, [sw;ne]),

detect_grid(Pos0) :-
    detect_edges(pos(Pos0)).