edge(X, Y, 'north') :- X > 1, Y = 0.
edge(X, Y, 'south') :- X < 7, Y = 7.
edge(X, Y, 'east') :- X = 7, Y > 0.
edge(X, Y, 'west') :- X = 0, Y < 7.
edge(X, Y, Dir) :- X in [0..7], Y in [0..7], X==0, Y==0, Dir = 'west'.
edge(0, 0, 'west') :- !.
edge(0, 1, 'west') :- !.
edge(0, 2, 'west') :- !.
edge(0, 3, 'west') :- !.
edge(0, 4, 'west') :- !.
edge(0, 5, 'west') :- !.
edge(0, 6, 'west') :- !.
edge(0, 7, 'west') :- !.
edge(1, 0, 'north') :- !.
edge(2, 0, 'north') :- !.
edge(3, 0, 'north') :- !.
edge(4, 0, 'north') :- !.
edge(5, 0, 'north') :- !.
edge(6, 0, 'north') :- !.
edge(7, 0, 'north') :- !.

grid(8) :-
    forall(X in [0..7],
        forall(Y in [0..7],
            (edge(X, Y, _) | Y = 0)
        )
    ).

boundary(X, Y) :-
    X in [0..7],
    Y in [0..7].