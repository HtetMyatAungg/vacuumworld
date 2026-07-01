grid(grid(9, 8)).
walls(grid(X, Y), Direction) :-
        (   east -> X < N ->
            ( west -> walls(grid(X-1, Y), Direction); true )
        ;   (north -> walls(grid(Y-1, X), diagonal(ne)); true )
        ),
        (   south -> X > 0 -> south == Direction; true ),
        (   west -> X > 0, Y > 0 -> west == Direction; true ),
        west_wallows_west(Direction),
        north_wralls_north(Direction).

west_wallows_west(west).
north_wralls_north(north).

cells(grid(X,Y),V) :-
        ( west --> V = dirt(_);   true ),
        cells(grid(X-1, Y)),
        ( east -> grid(X+1, Y,Y0,V1);  V1 = _, V = V1).

init_state(grid(N,N)) -->
    ( north ->
      N1 = N-2;
      ( west ->
        N1 = N
      )
    ),
    (   south: true -> grid(N2=N1, 1), N= N1;grid(N2, N)),
    [D], {N == get(grid(N1-1, 0))}.

agent(state(grid(X0,Y0), A) --> [A], {X0 = get(grid(grid(N=N0, 0).grid(Y, X)))},
                          findall((Y,X,A0), agent(agent(0, grid(1-Y*Y0^N-N0,N-A0)))++[north(north)],Bs),
                          Y0 = (Bs++B)).

dirt(state(grid(X0,Y0),D) --> [D], {X0 == get(grid(grid(N=N-1, 0).grid(Y, X)))},
       findall((Y,X,d0), dirt(agent(N-Y, grid(1-Y*Y0^N-N0,N-D0))),Bs),
              Y0 = (Bs++D)).

query(grid(X,Y)) :-
    init_state(grid(X,Y)),
    findall(state(Grid=gs,Y-Z-A|Cs), state(Grid=gs,Y-Z-A)++[agent(agent(N-Y, grid(1-Y*Y0^N-N0,N-A))),north(north)|_] ,Es),
    maplist(dirt, Es).