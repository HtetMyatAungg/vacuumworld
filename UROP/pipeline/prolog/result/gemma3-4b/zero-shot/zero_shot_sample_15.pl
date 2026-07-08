edge((X, Y), (X2, Y2), [wall]) :-
  between(X, X2, 1),
  between(Y, Y2, 1),
  (   X2 == X+1, Y2 == Y
  ->   edge_case_northwest((X, Y), (X2, Y2))
  ;   X2 == X+1, Y2 == Y-1
  ->   edge_case_northeast((X, Y), (X2, Y2))
  ;   X2 == X-1, Y2 == Y+1
  ->   edge_case_southwest((X, Y), (X2, Y2))
  ;   X2 == X-1, Y2 == Y-1
  ->   edge_case_southeast((X, Y), (X2, Y2))
  ;   X2 == X+1
  ->   edge_case_east((X, Y), (X2, Y2))
  ;   X2 == X-1
  ->   edge_case_west((X, Y), (X2, Y2))
  ;   Y2 == Y+1
  ->   edge_case_south((X, Y), (X2, Y2))
  ;   Y2 == Y-1
  ->   edge_case_north((X, Y), (X2, Y2))
  ).

edge_case_northwest((X, Y), (X2, Y2)) :-
    X2 == X+1, Y2 == Y.

edge_case_northeast((X, Y), (X2, Y2)) :-
    X2 == X+1, Y2 == Y-1.

edge_case_southwest((X, Y), (X2, Y2)) :-
    X2 == X-1, Y2 == Y+1.

edge_case_southeast((X, Y), (X2, Y2)) :-
    X2 == X-1, Y2 == Y-1.

edge_case_east((X, Y), (X2, Y2)) :-
    X2 == X+1.

edge_case_west((X, Y), (X2, Y2)) :-
    X2 == X-1.

edge_case_south((X, Y), (X2, Y2)) :-
    Y2 == Y+1.

edge_case_north((X, Y), (X2, Y2)) :-
    Y2 == Y-1.

wall(X, Y, X2, Y2) :-
  between(X, X2, 1),
  between(Y, Y2, 1),
  (   X2 == X+1, Y2 == Y
  ->   edge_case_northwest(X, Y, X2, Y2)
  ;   X2 == X+1, Y2 == Y-1
  ->   edge_case_northeast(X, Y, X2, Y2)
  ;   X2 == X-1, Y2 == Y+1
  ->   edge_case_southwest(X, Y, X2, Y2)
  ;   X2 == X-1, Y2 == Y-1
  ->   edge_case_southeast(X, Y, X2, Y2)
  ;   X2 == X+1
  ->   edge_case_east(X, Y, X2, Y2)
  ;   X2 == X-1
  ->   edge_case_west(X, Y, X2, Y2)
  ;   Y2 == Y+1
  ->   edge_case_south(X, Y, X2, Y2)
  ;   Y2 == Y-1
  ->   edge_case_north(X, Y, X2, Y2)
  ).

edge_case_northwest(X, Y, X2, Y2) :-
  X2 == X+1, Y2 == Y.

edge_case_northeast(X, Y, X2, Y2) :-
  X2 == X+1, Y2 == Y-1.

edge_case_southwest(X, Y, X2, Y2) :-
  X2 == X-1, Y2 == Y+1.

edge_case_southeast(X, Y, X2, Y2) :-
  X2 == X-1, Y2 == Y-1.

edge_case_east(X, Y, X2, Y2) :-
  X2 == X+1.

edge_case_west(X, Y, X2, Y2) :-
  X2 == X-1.

edge_case_south(X, Y, X2, Y2) :-
  Y2 == Y+1.

edge_case_north(X, Y, X2, Y2) :-
  Y2 == Y-1.