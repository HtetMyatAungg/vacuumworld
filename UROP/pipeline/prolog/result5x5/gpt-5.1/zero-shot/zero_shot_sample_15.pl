grid_size(5,5).

wall(0,0,west).
wall(0,0,north).
wall(1,0,north).
wall(2,0,north).
wall(3,0,north).
wall(4,0,north).
wall(4,0,east).
wall(0,1,west).
wall(4,1,east).
wall(0,2,west).
wall(4,2,east).
wall(0,3,west).
wall(4,3,east).
wall(0,4,west).
wall(0,4,south).
wall(1,4,south).
wall(2,4,south).
wall(3,4,south).
wall(4,4,south).
wall(4,4,east).

dirt(2,3,orange).
dirt(1,2,green).
dirt(3,1,orange).

agent(2,0,c942b0ce-6c70-4311-a5b7-6b2640fe417c,green).
agent(4,2,ec1d58f6-6db4-473d-af3e-518ca49c39f9,orange).

location(X,Y,Type) :-
    dirt(X,Y,_),
    Type = dirt.
location(X,Y,Type) :-
    agent(X,Y,_,_),
    Type = agent.
location(X,Y,empty) :-
    between(0,4,X),
    between(0,4,Y),
    \+ dirt(X,Y,_),
    \+ agent(X,Y,_,_).