% Percept facts
dirt(X, Y, Colour)
agent(Id, X, Y, Colour)
location(X, Y)
History (percept stream, tagged by cycle)
perceived(Cycle, Observation)
% e.g. perceived(1, dirt(2,3, green))
     % perceived(3, agent(ag2))
     % perceived(3, location(ag2, (3,4)))
% Internal
grid_size(X)          % grid size
wall(X, Y, Dir)       % Dir in {north, south, ...}
empty_location(X, Y)
location(X, Y)

% State of the world — the set of percepts that hold at the final state, without repetition (dedup is required, see §3).
% Generalised knowledge
available(Action)     % e.g. move(X, Y, Dir), inaction (do nothing)
possible(Action)      % an action is possible
% Testing primitives
% Revise/log the percept to file → getPercepts → transformPerceptToSchema.
seen(Percept) % — a percept we expect the final state to contain.
% Test: for every member P of the final state, P must be a member of seen(P).
