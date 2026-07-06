% Content F1 evaluation against oracle from 8x8 sweep.
% Load alongside LLM output: swipl -l content_f1.pl -l <llm_file> -g content_f1_report -t halt

:- consult('UROP/pipeline/prolog/f1_eval.pl').

:- dynamic seen/1, empty_location/1.

f1_score(Label, Pred, Oracle) :-
    intersection(Pred, Oracle, TPList),
    length(TPList, TP),
    length(Pred, PredN),
    length(Oracle, OracleN),
    FP is PredN - TP,
    FN is OracleN - TP,
    format("~w  TP=~w  FP=~w  FN=~w~n", [Label, TP, FP, FN]),
    (TP > 0 ->
        Precision is TP / (TP + FP),
        Recall is TP / (TP + FN),
        F1 is 2 * Precision * Recall / (Precision + Recall),
        format("  Precision=~4f  Recall=~4f  F1=~4f~n", [Precision, Recall, F1])
    ;
        writeln("  F1=0.0000 (no true positives)")
    ).

dirt_f1 :-
    findall(seen(dirt(L,C)), oracle_seen(dirt(L,C)), Oracle),
    findall(seen(dirt(L,C)), (seen(dirt(L,C)), ground(L), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score(dirt, Pred, OracleSorted).

agent_f1 :-
    findall(seen(agent(Id,L,C)), oracle_seen(agent(Id,L,C)), Oracle),
    findall(seen(agent(Id,L,C)), (seen(agent(Id,L,C)), ground(Id), ground(L), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score(agent, Pred, OracleSorted).

empty_f1 :-
    findall(L, oracle_empty(L), Oracle),
    findall(L, (empty_location(L), ground(L)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score(empty, Pred, OracleSorted).

content_f1_report :-
    writeln("=== Content F1 Evaluation ==="),
    nl,
    dirt_f1,
    nl,
    agent_f1,
    nl,
    empty_f1.

%% ---- CSV export -------------------------------------------------------------

f1_score_row(Pred, Oracle, row(TP, FP, FN, Precision, Recall, F1)) :-
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
    ).

dirt_f1_row(Row) :-
    findall(seen(dirt(L,C)), oracle_seen(dirt(L,C)), Oracle),
    findall(seen(dirt(L,C)), (seen(dirt(L,C)), ground(L), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score_row(Pred, OracleSorted, Row).

agent_f1_row(Row) :-
    findall(seen(agent(Id,L,C)), oracle_seen(agent(Id,L,C)), Oracle),
    findall(seen(agent(Id,L,C)), (seen(agent(Id,L,C)), ground(Id), ground(L), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score_row(Pred, OracleSorted, Row).

empty_f1_row(Row) :-
    findall(L, oracle_empty(L), Oracle),
    findall(L, (empty_location(L), ground(L)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score_row(Pred, OracleSorted, Row).

content_f1_to_csv(File) :-
    setup_call_cleanup(
        open(File, write, S),
        write_content_f1_csv(S),
        close(S)
    ).

write_content_f1_csv(S) :-
    format(S, "category,TP,FP,FN,Precision,Recall,F1~n", []),
    write_content_row(S, dirt, dirt_f1_row),
    write_content_row(S, agent, agent_f1_row),
    write_content_row(S, empty, empty_f1_row).

write_content_row(S, Label, Goal) :-
    ( catch(
          call(Goal, Row),
          Error,
          ( format(user_error, "content_f1_to_csv: ~w failed: ~w~n", [Label, Error]),
            fail
          )
      )
    -> Row = row(TP, FP, FN, P, R, F1),
       format(S, "~w,~w,~w,~w,~4f,~4f,~4f~n", [Label, TP, FP, FN, P, R, F1])
    ;  format(S, "~w,ERROR,ERROR,ERROR,ERROR,ERROR,ERROR~n", [Label])
    ).
