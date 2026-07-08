edge(X, Y) :- between(0, N-1, X), between(0, N-1, Y).

wall(X, Y, North) :- X = N - 1, Y < N - 1.
wall(X, Y, South) :- X = 0, Y > 0.
wall(X, Y, West) :- Y = 0, X > 0.
wall(X, Y, East) :- Y = N - 1, X < N - 1.

dirt(X, Y, Orange) :- X >= 3 , Y >= 4 , X < 7 , Y < 7 .
dirt(X, Y, Green) :- X = 5, Y = 1 .
dirt(X,Y, _ ) :- X>=0, X<N, Y>=0, Y<N, not (wall(X,Y,South) or wall(X,Y,North) or wall(X,Y,East) or wall(X,Y,West)).

agent(X, Y, Id, Colour) :-
    X >= 0, X < N,
    Y >= 0, Y < N,
    not (wall(X, Y, South) or wall(X, Y, North) or wall(X, Y, East) or wall(X, Y, West)),
    agent_data(Id, Colour).

agent_data(Id, Colour) :-
    substitute(Id, _, _),
    substitute(Colour, _, _).

boundary_wall(X,Y) :- edge(X,Y).

% N is the size of the grid.  This needs to be defined.
N := 8. % Assuming an 8x8 grid