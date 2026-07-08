% Define the size of the square grid (N x N).
grid_size := 8.

% Represent the grid as a list of lists.
% Each element in the list represents a cell.
% The cells are represented as tuples: (X, Y, walls, content)
% where X and Y are coordinates (0 to N-1),
% walls is a list of wall directions ("north", "south", "east", "west"),
% and content is either null or a string representing the object in that cell.

% Initialize the grid with empty cells.
grid(X, Y, [], null) :-
    X >= 0, X < grid_size,
    Y >= 0, Y < grid_size.

% Define the structure of a single cell within the grid
cell(X, Y, Walls, Content) :-
    grid_size = N,
    X in [0..N-1],
    Y in [0..N-1],
    Walls is [],
    Content is null.

% Define rules for creating cells with walls.
wall_cell(X, Y, Walls, Content) :-
    X in [0..N-1],
    Y in [0..N-1],
    Walls is Walls,
    Content is null.

% Define the structure of a cell that contains an agent.
agent_cell(X, Y, Walls, Agent) :-
    X in [0..N-1],
    Y in [0..N-1],
    Walls is Walls,
    Agent = {id: AgentId, colour: AgentColour}.

% Define the structure of a cell that contains dirt.
dirt_cell(X, Y, Walls, Dirt) :-
    X in [0..N-1],
    Y in [0..N-1],
    Walls is Walls,
    Dirt is Dirt.

% Initial grid configuration (This could be extended based on the percept log)
initial_grid(N) :-
    N = grid_size,
    forall(
      (X <- [0..(N-1)], Y <- [0..(N-1)] ,
        cell(X, Y, [], null))
    ).