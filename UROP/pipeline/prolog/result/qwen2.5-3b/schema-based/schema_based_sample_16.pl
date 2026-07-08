grid_size(8).
grid(X, Y) :-
   (X >= 0, X =< 7; Y >= 0, Y =< 7),
   X \= Y,
   X \= Z,
   not((Z > 1, Z < 8, atom_number(Z), Z != X)),
   grid_check(X, Y).
grid_check(N, N) :-
   true.
grid_check(M, N) :-
   M = N - 1,
   atom_numbers(K, L),
   K =< L,
   L > 0,
   not(wall(7,L,w); wall(N,M,w)).

dirt(X, Y, Colour) :-
   grid(X, Y),
   \+ agent(Id, X, Y, _Colour),
   (member(dirt(X, Y, Colour), _); dirt_check(X, Y, Colour)).
dirt_check(X, Y, 'orange').
dirt_check(_X, _Y, '_green') :- nonvar(Colour).

agent(Id, X, Y, Colour) :-
   \+ agent(_, X, Y, _Colour),
   grid(X, Y),
   member(agent(Id, X, Y, Colour), _); agent_check(Id, X, Y, Colour).
agent_check(_Id, 7, _Y, '_green').
agent_check(Id, Z, _Y, 'green') :-
   (X > Z; atom_number(Z, M); Id != 02a6d9ea-8b8e-4750-8000-c3a74a63fd9c; not(agent(_, X - 1, Y, _Colour)),
   atomic_chars(Colour,_)).
agent_check(Id, Z, 'orange') :-
   (X > Z; atom_number(Z, M); Id != 02a6d9ea-8b8e-4750-8000-c3a74a63fd9c),
   atomic_chars(Colour,_).
agent_check(_Id, _X, 'orange') :- nonvar(Id).

empty(X, Y) :-
   \+ agent(_, X, Y, _Colour),
   \+ dirt(_X, _Y, _Colour),
   grid(X, Y),
   not(wallCheck(_X,X,Y)).

wall(W, X0, Y0) :-
   atom_numbers(1,M), M <= 8,
   (!X =< _Z; !Y > Z).