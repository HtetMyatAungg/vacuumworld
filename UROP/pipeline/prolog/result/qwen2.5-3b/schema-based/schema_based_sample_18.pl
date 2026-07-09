grid_size(8).
neg(Cost) :- Cost < 0.
pos(Cost) :- Cost > 0.
empty(Neg1,Neg2,X,Y) :-
    grid(Neg1,Z,L), 
    X \= Z, Neg1 \= L.
dirt(Neg1,Neg2,X,Y,C,S) :-
    percept([Id,Coords],[X|Neg2],C,S),
    Y < 5, \+agent(Id,X,Y,C).\+
agent(Id,Neg1,Neg2,X,Y,C) :-
    percept([Pos,Y],[X|Neg2],Id,'agent'), 
    Pos > -N, neg(Y).
wall(Neg1,Neg2,X,Y,W) :-
    Neg1 \= 0,
    ( 
        pos(X), neg(Y),
        wall(Neg1-1,E,L), W = 'west'
    ;
        Odd is Neg1 - 1, neg(Odd), pos(Y), 
        wall(Neg1-1,E,L), W = 'north'
    ;
        Pos is Neg1 + 1,
        X > -Neg1, 
        pos(Pos), neg(Y),
        wall(Neg1-1,E,L), W = 'east'
    ;
        Even is Neg1 + 1, 
        EvEnt \= Neg1, EvEnt \= N, 
        Even =\+ EvEnt,
        X > -N, 
        neg(Even), pos(Y),
        wall(Neg1-1,E,L), W = 'south'
    ).
grid(0,Neg,Z) :- Z \= 0.
wall(_,X,Y,W) :-
    grid(Neg,Z,L), not(pos(X),neg(Y)), not(pos(Z),neg(L)), W \= 'west', W \= 'north', W \= 'east', W \= 'south'.
agent(Id,Neg1,X,Y,C,S) :-
    percept([Pos,Y],[X|Neg2],Id,'agent'),
    Pos > -Neg1, neg(Y).
dirt(Neg1,Neg2,X,Y,B,G) :-
    grid(Neg1,Z,L), 
    Y < 5, \+ agent(_,X,Y,B), 
    percept([_,6],[X|Neg2],'dirty',G).