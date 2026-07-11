size(5,5).

cell(0,0,[],[]).
cell(1,0,[],[]).
cell(2,0,[],[agent(c942b0ce-6c70-4311-a5b7-6b2640fe417c,green)]).
cell(3,0,[],[]).
cell(4,0,[],[]).
cell(0,1,[],[]).
cell(1,1,[],[]).
cell(2,1,[],[]).
cell(3,1,[dirt(orange)],[]).
cell(4,1,[],[]).
cell(0,2,[],[]).
cell(1,2,[dirt(green)],[]).
cell(2,2,[],[]).
cell(3,2,[],[]).
cell(4,2,[],[agent(ec1d58f6-6db4-473d-af3e-518ca49c39f9,orange)]).
cell(0,3,[],[]).
cell(1,3,[],[]).
cell(2,3,[dirt(orange)],[]).
cell(3,3,[],[]).
cell(4,3,[],[]).
cell(0,4,[],[]).
cell(1,4,[],[]).
cell(2,4,[],[]).
cell(3,4,[],[]).
cell(4,4,[],[]).

north_wall(X,0) :- X >= 0, X =< 4.
south_wall(X,4) :- X >= 0, X =< 4.
west_wall(0,Y) :- Y >= 0, Y =< 4.
east_wall(4,Y) :- Y >= 0, Y =< 4.

wall((X,Y),north) :- north_wall(X,Y).
wall((X,Y),south) :- south_wall(X,Y).
wall((X,Y),west) :- west_wall(X,Y).
wall((X,Y),east) :- east_wall(X,Y).