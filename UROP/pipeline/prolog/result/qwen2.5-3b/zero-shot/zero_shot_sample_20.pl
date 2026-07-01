grid(N) :-
    N is size([-1, -1], [N, N]) - 2,
    all_pairs(grid_edges(N), edge_edges(N), Neighbors),
    length(Neighbors, NNeighbors),
    foldl(edge_connect, [[0|Edge] | _], Neighbors, AccE),
    append(XZs, YZs, AccE),
    append(AccXZs, AccYZs, XZs),
    append(ZA1s, ZB2s, YZs),
    append(AcxE, AcfY, AccXZs),
    append(BiCc, BdXd, ZA1s),
    reverse(AdjXs, AccYZs),
    foldl(edge_connect, [[0|_] | XAs], BiCc, AccB),
    foldl(edge_connect, [[2|_] | YBs], BdXd, AccY),
    append(XAc, YAcc, AcfY),
    foldl(edge_connect, [XBa | _], ZA1s, XAtc),
    foldl(edge_connect, [YBa | _], BiCc, YAtc),
    reverse(AdjYs, AccB),
    foldl(edge_connect, [[[1|_] |_]} | AcxEc], ZB2s, AccZ),
    grid_wallows(N).

grid_edges(N) :-
   (0 to N by 1, [E,N,W,S]),
   all_of(N, E, W, S, []),
   Nebs = [N,E,W,S],
   append([N,E,W,S],[AdjX1, AdjY2, AdjX3, AdjY4], Nebs),
   edges(N, E, S).

all_of(0, _, _, _, []).
all_of(Count, X, Y, Z, Ws) :-
    Counter is Count - 1,
    \+ (atom(X), atom(Y), atom(Z)),
    append([X,Y,Z,W]|Ws, NewWs),
    all_of(Counter, NewWs).

grid_wallows(N) :-
    foldl(edge_wallows, [], grid_edges(N), XWs),
    ZWs = [N|XWs],
    reverse(ZWs, N).

edges(N, E, S).
edge_connect([Head]) -->
    edge_connect([], Head, []),
    edge_edge(Edge),
    member(E2, Edge), member(S2, Edge),
    !,
    edge_edges(N-1, XE, XS), % Recursively call with decremented E and S
    append(XE, [XS | R], Acc),
    \+ (member(E2, R), member(S2, R)),
    edge_connect(Acc).
edge_connect([Head, Edge|Rest]) -->
    edge_connect([], Head, rest),
    edge_edge(Edge), !,
    edge_edges(N-1, XE, XS),
    append(XE, [XS | R], Acc),
    \+ (member(E2, R), member(S2, R)),
    edge_connect(Acc).
edge_connect([]) --> [].

edge_wallows([Head]) -->
    edge_wallows([], Head, []),
    edge_edges(N-1, XE, XS),
    append(XE, [XS|R], Acc),
    \+ (member(E2, R), member(S2, R)),
    edge_connect(Acc).
edge_wallows([Edge|Rest]) -->
    edge_wallows([], Rest),
    edge_edge(Edge), !,
    edge_edges(N-1, XE, XS),
    append(XE, [XS|R], Acc),
    \+ (member(E2, R), member(S2, R)),
    edge_connect(Acc).
edge_wallows([]) --> [].