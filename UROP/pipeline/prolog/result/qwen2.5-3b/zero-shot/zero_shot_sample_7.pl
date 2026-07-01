grid(grid(0, [((0,6),w),((1,6),[]),((2,6),[])],[[(0,7),s,w],[1,7],s]),  
     grid(1,[],[[(0,4),e],[1,3],n],[],[(0,5),w]),
      grid(2,[],[],[],[]);  
grid(3,[],[],[[]]);  
grid(grid(N,[[a]]),
     list_borders(grid(N,A,B,C,D)));  
grid(grid(R,Y,N,L,E));    
:- list_domain(domains([N],[R],A,W,B,C,X), 
        domains([T,Y,O,W,R,L,E],
            A,S,Y,X,P,X), 
   domains(B,[],[],C),
   borders(borders(D)),
   domains(W,Z),
   domains(Z,E,K),
   list_borders(grid(R,N,P,Q,E)));  
grid(grid(N,[]),
     list_borders(grid(N,A,B,C,D)));
domain(domain(7,[S,W,S],E,W), 
        domain(6,
            S,W,X,Y,O));    
       domain(0,
             X,O,W));  
list_domain(domains([],Z,[A],[B],[C]),
           domains([E,K],[L]),
               [],[],
   [N]): lists_borders(grid(N,R,P,Q,L)).

grid(grid(N,[[b]]), 
     list_borders(grid(U,S,V,W)));    
grid(grid(R,Y,N,L,E));  
:- list_domain(domains([S,W],[X]), X,O,U);   
       domains([W,T,X],Y,W,S));  
   domain(0,
           T,X,Y,O),
   domain(N,[T],
         L, Y)).

domain(domain(T,V,U,W),U,W,S).    
list_domain(domains([],O,[A],[B],[C]),
                    domains([R,K],[L]),[],[],
                                         Z): list_borders(grid(U,R,P,Q,Z)).