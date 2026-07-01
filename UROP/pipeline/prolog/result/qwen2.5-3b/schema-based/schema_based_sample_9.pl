grid_size(7).

grid(loc(X,Y)) :-
    X in 0..6,
    Y in 0..7.

seen(dirt(loc(X,Y), Colour)) :-
    grid(loc(X,Y)),
    percept(
      coord([X,Y]),
      walls([]),
      dirt(Colour).
seen(agent(Id, loc(X,Y), Colour)) :-
    grid(loc(X,Y)),
    percept(coord([X,Y]), walls([]), agent(Id,Colour).

seen(dirt(loc(X,Y))) :- 
    seen(dirt(loc(X,Y), _)).
seen(agent(_,loc(X,Y),_)) :- 
    seen(agent(_,loc(X,Y), _)).
empty_location(loc(_X,_Y)) :-
    grid(loc(_X,_Y)),
    \+ seen(dirt(loc(_X,_Y),'red')),
    \+ seen(agent(_,loc(_X,_Y),'orange')).

wall(loc(_X,_Y), north) :- 
    grid(loc(_X,_Y)),
    X > 0.
wal
loc(_X,_Y), south) :- 
    grid(loc(_X,_Y)),
    X < 6.  
wal
loc(_X,_Y), west) :-
    grid(loc(_X,_Y)).
wall(loc(_X,_Y), east) :-
    grid(loc(_X,_Y)),
    mod(X,2) \= 0.