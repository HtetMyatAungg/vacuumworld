neighbor_bounds(Ns,C9) :-
    grid(X9s,C9)|-(X9s = [],[north,east,west,south],[south]),
    C9=X9s-C8),
    Ns = [e_s,-5] ;
    neighbor_bounds(Ns,C8).

grid([],Cn).
grid([(X,Y)|L],Cc) :-
    grid(L,Cn),
    (Cc \= north -> (Cc \= south ; X = 0); 
     Cc \= west ; Y = 0; 
     _ ),
    neighbor_bounds(Nbs,X),
    append(Cn,[Nbs|Ns],Cc).

neighbor_bounds([e_s],C9) :- C9 \= N.
neighbor_bounds([w_n],C9) :- C9 \= W.
neighbor_bounds([n_e],C9) :- C9 \= E.
neighbor_bounds([w_se],C9) :- C9 \= S.
neighbor_bounds([e_w],C9) :- C9 \= W.
neighbor_bounds([w_n],C9) :- C9 \= N.
neighbor_bounds([w_se],C9) :- C9 \= S.
neighbor_bounds([n_e],C9) :- C9 \= E.
neighbor_bounds([w_w],C9) :- C9 \= W.
neighbor_bounds([w_n],C9) :- C9 \= N.
neighbor_bounds([w_se],C9) :- C9 \= S.
neighbor_bounds([e_s],C9) :- C9 \= W.
neighbor_bounds([n_e],C9) :- C9 \= E.
neighbor_bounds([n_w],C9) :- C9 \= W.
neighbor_bounds([n_n],C9) :- C9 \!= N.

neighbor_bounds([w_n],N).
neighbor_bounds([n_e],E).
neighbor_bounds([e_s],S).
neighbor_bounds([w_se],W).