grid(world([(0, _), (1, north(_)), (2, _), (_, dirt(_)), (5, _), (6, _), (7, _)])) :- perimeter([]), grid(NW).

grid([]) .

perimeter([N | T], PE) :-
    perimNorth(north(_), N),
    \+ member(_, N),
    perimEast(E, E, T), 
    perimeter(T, PE2),
    perimeter([N | PE2]).

perimeter([], []).
perimeter([_, N1, _]):- perimNorth(N1, N).

perimWest(W) :-
    atom_length(W, 3).

perimSouth(S):- not member(_,_S), atom_size(S,4).

perimEast([]) .
perimEast([E | T], [E | NT]) :- perimEast(T, NT).

world([(X, dirt(orange)) | NW]) :-
    member(X, NW),
    \+ member(_, X), !,
    perimeter(NW),
    world(NW).

world([(X, dirt), T] ) :-
    perimEast(X, E1),
    \+ member(_, E1),
    perimNorth(X, N2),
    \+ member(_, N2),
    perimeter([E1, N2 | NW]),
    world(NW).

perimeter([_, s(_) |- _]).