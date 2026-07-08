Section A — Translation facts:
grid_size(15).
grid(X,Y) :-
    X between 0,14,
    Y between 0,14,
    grid_member((X,Y)).
dirt(X0:Y0, Colour) :-
    grid_member((X0:Y0)),
    \+ member(agent(_,_), (X0:Y0);empty((X0:Y0))),
    append(DirtList, [colour(Colour)], Dlist2),
    Dlist2 = (X0:Y0).
agent(Id:X0:Y0, Colour) :-
    grid_member((Id,X0:Y0)),
    \+ member(dirt(_,_,_),(Id,X0:Y0);empty((Id,X0:Y0))),
    append(AgentList, [colour(Colour)], Alist2),
    Alist2 = (X0:Y0).
empty(X0:Y0) :-
    \+ member(dirt(_,_,_),(X0:Y0);agent(_,_(X0:Y0))).

Section B — Wall rules:
wall(Z0,Y, left) :-
    Z0 > 0,
    wall((Z0-1), Y).
wall(Z0,Y, right) :-
    Z0 < 7,
    wall((Z0), Y).
wall(Z0, Y0, up) :-
    Y0 > 0,
    wall((Z0-2), Y0,top).
wall(X0,Z, top) :-
    X0 =< 6,
    wall((X0), Z).
wall(X0,Z, bottom) :-
    Y0 < 7,
    wall((X0,Y0+1)).

dirt(0,6,orange).  
dirt(3,4,yellow).  
dirt(7,6,orange).  
dirt(6,5,green).  
dirt(0,7,blue).  
dirt(1,2,red).  
dirt(4,3,magenta).  
dirt(7,2,orange).  
dirt(2,2,grey).  
dirt(0,8,violet).  
dirt(3,3,green).  
dirt(5,3,yellow).  
dirt(7,7,orange).  
dirt(6,3,blue).  
dirt(0,9,magenta).  
dirt(1,4,red).  
dirt(4,4,magenta).  
dirt(7,4,orange).  
dirt(2,3,grey).  
dirt(0,10,violet).  
dirt(2,4,blue).  
dirt(5,4,yellow).  
dirt(7,5,orange).  
dirt(6,8,magenta).  
dirt(1,8,green).  
dirt(3,2,red).  
dirt(5,2,yellow).  
dirt(6,9,grey).  
dirt(1,7,brown).  
dirt(4,9,violet).

agent(a0,a6,green).  
agent(b3,a4,yellow).  
agent(c7,a6,orange).  
agent(d6,a8,green).  
agent(e0,a7,green).  
agent(f1,a2,red).  
agent(g4,a3,magenta).  
agent(h7,a6,orange).  
agent(i0,a9,blue).  
agent(j3,a5,violet).  
agent(k5,a3,grey).  
agent(l6,a9,violet).