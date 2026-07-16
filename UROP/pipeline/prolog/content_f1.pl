% Content F1 evaluation against an oracle sweep.
% The oracle is NOT consulted here: it is chosen by the caller so the same
% evaluator can score any grid size. Load the matching oracle first --
%   swipl -l f1_eval5x5.pl -l content_f1.pl -l <llm_file> -g content_f1_report -t halt
% Consulting it here instead would pin every run to the 8x8 oracle, and loading
% a second oracle alongside it would merge two sets of oracle_* facts rather
% than replace them.

:- dynamic dirt/3, agent/4, empty/2.

%% ---- Predicted-content normalisation ----------------------------------------
%
% Zero-shot output is given no schema, so its representation convention is
% arbitrary and content F1 is meant to measure *content*, not convention.
% Matching only the oracle's layout (dirt/3, empty/2, agent(Id,X,Y,C)) scored
% every other layout as 0.0. Crucially, the conventions are not evenly
% distributed across models -- claude/gemini transpose agent args while
% gpt-5.1/deepseek nest everything under cell/3..cell/6 -- so crediting one
% layout alone produced model rankings that were artifacts of the evaluator's
% choice. All three categories therefore normalise the same way:
%
%   1. accessor discovery, mirroring f1_N's wall_accessor: any predicate whose
%      name mentions the category (dirt/3, has_dirt/3, agent/4, cell_agent/4,
%      agent_at/4, empty/2, is_empty/2, ...) is queried, excluding the oracle's
%      own oracle_* facts and this file's pred_* helpers;
%   2. cell payload scanning: cell-like predicates (name mentions "cell" or
%      "location", arity 3-6) are read as coordinates (two leading numbers,
%      or an (X,Y) pair) plus payload args, and dirt(C) / empty / agent(A,B)
%      terms are extracted from the payload -- through lists, through
%      Key:Value tagging (walls:[...], dirt:'orange', agent:agent(Id,C)),
%      and through wrapper terms (agent(null, dirt(orange), walls([])));
%   3. agent id/colour disambiguation: inside agent(A,B) the colour is
%      whichever argument matches the oracle's colour vocabulary, so both
%      agent(Id,Colour) and deepseek's agent(Colour,Id) are read correctly.
%
% Boundaries this deliberately does NOT rescue (content errors, not
% conventions):
%   - an unquoted uuid (`agent(9af04778-...,orange)`) is a syntax error, so
%     SWI drops the clause at load time and the fact never reaches us: parse
%     failures keep scoring 0;
%   - a rewritten id (gemini-3.1 emits uuids with `_` for `-`) parses but is
%     altered data, so it stays a mismatch -- consistent with the parse-failure
%     rule: models that could not reproduce the id verbatim score 0 on it;
%   - dirt(none)/agent(none)/dirt:none/dirt(null) placeholders assert absence,
%     not content, and are skipped rather than read as colour 'none';
%   - a cell with NO empty marker (only placeholders, or an empty payload
%     list) represents emptiness implicitly; crediting it would require the
%     evaluator to infer absence, so it is not read as empty/2;
%   - agent(colour) with the id dropped has lost content and cannot match.

as_atom(V, A) :- atom(V), !, A = V.
as_atom(V, A) :- string(V), !, atom_string(A, V).

% Predicates this file defines; never treat them as model output.
% cell_payload matters most: its own name mentions "cell", so without this
% exclusion cellish/2 discovers it and cell_payload calls itself forever --
% the same self-recursion trap f1_N's model_wall/3 documents.
own_pred(pred_agent). own_pred(pred_dirt). own_pred(pred_empty).
own_pred(cell_payload). own_pred(cellish). own_pred(coords_payload).
own_pred(payload_item).

% user_pred/2 keeps discovery away from SWI internals: without the built_in /
% '$' guards, named_accessor(empty, 2) finds the tabling-engine predicate
% '$idg_mono_empty_queue'/2, which instantiation-errors when queried.
user_pred(P, Arity) :-
    current_predicate(P/Arity),
    \+ sub_atom(P, 0, _, _, '$'),
    functor(Head, P, Arity),
    \+ predicate_property(Head, built_in).

named_accessor(Key, Arity, P) :-
    user_pred(P, Arity),
    \+ sub_atom(P, 0, _, _, oracle_),
    \+ own_pred(P),
    sub_atom(P, _, _, _, Key).

% The oracle's colour vocabulary, used to tell ids from colours.
known_color(C) :- current_predicate(oracle_agent/4), oracle_agent(_, _, _, C).
known_color(C) :- current_predicate(oracle_dirt/3), oracle_dirt(_, _, C).

% Assign (S,T) to (Id,Colour): the colour is the argument in the oracle's
% colour vocabulary; when neither (or both) qualify, keep the written order.
id_color(S, T, Id, C) :-
    as_atom(S, SA), as_atom(T, TA),
    (   known_color(TA), \+ known_color(SA) -> Id = SA, C = TA
    ;   known_color(SA), \+ known_color(TA) -> Id = TA, C = SA
    ;   Id = SA, C = TA
    ).

