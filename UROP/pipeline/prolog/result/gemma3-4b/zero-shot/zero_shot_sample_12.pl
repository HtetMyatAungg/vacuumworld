% Define the size of the grid (N x N)
n(8).

% Represent the grid as a list of lists
grid([X | Y]...) :-
    findall(Row, length(Row, X), [Row]),
    append(Y, [], grid).


% Representation for a cell in the grid
cell((X, Y), Wall, Dirt, Agent) :-
    X >= 0, X < n(8),
    Y >= 0, Y < n(8),

    % Walls
    (   Wall = "north"      if Y = 0;
        Wall = "south"      if Y = n(8)-1;
        Wall = "west"        if X = 0;
        Wall = "east"        if X = n(8)-1;
        true
    ),

    % Dirt
    Dirt = null  % No dirt unless explicitly stated, otherwise represent as null.
    % Agent - optional
    Agent = null % Default: no agent.


% Define a predicate to find cells with dirt
dirt_cells(Grid) :-
    findall((X, Y), cell((X, Y), DirtList, Dirt, _),DirtList,DirtCells).

% Define a predicate to find cells with agents
agent_cells(Grid) :-
    findall((X, Y), cell((X, Y), _, _, AgentList),AgentList,AgentCells).



% Example usage:  Query for all dirt cells.
% dirt_cells(Grid).

% Example query : Get grid representation as a list of lists in nested format
%grid([0..7]).