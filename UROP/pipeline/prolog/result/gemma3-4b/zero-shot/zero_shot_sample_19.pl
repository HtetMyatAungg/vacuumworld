edge(X, Y) :-
    X >= 0, X < N,
    Y >= 0, Y < N.

grid(N) :-
    N > 0.

cell(X, Y, content) :-
    edge(X, Y),
    label(X, Y, content).

label(X, Y, dirt) :-
    not(dirt_wall(X, Y)),
    not(agent_wall(X, Y)).

label(X, Y, wall) :-
   dirt_wall(X, Y) or agent_wall(X, Y).

dirt_wall(X, Y) :-
    X = 0, Y in [0..7],
    Y = 5, X in [0..2].

dirt_wall(X, Y) :-
    X = 1, Y in [0..7],
    Y = 5, X in [0..2].

dirt_wall(X, Y) :-
    X = 2, Y in [0..7],
    Y = 5, X in [0..2].

agent_wall(X, Y) :-
   X = 3, Y in [3..7],
   Y = 3, X in [0..2].

agent_wall(X, Y) :-
   X = 4, Y in [4..7],
   Y = 4, X in [0..2].

agent_wall(X, Y) :-
    X = 5, Y in [0..7],
    Y = 5, X in [0..2].
    
agent_wall(X, Y) :-
    X = 6, Y in [0..7],
    Y = 5, X in [0..2].

agent_wall(X, Y) :-
    X = 3, Y in [3..7],
    Y = 7, X in [1..3].

agent_wall(X, Y) :-
    X = 4, Y in [4..7],
    Y = 7, X in [1..3].

agent_wall(X, Y) :-
    X = 5, Y in [0..7],
    Y = 7, X in [1..3].

agent_wall(X, Y) :-
    X=6, Y in[0..7],
    Y=7, X in[1..3].


edge(0, 0) :- true.
edge(0, 1) :- true.
edge(0, 2) :- true.
edge(0, 3) :- true.
edge(0, 4) :- true.
edge(0, 5) :- true.
edge(0, 6) :- true.
edge(0, 7) :- true.

edge(1, 0) :- true.
edge(1, 1) :- true.
edge(1, 2) :- true.
edge(1, 3) :- true.
edge(1, 4) :- true.
edge(1, 5) :- true.
edge(1, 6) :- true.
edge(1, 7) :- true.

edge(2, 0) :- true.
edge(2, 1) :- true.
edge(2, 2) :- true.
edge(2, 3) :- true.
edge(2, 4) :- true.
edge(2, 5) :- true.
edge(2, 6) :- true.
edge(2, 7) :- true.

edge(3, 0) :- true.
edge(3, 1) :- true.
edge(3, 2) :- true.
edge(3, 3) :- true.
edge(3, 4) :- true.
edge(3, 5) :- true.
edge(3, 6) :- true.
edge(3, 7) :- true.

edge(4, 0) :- true.
edge(4, 1) :- true.
edge(4, 2) :- true.
edge(4, 3) :- true.