% Cell-like predicates: coordinates are the two leading number args (or an
% (X,Y) pair in the first arg); every remaining arg is payload, lists
% flattened one term deep.
cellish(P, A) :-
    between(3, 6, A),
    user_pred(P, A),
    ( sub_atom(P, _, _, _, cell) ; sub_atom(P, _, _, _, location) ),
    \+ sub_atom(P, 0, _, _, oracle_),
    \+ own_pred(P).

cell_payload(X, Y, Item) :-
    cellish(P, A),
    functor(Goal, P, A),
    call(Goal),
    Goal =.. [_|Args],
    coords_payload(Args, X, Y, Payload),
    member(Arg, Payload),
    payload_item(Arg, Item).

coords_payload([(X0, Y0)|Rest], X, Y, Rest) :-
    number(X0), number(Y0), !, X = X0, Y = Y0.
coords_payload([X0, Y0|Rest], X, Y, Rest) :-
    number(X0), number(Y0), !, X = X0, Y = Y0.

% Absence markers: dirt(none), agent:none, dirt(null), ... assert that a cell
% has NO content and must not be read as colour none/null.
placeholder(none).
placeholder(null).

payload_item(L, Item) :- is_list(L), !, member(E, L), payload_item(E, Item).
payload_item(K:V, Item) :- !, kv_item(K, V, Item).
payload_item(T, T).
payload_item(T, Item) :-            % descend into wrapper terms, e.g.
    compound(T),                    % agent(null, dirt(orange), walls([]))
    arg(_, T, A),
    payload_item(A, Item).

kv_item(_, V, Item) :- compound(V), !, payload_item(V, Item).
kv_item(K, V, Item) :- atom(V), \+ placeholder(V), Item =.. [K, V].

% The id position must be an atom/string and the coordinates numbers. That
% keeps the two arity-4 readings mutually exclusive (so a fact can never be
% counted twice) and drops facts with an unbound coordinate, e.g.
% `agent(_,0,'<uuid>',orange)`, whose position is genuinely unknown.
pred_agent(Id, X, Y, C) :-
    named_accessor(agent, 4, P),
    Goal =.. [P, A, B, D, E],
    call(Goal),
    (   as_atom(A, _), number(B), number(D)        % (Id,X,Y,C) -- oracle order
    ->  X = B, Y = D, id_color(A, E, Id, C)
    ;   number(A), number(B), as_atom(D, _)        % (X,Y,Id,C) -- transposed
    ->  X = A, Y = B, id_color(D, E, Id, C)
    ).
pred_agent(Id, X, Y, C) :-
    cell_payload(X, Y, agent(A, B)),
    \+ placeholder(A),
    id_color(A, B, Id, C).

pred_dirt(X, Y, C) :-
    named_accessor(dirt, 3, P),
    Goal =.. [P, X, Y, C0],
    call(Goal),
    number(X), number(Y),
    \+ placeholder(C0),
    as_atom(C0, C).
pred_dirt(X, Y, C) :-
    cell_payload(X, Y, dirt(C0)),
    \+ placeholder(C0),
    as_atom(C0, C).

pred_empty(X, Y) :-
    named_accessor(empty, 2, P),
    Goal =.. [P, X, Y],
    call(Goal),
    number(X), number(Y).
pred_empty(X, Y) :-
    cell_payload(X, Y, empty).

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
    findall(dirt(X,Y,C), (pred_dirt(X,Y,C), ground(X), ground(Y), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score(dirt, Pred, OracleSorted).

agent_f1 :-
    findall(agent(Id,X,Y,C), oracle_agent(Id,X,Y,C), Oracle),
    findall(agent(Id,X,Y,C), (pred_agent(Id,X,Y,C), ground(Id), ground(X), ground(Y), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score(agent, Pred, OracleSorted).

empty_f1 :-
    findall(loc(X,Y), oracle_empty(X,Y), Oracle),
    findall(loc(X,Y), (pred_empty(X,Y), ground(X), ground(Y)), PredRaw),
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
    findall(dirt(X,Y,C), (pred_dirt(X,Y,C), ground(X), ground(Y), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score_row(Pred, OracleSorted, Row).

agent_f1_row(Row) :-
    findall(agent(Id,X,Y,C), oracle_agent(Id,X,Y,C), Oracle),
    findall(agent(Id,X,Y,C), (pred_agent(Id,X,Y,C), ground(Id), ground(X), ground(Y), ground(C)), PredRaw),
    sort(Oracle, OracleSorted),
    sort(PredRaw, Pred),
    f1_score_row(Pred, OracleSorted, Row).

empty_f1_row(Row) :-
    findall(loc(X,Y), oracle_empty(X,Y), Oracle),
    findall(loc(X,Y), (pred_empty(X,Y), ground(X), ground(Y)), PredRaw),
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
