grid(0, [wall(west)]).
grid(N, Cords) :-
  N > 0,
  between(0, N-1, N2),
  grid(N2, NextCords),
  append(NextCords, [N], Cords).

coordinate(X, Y) -->
  { coordinate(0, Y), X = 0 },
  { coordinate(N, Y), N > 0, (X <= N, X > 1) }.

% Walls
wall(west).
forall(coordinate(_Y, Y)/N:-(coordinate(X, Y)), grid(N)) :-
  \+ wall(west),
  walls_west(0, 0, N-1, N).

walls_west(_, Y, X2, N) :-
  (X2 < X, wall(west); coordinate(X, Y)),
walls_west(N, Y, N, N).
walls_west(X, Y, NextX, N) :-
  walls_west(NextX, Y, NextX-1, N).

% Agent states
agent(agent_id(_Id), _Cord),
agent(agent_colour(orange), [coordinate(0, 6); coordinate(4, 8)]),
agent(agent_colour(green), [2;5;7]).

% Initial state
state(grid(N), X0/1, walls(west/south)/N, coord(X/Y)/1, N, agent_id/1,
       agent_colour/1).

% States transitions
next_state(state(Grid/N, _, _, Agents/CordN, AgentIDs/IDN, AgentColours/ColourN),
           grid(GridNew/N2), walls/0, coord(NextX/NextY), NextAgentID/IDN, NextAgentColour/ColourN)
<-
  NextX <~ [0],
  wall(west)/N2,
  coordinate(N, Y) <--> (NextX = X \<- wall(south)),
  agent(agent_id(X)/1CordNew -> N2 <-\> (agent(agentID/X)/AgentIDs),
  next_agent_id(NewId), NextAgentID = \(X, AgentIDs),
  NextAgentColours/ColourN,
  agent_colour(agent_colour(X/N)/ColourN).

next_state(state(_Grid/4, _X0, _, AgentIDs/1CordNew, AgentID/IDN, Agents_Colour_IDN),
           state(grid(N+1)/N2, X/Y, walls(south)/N2, coord(NextX/NextY), NextAgentID/IDN, NextAgentColour/ColourN),
  [wall(south)], next_state) :-
  outside(state(Grid, X0, walls(west/south)/N, X/Cord/1CordNew,
                       AgentIDs/IDN, agent_colour(ColourNew),
                       Agents/CordsN)) :- grid(N+1), walls/2 \+(X = N -> wall(south)),
        (agent(agentID/X)/AgentIDs -> next_state(state/Grid, X0, walls(west/south)/N, coord(X/Y, Agent_ids),
                                                 ID_N, agent_colour(ColourNew))),
outside(grid(0)).

% Agents states
is_cleaned(grid(1)).
next_state(state(Grid/4, N, walls(west/south)/South), state(Grid/4, N, walls(west/south)/South) :-
  (X/N /= Id \ X).

% Boundaries
outside(grid(0)).

% Goal: No agents present
no_agents(state(grid(_)), _).