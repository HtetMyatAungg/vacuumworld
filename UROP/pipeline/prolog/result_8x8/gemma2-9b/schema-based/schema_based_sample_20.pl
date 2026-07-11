grid_size(8).
grid(X,Y) :- 0 =< X, X =< 7, 0 =< Y, Y =< 7.
dirt(X,Y, Colour) :-  exists_in_percept_log(X, Y, 'dirt',Colour). %Dirt at a coordinate in the percept log.
agent(Id, X, Y, Colour) :- exists_in_percept_log(X, Y, 'agent', Id, Colour).   %Agent at a coordinate.

empty(X,Y) :-  not(exists_dirt(X, Y)), not(exists_agent(X, Y)).

exists_in_percept_log(Row, Col, dirt, _Colour) :- member({coord:[Row,Col],dirt: Colour} , Percepts).
exists_in_percept_log(Row, Col, agent, Id, Colour) :- member({coord:[Row,Col],agent:{id:Id, colour:Colour}} , Percepts).

exists_dirt(X, Y) :-  exists_in_percept_log(X,Y, 'dirt', _Color).
exists_agent(X, Y) :-  exists_in_percept_log(X,Y, 'agent', _Id, _Colour).



wall(0,Y, 'north').
wall(7,Y, 'south').
wall(X,0, 'west').
wall(X,7, 'east').



