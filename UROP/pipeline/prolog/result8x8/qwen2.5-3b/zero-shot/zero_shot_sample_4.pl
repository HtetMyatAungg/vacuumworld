grid(W,N) :-
    between(0,N,Cols),
    listof(Cols).

listof([H|T],N) :-
    length(H,L), L > 0,
    N1 is N - 1,
    member(N1,T).

content_at(coord(X,Y), grid(Dirt,Size), Dirt2) :-
    within_bounds(Size, X, Y),
    content_at(coord(X,Y), grid(Dirt,Snd)),
    nonvar(Dirt2),
    Dirt2 = Snd.

within_bounds(size(N), Size, N).
within_bounds(_, _ , _) :-
    retractall(between(0,_,_)).

boundary_w(W) :-
    (X1 is M-0, within_bounds(M, X1, Y1), W1 is W+2, grid(W1,Y1,Dirts), member(Dirt,[W1|L],Dirts); emptylist(L)),
    write(w),write(X1), write(Y1), write('W'),nl,
    (X0 is N+0 , within_bounds(N, X0, Y2), grid(N,Y2,Dirts), member(Dirt,[N,W1|L],Dirts); emptylist(L)),
    write(X0), write(Y2), write('W'),nl.

boundary_s(W) :-
    (Y1 is 0 , within_bounds(0, X2, Y1), N1 is W+0, grid(N1,Y1,Dirts), member(Dirt,[W,N1|L],Dirts); emptylist(L)),
    write(N1),write(X2),write('N'),write('W'),nl,
    (Y2 is M , within_bounds(M, X3, Y2), N2 is W-0, grid(N2,Y2,Dirts), member(Dirt,[N2,W|L],Dirt); emptylist(L)),
    write(X3), write(Y2), write('N'),write('W'),nl.

boundary_e(W) :-
    (X1 is M , within_bounds(M, X1, Y3), N1 is W+0, grid(N1,Y3,Dirts), member(Dirt,[X1,N1|L],Dirts); emptylist(L)),
    write(X1), write(Y3), write('E'),nl,
   (X2 is 1 , within_bounds(1, X2, Y3), N2 is W-0, grid(N2,Y3,Dirts), member(Dirt,[N2,X1|L],Dirt); emptylist(L)),
    write(X2), write(Y3), write('E'),nl.

boundary_n(W) :-
    (Y1 is 0 , within_bounds(0, X4, Y1), N1 is W+0, grid(N1,Y1,Dirts), member(Dirt,[W,N1|L],Dirts); emptylist(L)),
    write(X4),write(Y1),write('N'),write('E'),nl,
   (Y2 is M , within_bounds(M, X4, Y2), N2 is W-0, grid(N2,Y2,Dirts), member(Dirt,[X4,N2|L],Dirt); emptylist(L)),
    write(X4),write(Y2),write('N'),write('E'),nl.

content_at(coord(X,Y), grid(_,Size), Dirt) :-
    within_bounds(Size, X, Y),
    listof([Dirt|TndSnds],Size),
    nonvar(Dirt),
    Dirt = TndSnds.