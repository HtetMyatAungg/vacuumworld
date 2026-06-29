:- dynamic grid/1, grid_size/1, wall/2.

direction(north).
direction(south).
direction(east).
direction(west).

model_seen(loc(X, Y)) :- grid(loc(X, Y)).

sound    :- forall(model_seen(F), oracle(F)).
complete :- forall(oracle(F), model_seen(F)).
exact    :- sound, complete.

setup_grid(N) :-
    retractall(grid_size(_)),
    assertz(grid_size(N)),
    retractall(grid(_)),
    N1 is N - 1,
    forall( ( between(0, N1, X), between(0, N1, Y) ),
            assertz(grid(loc(X, Y))) ).

predicted_walls(N, Walls) :-
    N1 is N - 1,
    findall(wall(loc(X, Y), D), (
        between(0, N1, X), between(0, N1, Y),
        direction(D),
        wall(loc(X, Y), D)
    ), Ws),
    sort(Ws, Walls).

oracle_walls(N, Walls) :-
    N1 is N - 1,
    findall(wall(loc(X, Y), D), (
        between(0, N1, X), between(0, N1, Y),
        direction(D),
        (D = north, Y =:= 0 ;
         D = south, Y =:= N1 ;
         D = west,  X =:= 0 ;
         D = east,  X =:= N1)
    ), Ws),
    sort(Ws, Walls).

walls_at(N, Walls) :-
    setup_grid(N),
    predicted_walls(N, Walls).

wall_f1(N) :-
    walls_at(N, Pred),
    oracle_walls(N, Oracle),
    intersection(Pred, Oracle, TPList),
    length(TPList, TP),
    length(Pred, PredN),
    length(Oracle, OracleN),
    FP is PredN - TP,
    FN is OracleN - TP,
    format("N=~w  TP=~w  FP=~w  FN=~w~n", [N, TP, FP, FN]),
    (TP > 0 ->
        Precision is TP / (TP + FP),
        Recall is TP / (TP + FN),
        F1 is 2 * Precision * Recall / (Precision + Recall),
        format("  Precision=~4f  Recall=~4f  F1=~4f~n", [Precision, Recall, F1])
    ;
        writeln("  F1=0.0000 (no true positives)")
    ).

wall_f1_sweep(Ns) :-
    forall(member(N, Ns), wall_f1(N)).

wall_f1_csv(N, Row) :-
    walls_at(N, Pred),
    oracle_walls(N, Oracle),
    intersection(Pred, Oracle, TPList),
    length(TPList, TP),
    length(Pred, PredN),
    length(Oracle, OracleN),
    FP is PredN - TP,
    FN is OracleN - TP,
    (TP > 0 ->
        Precision is TP / (TP + FP),
        Recall is TP / (TP + FN),
        F1 is 2 * Precision * Recall / (Precision + Recall)
    ;
        Precision = 0.0, Recall = 0.0, F1 = 0.0
    ),
    Row = row(N, TP, FP, FN, Precision, Recall, F1).

wall_f1_to_csv(Ns, File) :-
    open(File, write, S),
    format(S, "N,TP,FP,FN,Precision,Recall,F1~n", []),
    forall(
        member(N, Ns),
        ( wall_f1_csv(N, row(N, TP, FP, FN, P, R, F1)),
          format(S, "~w,~w,~w,~w,~4f,~4f,~4f~n", [N, TP, FP, FN, P, R, F1])
        )
    ),
    close(S).
