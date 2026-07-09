grid_size(8).

wall(X,Y,north).
wall(X,Y,south).
wall(X,Y,east).
wall(X,Y,west).

empty(0,5).

agent(Id,X,Y,Colour) :-
    grid(X,Y),  
    agent_at(Id,X,Y,Colour).

dirt(C1,C2,Colour) :-
    grid(C1,C2),
    dirt_at(C1,C2,Colour).

grid(X,Y) :- X = 0, Y between 6 and 7.

grid(X,Y) :- Y = 0, (X between 1 and 7; Y is 4 ; X is 3), (Y between 5 and 6).

grid(X,Y) :- (X is 7; Y is 7).

empty(X,Y) :-
    \+ agent(Id,X,Y,_),
    \+ dirt(C1,C2,Color),
    grid(X,Y).

walk(X,Y,north) :-
    grid(X,Y), 
    Y > 0,
    not wall(X1,Y-1,north).

walk(X,Y,south) :-
    grid(X,Y),    
    ((X < 7 ; X = 8), (Y is 7)) | ((X is 7; (Y,Y2 is between(0,Y,X))), wall(X1,Y2,north)).

walk(X,Y,east) :-
    grid(X,Y),
    (X not = 7), 
    not walk(X1,Y,south).

walk(X,Y,west) :-
    grid(X,Y),
    X > 0,
    not wall(X1,Y,north). 

agent(Id,X,Y,Colour) :-    
    grid(X,Y),
    agent_at(Id,X,Y,Colour).

dirt(C1,C2,Colour) :-
    grid(C1,C2), 
    dirt_at(C1,C2,Colour).