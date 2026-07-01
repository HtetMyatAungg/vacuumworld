Section A — Translation facts:
grid_size(8).
grid(loc(0,0)).
grid(loc(1,0)).
grid(loc(2,0)).
grid(loc(3,0)).
grid(loc(4,0)).
grid(loc(5,0)).
grid(loc(6,0)).
grid(loc(7,0)).
grid(loc(0,1)).
grid(loc(1,1)).
grid(loc(2,1)).
grid(loc(3,1)).
grid(loc(4,1)).
grid(loc(5,1)).
grid(loc(6,1)).
grid(loc(7,1)).
grid(loc(0,2)).
grid(loc(1,2)).
grid(loc(2,2)).
grid(loc(3,2)).
grid(loc(4,2)).
grid(loc(5,2)).
grid(loc(6,2)).
grid(loc(7,2)).
grid(loc(0,3)).
grid(loc(1,3)).
grid(loc(2,3)).
grid(loc(3,3)).
grid(loc(4,3)).
grid(loc(5,3)).
grid(loc(6,3)).
grid(loc(7,3)).
grid(loc(0,4)).
grid(loc(1,4)).
grid(loc(2,4)).
grid(loc(3,4)).
grid(loc(4,4)).
grid(loc(5,4)).
grid(loc(6,4)).
grid(loc(7,4)).
grid(loc(0,5)).
grid(loc(1,5)).
grid(loc(2,5)).
grid(loc(3,5)).
grid(loc(4,5)).
grid(loc(5,5)).
grid(loc(6,5)).
grid(loc(7,5)).
grid(loc(0,6)).
grid(loc(1,6)).
grid(loc(2,6)).
grid(loc(3,6)).
grid(loc(4,6)).
grid(loc(5,6)).
grid(loc(6,6)).
grid(loc(7,6)).
grid(loc(0,7)).
grid(loc(1,7)).
grid(loc(2,7)).
grid(loc(3,7)).
grid(loc(4,7)).
grid(loc(5,7)).
grid(loc(6,7)).
grid(loc(7,7)).
seen(dirt(loc(X,Y), Colour)) :-
  seen(Dirt),
  var(Colour), Dirt \= null,
  seen_dirt_colour(Dirt, Colour).
seen(agent(Id, loc(X,Y), Colour)) :-
  seen(AgentId),
  seen_agent_id(AgentId, Id),
  var(Colour), AgentColour \= null,
  seen_agent_colour(AgentId, AgentColour).
empty_location(loc(X,Y)) :-
  grid(loc(X,Y)),
  not seen(Dirt),
  not seen(agent(_, loc(X,Y), _)).
Section B — Walk rules:
wall(loc(0,Y), north) :- wall(loc(0,Y), X1, Y1), wall(loc(X1,Y1), X2, Y2), wall(loc(X2,Y2), 0, Y).
walldir(wall(loc(X,Y), north), loc(X-1,Y)).
walldir(walk(loc(X,Y), south), loc(X+1,Y)).
walldir(walk(loc(X,Y), west), loc(X,Y-1)).
walldir(walk(loc(X,Y), east), loc(X,Y+1)).

wall(loc(0,7), north).
walldir(walk(loc(0,6), west), loc(0,5)).
walldir(walk(loc(0,5), south), loc(1,5)).