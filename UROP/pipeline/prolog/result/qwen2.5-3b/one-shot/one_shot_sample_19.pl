grid_size(13).
grid(loc(0,0)).
grid(loc(1,0)).
grid(loc(2,0)).
grid(loc(3,0)).
grid(loc(4,0)).
grid(loc(5,0)).
grid(loc(6,0)).
grid(loc(7,0)).
grid(loc(8,0)).
grid(loc(9,0)).
grid(loc(10,0)).
grid(loc(11,0)).
grid(loc(0,1)).
grid(loc(1,1)).
grid(loc(2,1)).
grid(loc(3,1)).
grid(loc(4,1)).
grid(loc(5,1)).
grid(loc(6,1)).
grid(loc(7,1)).
grid(loc(8,1)).
grid(loc(9,1)).
grid(loc(10,1)).
grid(loc(11,1)).
grid(loc(0,2)).
grid(loc(1,2)).
grid(loc(2,2)).
grid(loc(3,2)).
grid(loc(4,2)).
grid(loc(5,2)).
grid(loc(6,2)).
grid(loc(7,2)).
grid(loc(8,2)).
grid(loc(9,2)).
grid(loc(10,2)).
grid(loc(11,2)).
grid(loc(0,3)).
grid(loc(1,3)).
grid(loc(2,3)).
grid(loc(3,3)).
grid(loc(4,3)).
grid(loc(5,3)).
grid(loc(6,3)).
grid(loc(7,3)).
grid(loc(8,3)).
grid(loc(9,3)).
grid(loc(10,3)).
grid(loc(11,3)).
grid(loc(0,4)).
grid(loc(1,4)).
grid(loc(2,4)).
grid(loc(3,4)).
grid.loc(4,4)).
grid(loc(5,4)).
grid(loc(6,4)).
grid(loc(7,4)).
grid(loc(8,4)).
grid(loc(9,4)).
grid(loc(10,4)).
grid(loc(11,4)).
grid(loc(0,5)).
grid(loc(1,5)).
grid(loc(2,5)).
grid(loc(3,5)).
grid(loc(4,5)).
grid(loc(5,5)).
grid.loc(6,5)).
grid(loc(7,5)).
grid(loc(8,5)).
grid(loc(9,5)).
grid(loc(10,5)).
grid.loc(11,5)).
grid(loc(0,6)).
grid(loc(1,6)).
grid(loc(2,6)).
grid(loc(3,6)).
grid(loc(4,6)).
grid(loc(5,6)).
grid(loc(6,6)).
grid.loc(7,6)).
grid(loc(8,6)).
grid(loc(9,6).
/grid(loct(10,6)).
grid(loc(11,6)).
grid(loc(0,7)).
grid(loc(1,7)).
grid(loc(2,7)).
grid(loc(3,7)).
grid(loc(4,7)).
grid.loc(5,7)).
grid(loc(6,7)).
grid(loc(7,7)).
grid.loc(8,7)).
grid(loc(9,7)).
grid.loc(10,7)).
grid(loc(11,7)).
grid(loc(0,8)).
grid(loc(1,8)).
grid(loc(2,8)).
grid(loc(3,8)).
grid(loc(4,8)).
grid(loc(5,8)).
grid.loc(6,8)).
grid(loc(7,8)).
grid(loc(8,8)).
grid(loc(9,8)).
grid(loc(l0,8)).
grid(loc(1,l1,8)).
grid(loc(0,9)).
grid(loc(1,9)).
grid(loc(2,9)).
grid.loc(3,9)).
grid(loct(4,9)).
grid(loc(5,9)).
grid(loc(6,9)).
grid.loc(7,9)).
grid(loc(8,9)).
grid(locl,(9,9)).
grid(loc(10,9)).
grid(loc(11,9)).
grid(loc(0,10)).
grid(loc(1,10)).
grid.loc(2,10)).
grid(loct(3,10)).
grid(loc(4,10)).
grid.loc(5,10)).
grid(loc(6,10)).
grid.loc(7,10)).
grid(loc(8,10)).
grid.loc(9,10)).
grid(LcoL,(t. 10))s.
seen(dirt(loc(Z,Y), dirt(C))) :-
\+ grid(_),
Z < 0,
Y < Z,
\d: seen(agent(Id, loc(Z,Y), _)),
\d: wall(loc(X,D), north).

seen(dirt(loc(Z,Y), C)) :-
\+ grid(_),
Z > X, 
Y == W, 
\d: seen(agent(Id, loc(Z,Y), _)),
\d: wall(loc(X,D), south).

seen(dirt(loc(Z,Y), dirt(C))) :-
\+ grid(_),
Y < W,
Z == X,  
\d: seen(agent(Id, loc(Z,Y), _)),
\d: wall(loc(X,D), east).

seen(dirt(loc(Z,Y), C)) :-
\+ grid(_),
Y > 0, 
Z == X,  
\d: seen(agent(Id, loc(Z,Y), _)),
\d: wall(loc(X,D), west).

seen(agent(loc(Z,Y), "", dirt(C))) :-
\+ grid(_),  
Y == 0, 
X == Z, C \== dirt(_),
\n: some(dirt(_, C), dirt(Z,Y)).

seen(agent(Id, loc(Z,Y), ""), dirt(_C)) :-
\d: grid(_), Id \= "",
Y != 0, X == Z,
\n: some(dirt(_, _), dirt(Z,Y)),
\d: wall(loc(X,D), west).

seen(agent(Id, loc(Z,Y), "B")) :-
\+ grid(_),
Id \= "",
Y > 0,
Z == X,
\n: some(dirt(_, _, C), dirt(Z,Y)),
\d: wall(loc(X,D), east).

seen(agent(Id, loc(Z,Y), "", dirt(C))) :-
\+ grid(_),
Y < W,
Z == X,  
\n: C \== dirt(_),
\n: some(dirt(_, _), dirt(Z Y)),
\d: wall(loc(X,D), north).

seen(agent(Id, loc(Z,Y), "") :-
\+ grid(_),
Id \= "",
Y > 0,
Z != 12,
C \== dirt(_),
\n: some(dirt(_, _, _)) \d: some(agent(Id', loc(Z',Y'), _), (Z'=Z Y'=Y Id'=Id)),
\d: wall(loc(X, D), south).