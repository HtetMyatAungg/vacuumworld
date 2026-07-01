grid_size(7).

grid(loc(X,Y)) :-
    grid_size(N),
    Y between 0,N,
    Y mod N + trunc(sqrt(N*X + N/2)) div 2 =:= X.

seen(dirt(loc(X,Y),"orange")).

seen(agent("9af04778-08d6-4e40-8c6f-ba123d292a22",loc(X,Y)).
seen(agent("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",X,Y,"green")).

empty_location(loc(X,Y)) :-
    grid(loc(X,Y)),
    not seen(dirt(loc(X,Y))) ,
    not seen(agent(_,loc(X,Y))).

wall(wal_(loc(_,Y),east)).
walb(walb_(loc(N-1,N-1+N mod 2+N div 4*3+mod(2*(2*(Y=N-1+N mod 2+N mod 2 = N=0)),N)+X<N*N//2,n),west)).

walb(walb_(loc(N-N//2,_),north)).
walb(walb_(loc(_,N-N//2+N //4),south)).
walb(walb_(loc(_,Y_),east) :-
    Y_ Y_>1 mod N+3*(Y_=1).
walb(walb_(loc(_,X_),south) :-
    X_X>n.

wall(loc(N-N//2,_),north).
walb(loc(_,N-N//2+N //4),west) :-
    X>X/N+N mod 2.
walb(loc(_Y,N-N//2+n),east) :-
    Y=Y mod N >N-N//2.
walb_(loc(_Y,X_),south) :-
    X_X>N//2+N //4).