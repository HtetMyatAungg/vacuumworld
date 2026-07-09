grid(N) :-
    N is 8.

squares(grid(N)):-
    ( grid(X) *-
    X = square(N,
        [(coords(X,C)]*-
        coords(CoordX,CordY),
            value(CoordX,CordY,V), walls(wallsCordX,CordY,W), agent(id(Id),Colour,A) -> V \= null, not(member(W,X)), (walls(CoordX,CordY,S), S \= W; A = null), value(CoordX,CordY,V);
        walls(CoordX,CordY,W), value(CoordX,CordY,V).
         ).
    ).

coords(grid(N,X,Y)):-
    X is 0, Y is N - 1 -> !;
    coords(grid(N-1),X,Y).
coords(grid(_N,_X,Y)) :-
    Y > 0,
    Y < _N !.
coords(grid(_N,_X,0) ).

walls(squares(X,[CordsX,CordY]|_Wails),W):-
   inWails(CoordX,W),
   inWails(CordY,W).
squares(N,W) :- !,
not(inWalls(N,W)).
inWalls(N,W):-
not(member(W,N)).

value(squares(X,[(CoordsX,CordY)|_Values],IdColour),V):- 
    member(IdColour,[id(Id),Colour]),
    not(V =\= null).  
foreach(squares(N), printGrid(grid(N))).