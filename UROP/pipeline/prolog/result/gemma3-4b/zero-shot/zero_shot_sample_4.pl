% Define the size of the grid (N x N)
grid_size(8).

% Representation for a cell in the grid
% Each cell has coordinates and a list of walls surrounding it.
% dirt can be null or a string representing the dirt type
% agents are represented by their unique id

% Define predicates to represent the state of each cell
cell(X, Y) :-
    0 < X < grid_size(X),
    0 < Y < grid_size(Y).

wall(X, Y, Wall) :-
    X = 0,
    Y = Y,
    Wall = "west";
    X = X,
    Y = 0,
    Wall = "south";
    X = X,
    Y = Y,
    Wall = "east";
    X = 0,
    Y = Y,
    Wall = "north".

% Predicate to represent the content of a cell (agent or dirt)
content(X, Y, Dirt | Agent) :-
    cell(X, Y),
    (   Dirt == null -> true
    ;   Dirt \== ""
    ).

agent_id(X, Y, Id) :-
    cell(X, Y),
    member(Id, (string(Ids)),  % Ensure Id is a string
           (   agent(AgentId, _) 
            <- percept_log,
            AgentId = [X,Y],
            Ids = AgentId 
           )
       ).

% Predicate to represent wall states at each cell
walls(X, Y, Walls) :-
    cell(X, Y),
    findall(Wall, (wall(X,Y,Wall)), Walls).


% Example percept log data as a list of facts.  This allows queries and deduction.
percept_log := [
  {coord: [0, 6], walls: ["west"], dirt: null, agent: null},
  {coord: [1, 6], walls: [], dirt: null, agent: null},
  {coord: [2, 6], walls: [], dirt: null, agent: null},
  {coord: [0, 7], walls: ["south", "west"], dirt: null, agent: null},
  {coord: [1, 7], walls: ["south"], dirt: null, agent: null},
  {coord: [2, 7], walls: ["south"], dirt: null, agent: null},
  {coord: [0, 5], walls: ["west"], dirt: null, agent: null},
  {coord: [1, 5], walls: [], dirt: null, agent: null},
  {coord: [2, 5], walls: [], dirt: null, agent: null},
  {coord: [0, 4], walls: ["west"], dirt: null, agent: null},
  {coord: [1, 4], walls: [], dirt: null, agent: null},
  {coord: [2, 4], walls: [], dirt: null, agent: null},
  {coord: [0, 3], walls: ["west"], dirt: {'id': '9af04778-08d6-4e40-8c6f-ba123d292a22', 'colour': 'orange'}}, agent: null},
  {coord: [1, 3], walls: [], dirt: null, agent: null},
  {coord: [2, 3], walls: [], dirt: null, agent: null},
  {coord: [0, 2], walls: ["west"], dirt: null, agent: null},
  {coord: [1, 2], walls: [], dirt: null, agent: null},
  {coord: [2, 2], walls: [], dirt: null, agent: null},
  {coord: [0, 1], walls: ["west"], dirt: null, agent: null},
  {coord: [1, 1], walls: [], dirt: null, agent: null},
  {coord: [2, 1], walls: [], dirt: 'orange', agent: null},
  {coord: [0, 0], walls: ["north",