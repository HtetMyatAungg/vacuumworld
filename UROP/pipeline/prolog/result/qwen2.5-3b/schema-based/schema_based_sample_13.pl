grid_size(3).%
grid(X,Y) :-
    (X between 0 and 7 -> Y between 0 and 7; fail), grid(X-1,Y); grid(X+1,Y); grid(X,Y+1); grid(X,Y-1).
dirt(X,Y, orange) :- member(coord([X,Y]), [
  {coord([0,6]), walls([west])},
  {coord([0,5]), walls([west]), agent(_, _, "orange")},
  {coord([3,4]), walls([]), dirt(_, "orange")},
  {coord([4,1]), coord([_, _], X=7;, Y); wall(X,Y,south);
...
]).
agent(Id,X,Y,"green") :-
  member(agent(Aid,_,X,Y,C),[
    agent("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",1,_,_); agent(_,C,X,,Y);
...
]).
empty(X,Y) :-
  neg(grid(X,Y); dirt(X,Y,_); agent(AIdX,Y,C); wall(X,Y,L), \+ member(coord([X,Y]),[
  {coord([7,1]), walls([north])}.
].
wall(X,Y,north).
wall(X,Y,south).
wall(X,Y,east).
wall(X,Y,west).