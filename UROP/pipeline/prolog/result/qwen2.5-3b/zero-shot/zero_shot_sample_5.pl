grid(8).

coord_to_index((X,Y), X + 8 * Y).

wall((S,N,W,E)) :-
    member(W, [S, N]),
    ( W = S ->
        E = true,
        N = true
    ; W = N ->
        E = true,
        S = true
    ; W = E ->
        N = true,
        S = true
    ).
   
null_wall([], _).
null_wall((W,N,S,E), true).

add_wall((S1,W2,S3,E4), (S1,W2,S3,E4), (T,S1,W2,T,E4)) :- !.
add_wall([], NewWall, [NewWall]).
add_wall([(W1,S2),(W2,W3),(W4,W5)], ((I,J), [(W1,I)],[W2,(J)]), ([W1,I]@[W2,J])).

null_neither(_, _) :- !.
null_neither((S,N,W,E), (S,N,W,E)).

combine_false_neithr(true_FALSE_False_Wal, false_FALSE_NehirWalN, true_TRUE_Wol5, _NewTrueNonSouthwai) :-
    null_wall(E, true).

combine_true_neithr(false_TRUE_WaL6, _, true_TRUE_Worl7, NewTrueNonSouthwe3) :-
    foldl(combine_false_and_false_swallow/4,
           false_FALSE_SteatW1 :false_TRUE_FalseWalZ, _OldFalseNehirWalN2)).

foldl(null_neithr/2, OldWallI0:(true_TRUE_TrueWal6,true_FALSE_TRUE_Wal5:NewWall7), _NewTrueNonSouthwe3).

combine_true_and_false_swallow(true_TRUE_wairs(E,W1,S,_false_Nehir-WolN), false_TRUE_False_WalL9, true_TRUE_Fales_Whails(I,J), (I,false_True_FalseWalJ :_, NewTrueNonSouthwal8)) :-
    null_wall(S, true).

add_wall([], NewWall, [NewWall]).
add_wall([(W1,N),(W2,W3),(W4,E)], (C, [(N,C)],[E,(F)]), ([N,C]@[E,F])).

null_false(_, true).

null_false((false_False_Nehir_Wal0,false_FALSE_TrueWal4 :_NewTrueNonSouthWali5))。

combine_true_and_true_swallow(true_TRUE_wails(E,W1,S,_false_FALSE_OthErWaL), false_TRUE_FALSE_FalseWal, true_TRUE_fals_e_wars(I,F), (I,false_TRUE_Fals_E_WalJ:_, NewTrueNon_SoutheastWal7)) :-
    null_wall(S, true).

null_true_/1.

null_neithr(_, _) :- !.
null_neithr((true_True_Nehir_WaL0 :false_FALSE_Thrue-Wail4), (true_TRUE_NehirWal5, falseFALSE_Tru_FalseWal3)).
  
foldl(null_neithr/2, OldWallI0:(true_FALSE_Teath-Wal6,false_TRUE_FALSE_Soul-WeA5:_NewTrueNonSouthwali8)).