The previous Prolog failed SWI-Prolog validation.

Validation output:
ERROR: /home/asus/vacuumworld/UROP/pipeline/prolog/result/qwen2.5-3b/one-shot/one_shot_sample_17.pl:88:5: Syntax error: Operator expected

Previous output:

grid_size(8).

grid(loc(0,0)).
grid(loc(1,0)).
grid(loc(2,0)).
grid(loc(3,0)).
grid(loc(4,0)).
grid(loc(5,0)).
grid(loc(6,0)).
grid(loc(7,0)).

grid(loc(0,1)).
grid(loc(1,1)).
grid(loc(2,1)).
grid(loc(3,1)).
grid(loc(4,1)).
grid(loc(5,1)).
grid(loc(6,1)).
grid(loc(7,1)).

grid(loc(0,2)).
grid(loc(1,2)).
grid(loc(2,2)).
grid(loc(3,2)).
grid(loc(4,2)).
grid(loc(5,2)).
grid(loc(6,2)).
grid(loc(7,2)).

grid(loc(0,3)).
grid(loc(1,3)).
grid(loc(2,3)).
grid(loc(3,3)).
grid(loc(4,3)).
grid(loc(5,3)).
grid(loc(6,3)).
grid(loc(7,3)).

grid(loc(0,4)).
grid(loc(1,4)).
grid(loc(2,4)).
grid(loc(3,4)).
grid(loc(4,4)).
grid(loc(5,4)).
grid(loc(6,4)).
grid(loc(7,4)).

grid(loc(0,5)).
grid(loc(1,5)).
grid(loc(2,5)).
grid(loc(3,5)).
grid(loc(4,5)).
grid(loc(5,5)).
grid(loc(6,5)).
grid(loc(7,5)).

grid(loc(0,6)).
grid(loc(1,6)).
grid(loc(2,6)).
grid(loc(3,6)).
grid(loc(4,6)).
grid(loc(5,6)).
grid(loc(6,6)).
grid(loc(7,6)).

grid(loc(0,7)).
grid(loc(1,7)).
grid(loc(2,7)).
grid(loc(3,7)).
grid(loc(4,7)).
grid(loc(5,7)).
grid(loc(6,7)).
grid(loc(7,7)).

seen(dirt(loc(X,Y), Colour)) :-
  percept_log(percept_entry(_, _, dirt(loc(X,Y), _),
               _), percept_entry(_Loc, Loc, _, _), _),
  nonempty_location(Loc).

seen(agent(Id, loc(X,Y), Colour)) :-
  percept_entry(_Id, agent(Id, loc(X,Y), Colour), _),
  nonempty_agent(Id, _Agent),
  nonempty_state(AgentState),
  AgentState = seen_state(agent(Id, loc(X,Y), Colour)).

nonempty_location(loc(X,Y)) :-
  grid(loc(X,Y)),
  not empty_location(loc(X,Y)).

nonempty_agent(Id, _Id) :-
  percept_entry(_Percept, _, agent(Id,_Loc,_Colour),_),
  percept_entry(_, [], seen_agents(Id),_).

seen_state(agent(Id, loc(X2,Y2), Colour)):-
    percept_entry(_Entry1, _State1, seen_state(agent(Id,loc(X1,Y1),_Colour)),_),
    percept_entry(_Entry3, State3, seen_agents(_Id), _),
    X1 = X2,
    Y1 = Y2.

empty_location(loc(X,Y)) :-
  percept_log(_, percepts(_, state(grid(M,N),seen_agents(Id:AgentState),seen(dirt(AbsLoc,Colour):absdirt_state(Id,AbsLoc,Colour1))),_)),
  
  grid_loc(loc(X2,Y2), grid_loc(_,N)^(X1=X2;Y1=Y2))).

wall(grid_size(8), N, Dir) :-
  ((N mod 2 =:= 0); (N mod 2 =\= 0)) ->
    N1 is N - 1,
    N2 is N + 1,
    N1 \= 0, N1 \= M,  
    wall(loc(N1, (M * X) div (N1)), Dir),
    N2 \= 0, N2 \= M, 
    wall(loc(N2, ((M * Y) mod N2)/N2), Dir).
%
wall(grid_size(M), _1, Dir).