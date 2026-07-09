grid_size(12).

grid(X,Y) :-
    X between 0,11,
    Y between 0,11.

dirt(X,Y,Colour) :-
    (X == 0;
     X == 7;
     X == 4),
    (Y == 3; not(grid(X-1,Y));
     grid(X,Y);
     Y == 5),
    Colour = orange.

agent(Id,X,Y,Colour) :-
    (not(grid(X-1,Y)),
     X between 0,7;
     (grid(X-1,Y); grid(X-2,Y));   % for the cases where agent is not on a wall
     Colour = colour(Id)),

dirt(X,Y,_Colour),
agent(Id,X,Y,_Colour).

empty(X,Y) :-
    \+((grid(X,Y);
        dirt(X,Y,_);
        agent(_,X,Y,_); not(grid(X,Y), grid(X-1,Y)).
wall(X,Y,north) :- X != 0, grid(X,Y).
wall(X,Y,south) :- X != 11, grid(X,Y).
wall(X,Y,east) :- Y != 11, grid(X,Y).
wall(X,Y,west) :- X != 0, grid(X,Y).