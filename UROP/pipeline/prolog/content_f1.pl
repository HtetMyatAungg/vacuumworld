% Content F1 evaluation against oracle from 8x8 sweep.
% Load alongside LLM output: swipl -l content_f1.pl -l <llm_file> -g content_f1_report -t halt

:- consult('UROP/pipeline/prolog/f1_eval5x5.pl').

:- dynamic dirt/3, agent/4, empty/2.

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
    findall(dirt(X,Y,C), oracle_dirt(X,Y,C), Oracle),
    findall(dirt(X,Y,C), (dirt(X,Y,C), ground(X), ground(Y), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score(dirt, Pred, OracleSorted).

agent_f1 :-
    findall(agent(Id,X,Y,C), oracle_agent(Id,X,Y,C), Oracle),
    findall(agent(Id,X,Y,C), (agent(Id,X,Y,C), ground(Id), ground(X), ground(Y), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score(agent, Pred, OracleSorted).

empty_f1 :-
    findall(loc(X,Y), oracle_empty(X,Y), Oracle),
    findall(loc(X,Y), (empty(X,Y), ground(X), ground(Y)), PredRaw),
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
    findall(dirt(X,Y,C), oracle_dirt(X,Y,C), Oracle),
    findall(dirt(X,Y,C), (dirt(X,Y,C), ground(X), ground(Y), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score_row(Pred, OracleSorted, Row).

agent_f1_row(Row) :-
    findall(agent(Id,X,Y,C), oracle_agent(Id,X,Y,C), Oracle),
    findall(agent(Id,X,Y,C), (agent(Id,X,Y,C), ground(Id), ground(X), ground(Y), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score_row(Pred, OracleSorted, Row).

empty_f1_row(Row) :-
    findall(loc(X,Y), oracle_empty(X,Y), Oracle),
    findall(loc(X,Y), (empty(X,Y), ground(X), ground(Y)), PredRaw),
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
