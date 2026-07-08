grid_size(8).
grid(X,Y):-between(0,7,X), between(0,7,Y).

dirt(X,Y.Colour) :-
  grid(X,Y),
  current_data(P),
  percept_property(P,dirt(Y,X;X,Y)),
  percept_value(P,Colour).

agent(Id,X,Y.Colour) :-
  grid(X,Y),
  current_data(P),
  percept_property(P,agent(Y,X;X,Y)),
  percept_value(P,current_agent(Id)).

empty(X,Y) :-
  grid(X,Y), not(dirt(_,_,_)), not(agent(_,_,_,_)).

wall(X,Y,north) :-
  grid(X,Y),
  wall_neighbor(SuperX,SuperY,walls(NW,NE,NW=SouthSuperX,NW=X,NE=X,WestSuperY,Y,SouthSuperX)),
  member(walls(EastSuperX,East),NWEastSupersides,EastSuperX=X).

wall(X,Y,east) :-
  grid(X,Y),
  wall_neighbor(SuperX,SuperY,walls(NW,NE,NW=SouthSuperX,X,NW,WestSuperY,Y,SouthSuperX)),
  member(walls(WestSuperY,West),NWWestSupersides,WestSuperY=Y).

wall(X,Y,south) :-
  grid(X,Y),
  wall_neighbor(SuperX,SuperY,walls(NW,NE,SW,NW=NorthSuperX,X,WestSuperY,NW,SoutheastSuperX,Y)),
  member(walls(EastSuperX,East),NWSuperEastsides,EastSuperX=X).

wall(X,Y,west) :-
  grid(X,Y),
  wall_neighbor(SuperX,SuperY,walls(NW,NE,SW,West=SoutheastSuperX,X,West,NW,NorthSuperX,SuperX)),
  member(walls(East,E),NWSuperEwsides,E=West).

wall_neighbor(SuperX,SuperY,walls(NW,NE,NW=NW,SoutheastSuperX=E,NW=W,AboveSuperY,Y,AboveSuperX,SuperX)) :-
  above_neighboring_walls(SuperX,SoutheastSuperY),
  neighbor_in_super_sides_of_supernode(SuperX,NW,E,W,AboveSuperY,NE,AboveSuperX,SoutheastSuperY).

above_neighboring_walls(X,Y,walls(_N1,_N2)).  
above_neighboring_walls(X,Y,walls(N3,_N4)) :-
  above_neighboring_walls(Y,X), walls_neighbor(SuperAboveX,SuperAboveY,wall(East,E),walls(NW,N3,W,AboveSuperY,NW,AboveSuperX,_Above,Y)).
  
neighbor_in_super_sides_of_supernode(GGx,GGy,walls(X1,Y1),w,X2,Y2) :-
  GGx=X1, GGy=Y1.

member(h,H,H).
member(Leff|L,R) :- member(Leff,L), member(L|R).

wall_neighbor(SuperX,SuperY,walls(_N1,_N2)).  
above_neighboring_walls(X,Y,Walls) :-
  wall_neighbor(X,SuperY,Walls),
  wall_neighbor(SuperX,Y,Walls).

member(h,h).

member(Leff|L,R) :- member(Leff,L), member(L|R).