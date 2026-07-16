:- dynamic grid/2, grid_size/1, grid_size/2, wall/3.

direction(north).
direction(south).
direction(east).
direction(west).

% Under the fixed (0,0)=NW-corner convention, north (Y=0) and west (X=0)
% facts are identical at every grid size, so crediting them at N != true_N
% rewards coordinate coincidence rather than a generalizing rule. Only
% south/east move with N, so only they carry generalization signal.
scored_direction(south).
scored_direction(east).

model_seen(loc(X, Y)) :- grid(X, Y).

sound    :- forall(model_seen(F), oracle(F)).
complete :- forall(oracle(F), model_seen(F)).
exact    :- sound, complete.

setup_grid(N) :-
    % Reparametrise the grid size for BOTH arities models use. Unconstrained
    % outputs frequently key their boundary rule on grid_size(Cols, Rows)
    % (arity 2); retracting only grid_size/1 left that pinned to the
    % demonstrated size, so a genuinely general rule scored like a hardcoded
    % one. Assert both grid_size(N) and grid_size(N, N).
    retractall(grid_size(_)),
    retractall(grid_size(_, _)),
    assertz(grid_size(N)),
    assertz(grid_size(N, N)),
    retractall(grid(_, _)),
    N1 is N - 1,
    forall( ( between(0, N1, X), between(0, N1, Y) ),
            assertz(grid(X, Y)) ).

% Walls may be exposed under any predicate name: a hardcoded wall/3, or a
% generalising rule the model chose to call has_wall/3, boundary_wall/3,
% is_wall/3, ... Rather than hardcoding that list -- or regex-rewriting the
% source, which would turn a clause like `wall(X,Y,D) :- boundary_wall(X,Y,D).`
% into a self-recursive hang -- discover any arity-3 predicate whose name
% mentions "wall" and query it. sort/2 in predicted_walls dedups the union.
% model_wall/3 must exclude itself or it recurses.
wall_accessor(P) :-
    current_predicate(P/3),
    sub_atom(P, _, _, _, wall),
    P \== model_wall.

% NOTE: deliberately NOT wrapped in catch/3. current_predicate/1 already
% guarantees the accessor exists, and some generated rules are genuinely buggy
% (e.g. `wall(X,Y,south) :- Y =:= N-1, grid_size(N).` evaluates N before it is
% bound). Those must surface as ERROR rows, not be silently scored as "no
% walls" -- swallowing them would turn a broken rule into a real-looking score.
model_wall(X, Y, D) :-
    wall_accessor(P),
    Goal =.. [P, X, Y, D],
    call(Goal).

predicted_walls(N, Walls) :-
    N1 is N - 1,
    findall(wall(X, Y, D), (
        between(0, N1, X), between(0, N1, Y),
        scored_direction(D),
        model_wall(X, Y, D)
    ), Ws),
    sort(Ws, Walls).

oracle_walls(N, Walls) :-
    N1 is N - 1,
    findall(wall(X, Y, D), (
        between(0, N1, X), between(0, N1, Y),
        scored_direction(D),
        (D = south, Y =:= N1 ;
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
    setup_call_cleanup(
        open(File, write, S),
        ( format(S, "N,TP,FP,FN,Precision,Recall,F1~n", []),
          forall(member(N, Ns), write_f1_row(S, N))
        ),
        close(S)
    ).

write_f1_row(S, N) :-
    ( catch(
          wall_f1_csv(N, row(N, TP, FP, FN, P, R, F1)),
          Error,
          ( format(user_error, "wall_f1_to_csv: N=~w failed: ~w~n", [N, Error]),
            fail
          )
      )
    -> format(S, "~w,~w,~w,~w,~4f,~4f,~4f~n", [N, TP, FP, FN, P, R, F1])
    ;  format(S, "~w,ERROR,ERROR,ERROR,ERROR,ERROR,ERROR~n", [N])
    ).
