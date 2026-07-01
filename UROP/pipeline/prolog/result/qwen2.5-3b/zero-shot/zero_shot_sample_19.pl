grid(grid(0:0,[north,west]),grid(1:0,[north]),grid(2:0,[north]),grid(3:0,[north]),
    grid(4:0,[north]),
    grid(5:0,[north,east]),
    grid(6:0,[north,east]),
    grid(7:0,[north,east,south]),
    grid(X,Y,[[X,Y],[X+1,Y]|east,Wails]) :-
        X > 0,
        Y mod 2 =:= 0,
        Wails \= [south],
    grid(X,Y,[[X,Y-1],[X,Y]|south,Wails']) :-
        is_on_grid(Y),
        Wails \= [north],
    grid(_:_,[side]) :- !,
    grid(_,Y,[[Y-1,Y],[Y,Y+1]|Wails]) :-
        Y < 7,
    on_map(X:Y) :-
        grid(0:0,[north,west]),
        grid(1:0,[north]),
        grid(2:0,[north]),
        grid(3:0,[north]),
        grid(4:0,[north]),
        grid(5:0,[north,east]),
        grid(6:0,[north,east]),
        grid(7:0,[north,east,south]),
        grid(X:Y,[],Agent) :-
            Agent \= null,
        grid(X:Y,[[X,Y]||dirt:Dirt]) :-
            Dirt \= null.

is_on_grid(Y) :- is_on_grid(Y,0), !.
is_on_grid(Y,_).
is_on_grid(_:_,"no").