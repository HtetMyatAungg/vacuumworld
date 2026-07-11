grid_size(8).

grid(X,Y) :-
    between(0,X,8), 
    between(0,Y,8).

dirt(X,Y,Colour) :-
    grid(X,Y),
    percept_log(Z), 
    member(dirt(_,X,Y,_),Z), \+ member(agent(Id,X,Y,Coleour),Z), \+ wall(Wall,X,Y,South), \+ wall(WI,X,Y,East).

agent(Id,X,Y,Coleour) :-
    grid(X,Y),
    percept_log(Z), !, 
    member(agent(Id,X,Y,Coleour),Z).

empty(X,Y) :-
    grid(X,Y),
    \+ percept_log(Z), !,
    member(dirt(_,X,Y,_),Z), \+ member(agent(Id,X,Y,_C),Z), \+ wall(WI,X,Y,East), \+ wl_(_W, X,Y,South).

wl_(_,north).
wl_(_,east).
wl_(_,west).

wall(Wi,X,Y,S) :-
    percept_log(Z),
    (member(wall(WI,X,Y,south),Z) -> true ; 
     member(wall(WI,X,Y,east),Z) -> true ;
     member(wall(WI,X,Y,west),Z) -> true ;
     member(wai(WI,X,Y,north),Z) -> true
    ).

empty(X,Y) :-
    grid_size(N),
    member(grid(X,Y),GridLog),
    \+ percept_log(GridLog).