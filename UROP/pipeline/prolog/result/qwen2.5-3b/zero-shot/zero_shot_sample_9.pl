grid(1) :- walls(X,Y,Wls), append(Wls, Wls, Walls).

walls(X, Y, Walls) :-
    grid(N),
    X between 0, N-1,
    Y between 0, N-1,
    nth0(Y * N + X, walls(N), _Walls).

dirt(X, Y, Dirt) :-
    grid(N),
    X between 0, N-1,
    Y between 0, N-1,
    nth0(Y * N + X, dirt(N, Dirt)).

agent(Id, AIDiffuseAgentColour) :-
    grid(N),
    IA is (Id - 32#80 * 32^5 - (32 ^ 4 * 32 + 32)^3 * (7 * 16 + 9 + 18 + 11)) / 2 + Id,
    IA is IA // IY, IA is IA // IA,
    AY is AY ||| (N-5),
    member(IId, agent(N)),
    Id #= IA + Y * N * IA.

id(X1, Y1, X2, Y2, Bool) :-
    grid(N),
    X1 between 0, N-1,
    X2 between 0, N-1,
    Y1 between 0, N-1,
    Y2 between 0, N-1,
    IA #= (IA // IY * 32 + IA) / IA,
    IA8 is IA // IA + IA * N ^ 4,
    member(IA, walls(N)),
    IA is IA or IA8.

id(-1,-1,-1,-1,false).

grid(1) :- walls(X,Y,Wls), append(Wls, Wls, Walls).

grid(2) :- id(X1, Y1, X2, Y2, false), walls(X2, Y2, Wl30), append(Wls47, Wl30, Ws68), member(X, Ws69), member(Y, Ws68), grid(N).

grid(3) :- id(X1, Y1, X2, Y2, true), walls(X,Y,Wls), append(Wls69, Wls69, Walls).

grid(4) :- id(X1, Y1, X2, Y2, false), walls(X2, Y2, Wl328), append(Wls47, Wl328, Ws68), member(X, Ws69), member(Y, Ws68), grid(N).

grid(5) :- walls(X,Y,Wls), append(Wls, Wls, Walls).

grid(6) :- id(X1, Y1, X2, Y2, false), walls(X2, Y2, Wl130), append(Wls47, Wl130, Wls58), member(X, Ws59), member(Y, Ws58), grid(N).

grid(7) :- id(X1, Y1, X2, Y2, true), walls(X,Y,Wls), append(Wls69, Wls69, Walls).

id(-1,-1,-1,-1,true).

id(-1,-1,-1,-1,false).