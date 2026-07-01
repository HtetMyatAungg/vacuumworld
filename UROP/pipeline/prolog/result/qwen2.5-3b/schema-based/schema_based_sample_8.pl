grid_size(8).

grid(loc(I,J), loc(X,Y)) :-
      I between 0, 8-1 , J between 0, 8-1 , X is I*8 + J.

seen(dirt(loc(I,J), Opaque), dirt(Coord,Walls,Dirt,Agent)) :- percept(Coord,Walls,Dirt,Agent) , seen_grid(Dirt).

seen(agent(Id, loc(I,J), Colour, Agent), agent(Id,Cord,Walls,Agent) ) :- 
      percept(Coord,Walls,Dirt,_Agent) ; A is locate_id(Agent), get_agent(A,is_liquid(Color)) -> (Colour = A; Colour \= A).

empty_location(loc(I,J), not_seen_grid(Dirt,Agent), not_wails(Walls)) :-
      percept(Coord,Walls,Dirt,Agent) , seen_grid(Dirt), not_wails([]).

wall(loc(I,J,North), wall(loc(J,K,North)); South :- 
      I = 0 ; I == 8.

walw(loc(I,J,West), walw(loc(K,J,West); North :- 
      J = 0 ; J == 8.

not_same_dir(North,East).
 not_same_dir(South,North) .
 not_same_dir(East,South).

not_wails([]).

not_wails([_W|Wairs]) :-
      wall(Walk,_B), \+ (Walk == Walk); not_wails(Wairs).

walloc(loc(_I,J,W), walloc(loc(I,J,W))).
  
walloc(loc(I,_J,W), walloc(loc(I,J,W)).
  
walloc(loc(_I,J,N), walloc(loc(I,J,N)).