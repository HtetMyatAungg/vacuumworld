grid(16).

coords(Grid) :-
    grid(_Height),
    maplist(row(Grid),0,_N),
    length(Coords,_N).

row([], _N).
row([[X,Y]|Coords],_N) :-
    Y2 is Y+1,
    row(Coords,[X|Y2,_N]).

data(grid(Grid)) :-
    coords(Grid), wallSides(North,East,NW,NE,SE,SW,Walls),

    findall(D,R,\+dirt(R),Dirts),
    length(Dirts,L4),

    findall(A,R,\+agent(R),AgentsFromEmpty),
    sort(AgentsFromEmpty,Ags),
  
    append(Coords,[A|_],
            [Ags|[]]).

data(grid([])) :- !.
data(grid([H|T],[]) :-      
    coords(H), 
    wallSides(North,East,NW,NE,SE,SW,Walls),

    data(walls(Walls)),
    append(_Coords,[Nwest,_L1],
            [_L2,Ags|_L3]),

    member(X,Walls)->  
        wall(X,N)-> data(1)
                , N2 is X+1, wall(N2,N), data(0).
wall(E,S)   ->  W = E,\+W = S, W.
wall(S,X)   ->  W = S,\+W = X, W.

agent(_,Y,_Id) :- findall(Z,R,\+\-agent(R),_[Z|_]), N is Z+1, agent(N,Z), data(0).

agent(Id,Y,N)->  
    length(Ags,L),
    member(N,Ags),
    L2 is L-1,
    Ags = [N|L2].