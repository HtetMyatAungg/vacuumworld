n(8).

% Representation:
%   grid(X, Y) - Represents a cell at column X, row Y
%   wall(Cell, Direction) - Indicates whether there is a wall in the given direction for the cell
%   dirt(Cell) - Indicates if dirt is present on the cell
%   agent(Cell, AgentID) - Maps an agent ID to its location

% Initial state: all cells are empty (no walls, dirt, or agents)
initial_grid([
    grid(0, 0), grid(0, 1), grid(0, 2), grid(0, 3), grid(0, 4), grid(0, 5), grid(0, 6), grid(0, 7),
    grid(1, 0), grid(1, 1), grid(1, 2), grid(1, 3), grid(1, 4), grid(1, 5), grid(1, 6), grid(1, 7),
    grid(2, 0), grid(2, 1), grid(2, 2), grid(2, 3), grid(2, 4), grid(2, 5), grid(2, 6), grid(2, 7),
    grid(3, 0), grid(3, 1), grid(3, 2), grid(3, 3), grid(3, 4), grid(3, 5), grid(3, 6), grid(3, 7),
    grid(4, 0), grid(4, 1), grid(4, 2), grid(4, 3), grid(4, 4), grid(4, 5), grid(4, 6), grid(4, 7),
    grid(5, 0), grid(5, 1), grid(5, 2), grid(5, 3), grid(5, 4), grid(5, 5), grid(5, 6), grid(5, 7),
    grid(6, 0), grid(6, 1), grid(6, 2), grid(6, 3), grid(6, 4), grid(6, 5), grid(6, 6), grid(6, 7),
    grid(7, 0), grid(7, 1), grid(7, 2), grid(7, 3), grid(7, 4), grid(7, 5), grid(7, 6), grid(7, 7)
]).

% Define wall rules (these are just examples and could be more complex):
wall_rules([
    {grid(0, 0), "west"},  % North-West corner wall
    {grid(0, 1), "west"},  % North-West corner wall
    {grid(0, 2), "west"},   % North East corner wall
    {grid(0, 7), "south"}, % Bottom West
    {grid(0, 8), "south"},%Bottom Center West
    {grid(1, 0), "north"},
    {grid(1, 1), "north"},
    {grid(1, 2), "east"},
    {grid(1, 7), "south"}, % Bottom East
    {grid(1, 8), "east"},%Bottom Center East
    {grid(2, 0), "north"},
    {grid(2, 1), "east"},
    {grid(2, 7), "south"}, %Bottom South
    {grid(2, 8), "west"},%Bottom Center West

     {grid(3, 4), "north"},
    {grid(3, 5), "east"},
    {grid(3, 6), "east"},
    {grid(3, 7), "south"}, % Bottom South East
    {grid(4, 4), "north"},
     {grid(4, 5), "east"},
    {grid(4, 6), "east"},
    {grid(4, 7), "south"}, %Bottom South West

    {grid(5, 0), "north"},
    {grid(5, 1), "east"},

    {grid(6, 0), "west"},
    {grid(6, 1), "west"},
    {grid(6, 2), "west"},
    {grid(6, 3), "west"},
    {grid(6, 4), "west"},
    {grid(6, 5), "west"},
    {grid(6, 6), "west"},
    {grid(6, 7), "west"}

]).