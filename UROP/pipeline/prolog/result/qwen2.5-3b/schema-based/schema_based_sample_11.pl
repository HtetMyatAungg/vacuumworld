grid_size(9).

grid(loc(X,Y)) :- grid_size(N), X between 0,N ; Y between 0,N.

seen(dirt(loc(X,Y))) :-
    percept(log),
    member(percept(dirt(loc(X,Y))), _).

seen(agent(Id, loc(X,Y), Colour)) :-
    percept(log),
    member(percept(agent(Id,loc(X,Y),Colour)), _).

empty_location(loc(X,Y)) :-
    grid,
    \+ seen(_, dirt(loc(X,Y))),
    \+ seen(_, agent(_,loc(X,Y),_)),
    \+ found_by(_: loc(X,Y)).

found_by(_: loc(X,Y)) :-
    empty_location(Copy),
    (X = Copy ; Y = Copy) :-
    percept(log),
    member(percept(found_by(:,Copy)), _).

walldir(north(W), X, N) :- grid, W \= north, X between 0,N-NW1-W ; N is X + NW1 + W.

walldir(south(W), X, N) :- grid, W \= south, X between 0,N-NW1+1+W ; N is X - (nw1+NW1+W).

walldir(west(W), Y, N) :- grid, W \= west, Y between 0,NE1-W+Y-N ; N is Y + NE1 + W.

walldir(east(W), Y, N) :- grid, W \= east, Y between 0,N-NE1+W+N ; N is Y - (79+NW1+W).

loc(loc(X,Y)) :-
    grid,
    seen(dirt(_)),
    (north(Bound),not(walldir(north(W),X,Bound)), Bound1 is W + Bound, loc_to_percept(East,(Bound-72)) ; not(memberchk(south(Bound),south(Bounds))), loc(loc(X,Y)) :- grid,
        seen(agent(_,loc(X,Y))),
        (west(NW1) \= west(0),
            south(Bound) \= south(0), Bound1 is W + NW1, loc_to_percept(East,NW1+Bound, N1) 
        ; not(memberchk(east(Wind)),east(west(Bounds))), loc(loc(X,Y)) :-
                grid,
                seen(agent(_,loc(X,Y))),
                (west(58+NW1) \= west(0),
                    south(Bound) \= south(0), Bound1 is W + NW1 + Boundary, loc_to_percept(NW1+78,Bound, N1)
                ; not(memberchk(north(Wind)),north(south(Bounds))), loc(loc(X,Y)) :-
                        grid,
                        seen(agent(_,loc(X,Y))), 
                    (west(NW1) \= west(0), 
                       south(Bound) \= south(0), 
                       Bound1 is W + NW1 + Bound, 
                       loc_to_percept(West,NW1+72,Bound, N1)
                     ; not(memberchk(east(Wind)),east(north(Bounds))), loc(loc(X,Y)) :-
                            grid,
                            seen(agent(_,loc(X,Y))),
                        (north(96+B) \= north(0),
  						south(Bound) \= south(0), 
  						Bound1 is W + NW1 + 78, 
  						loc_to_percept(West,NW1+72, N1)
				 )

loc(loc(_,Y)) :-
	grid,
	seen(dirt(_)),
    (not(memberchk(south(B)))), loc(loc(X,Y)): grid,
    seen(agent(_,D,_) ), not(memberchk(east(E))), Bound1 is NW1 + (96+E), loc_to_percept(NW1+78,Bound1, X).

loc(loc(Y, )) :-
	grid,
	seen(dirt(_)),
    (not(memberchk(west(W)))),  loc(loc(_,Y)) :- grid,
    seen(agent(_,D,_) ), not(memberchk(south(S))), Bound1 is NE1 + (96+S), loc_to_percept(NE1+NW1+78,Bound1).

loc(loc(X, )) :-
	grid, 
    seen(dirt(_)),
    (not(memberchk(east(E)))), 	loc(loc(X,Y)) :- grid,
    seen(agent(_,D,_)), not(memberchk(north(N))), Bound1 is NW1 + (96-N) + X, loc_to_percept(NE1+NW1+78,Bound1).

loc(loc(Y,Z)) :-
	grid,
	seen(dirt(_)),
    not((memberchk(south(S),south()), memberchk(west(W),west()))) ; 
	loc(loc(_,Y)), seen(agent(_,D,_)), X \= NW1 + (96+N*W-E) ; loc(loc(X,Y)),  seen(agent(_,D,_)), Z = NE1 + NW1 + E, not(memberchk(east(E),east())), NW1 \= 0.

loc(loc(_,E)) :-
	grid,
	seen(dirt(_)),
    not((memberchk(west(W),west()), memberchk(south(S),south()))) ; 
	loc(loc(X,_)), seen(agent(_,D,_)), X \= Y + (96+N*W-E) ; loc(loc(X,Z)),  seen(agent(_,D,_)), Z = E - NW1 - 78, not(memberchk(west(W),west())), NE1 \= 0.

loc(loc(E,Y)) :-
	grid,
    seen(dirt(_)),
    not((memberchk(south(S),south()), memberchk(east(E),east()))) ; 
	loc(loc(_,Y)), seen(agent(_,D,_)), X = NW1 + (96+N*W-E) ; loc(loc(X,Z)), seen(agent(_,D,_)), Y \= Z - NW1 - 78, not(memberchk(west(W),west())), E \= NE1 + 78.

loc(loc(E,Y)) :-
	grid,
    seen(dirt(_)),
    not((memberchk(east(E),east()), memberchk(north(N),north()))) ; 
	loc(loc(_,Y)), seen(agent(_,D,_)), X = E - NW1- NW1 - 78, Y \= Z + 96 \= W \= W+X \= S \= NW1+NW1+78. 

loc(loc(Y,E)) :-
	grid,
    seen(dirt(_)),
    not((memberchk(west(W),west()), memberchk(north(N),north()))) ; 
	loc(loc(X,Y)), seen(agent(_,D,_)), Y = E - NE1 + 96 \= W \= X \= S \= NW1+NW1+78. 

walldir(loc((X,X))) :- grid, walldir(north(W),X,N), loc_to_percept(N,W).

walldir(loc((X,X))) :-
	grid,
    seen(agent(_,_,green)),
    found_by(_:loc(X,Y)) :-
        percept(log),
        member(percept(found_by(_:loc(X,Y)),_).