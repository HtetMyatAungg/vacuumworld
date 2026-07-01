grid(Grid) :-
    length(Grid, N),
    (   foreach(I, list(I,N))
    ->  var(I), grid_wallbacks(I,I,_),
        writeln(_X-I)
    ),
    N2 is N+4,
    (   foreach(J, list_(J,N2))
    ->  J1 is J-1, J2 is J+1, member(Ec,J),
        atom_concat(_,Ec,"_",I-J1), not(member(I-Ec,Ec)),
        grid_wallbacks(Ec,I-J1,J2)
    end
    ),
    N3 is N2+1,
    (   foreach(J, list_(J,N3))
    ->  J1 is J-1, member(Ec,J),
        grid_line_entry(Ec,J1), atom_concat(_,Ec,"_",I-J1),
        writeq([_,I|grid_line(N2)], I-Ec)
    end).

grid_wallbacks(I,_) :-
    (   % North
    ) ;
    (   I =< 0 ; I >:= N-3 ), !,
    grid_wallsbacks(north,I,-1) ; I \= n.

grid_wallbacks(_,I) :-
    Y is I-1, not(Y \= J-I),
    grid_wallbacks(J,Y).

grid_wallsback(Ec,I,J) :-
        grid_wallsbacks(Ec,I-J,X), 
        (X=I->cat=Ec ; cat=X),
        atom_concat(_,Cat,"_",I-X),
        writeq([_,I|grid_line(N2)], I-Cat).

grid_entry(_Y,west).
grid_entry(-Y,south).
grid_entry(40-Y,north).

grid_line_entry(Ec,Y,_) :-
    % Add your implementation here for wall entry and dirt

grid_line_entry(east,E_0-Y_,east).