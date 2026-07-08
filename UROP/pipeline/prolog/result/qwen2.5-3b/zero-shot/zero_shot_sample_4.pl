grid(0,0,[west],agent([id,"9af04778-08d6-4e40-8c6f-ba123d292a22",colour,orange])).
grid(0,1,[north,west],agent(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green)).
grid(0,2,[west]).
grid(0,3,[west]).
grid(0,4,[south,east],dirt).
grid(1,0,[north]).
grid(1,1,dirt(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green)).
grid(1,2,[west]).
grid(1,3,[south]).
grid(1,4,[east]).
grid(2,0,[north]).
grid(2,1,dirt(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green)).
grid(2,2,[west]).
grid(2,3,[south]).
grid(2,4,[east]).
grid(3,0,[north]).
grid(3,1,dirt(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green)).
grid(3,2,[west]).
grid(3,3,[south]).
grid(3,4,[east],dirt(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green)).
grid(4,0,[north]).
grid(4,1,dirt(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green)).
grid(4,2,[west]).
grid(4,3,[south]).
grid(4,4,[east],dirt(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green),agent([id,"9af04778-08d6-4e40-8c6f-ba123d292a22",colour,orange])).
grid(5,0,[north]).
grid(5,1,dirt(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green)).
grid(5,2,[west]).
grid(5,3,[south]).
grid(5,4,[east],dirt(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green)).
grid(6,0,[north]).
grid(6,1,dirt(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green)).
grid(6,2,[west]).
grid(6,3,[south]).
grid(6,4,[east],dirt(id,"02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",colour,green)).
grid(7,0,[north,east]).
grid(7,1,[east]).
grid(7,2,[east]).
grid(7,3,[east]).
grid(7,4,[east]).

% Boundary wall rules
boundary_wall(north,X,Y) :- X > 0, grid(X,Y,Walls), memberchk(north,Walls).
boundary_wall(south,X,Y) :- X < 7, grid(X,Y,Walls), memberchk(south,Walls).
boundary_wall(east,X,Y) :- Y < 7, grid(X,Y,Walls), memberchk(east,Walls).
boundary_wall(west,X,Y) :- Y > 0, grid(X,Y,Walls), memberchk(west,Walls).