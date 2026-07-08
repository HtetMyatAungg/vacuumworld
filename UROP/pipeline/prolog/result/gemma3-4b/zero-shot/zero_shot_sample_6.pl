% Define the size of the grid (N x N).  Assuming a square grid for simplicity.
grid_size := 8.

% Representation:
%   grid(X, Y) - Represents a cell in the grid at coordinates (X, Y).
%   wall(Cell, Direction) - Indicates a wall present at that cell in the given direction.
%   dirt(Cell, Color) - Indicates dirt present at the cell and its optional color.
%   agent(AgentID, Cell, Color) - Represents an agent at a specific cell with its ID and color.

% Define the grid structure:
grid(X, Y) :-
    X >= 0, X < grid_size,
    Y >= 0, Y < grid_size,
    !.


% Wall rules (represented as facts):
wall(0, 0) :-  % North wall of the NW corner
    grid(0, 0).

wall(0, 7) :- % South wall of the N-West corner
   grid(0, 7).

wall(1, 0) :- %North wall of the NW corner
   grid(1, 0).

wall(1, 7) :- %South Wall of the NW Corner
    grid(1, 7).    

wall(2, 0) :- % North wall of the N-West corner.
    grid(2, 0).

wall(2, 7) :-  % South wall of the N-West corner.
   grid(2, 7).

wall(3,0) :- %North Wall of NW Corner
    grid(3, 0).

wall(3, 7) :- %South Wall of the NW Corner
     grid(3, 7).

wall(4,0) :- % North wall for the NE corner.
   grid(4, 0).

wall(4,7) :- %South wall for the NE corner.
    grid(4, 7). 

wall(5,0) :-  %North Wall of the nE Corner
    grid(5, 0).

wall(5,7) :- % South Wall of the nE Corner
   grid(5,7).

wall(6,0) :- % North wall for N-East corner.
    grid(6, 0).

wall(6, 7) :-  %South wall for N-East corner.
   grid(6, 7).

wall(7,0) :- %North Wall of the NE Corner
    grid(7,0).

wall(7,7) :-% South Wall of the NE Corner
   grid(7,7).

% Dirt rules (represented as facts):
dirt(0, 0) :-  % Dirt at NW corner.
    grid(0, 0),
    !.

dirt(1, 6) :- % Dirt at (1, 6)
    grid(1, 6),
    !.

dirt(2, 6) :- %Dirt at (2, 6)
   grid(2, 6),
   !.

dirt(0, 7) :-  % Dirt at N-West corner
    grid(0, 7),
    !.

dirt(1, 7) :- %Dirt at (1,7)
    grid(1, 7),
    !.

dirt(2, 7) :- %Dirt at (2, 7)
   grid(2, 7),
   !.

dirt(0, 5) :-  % Dirt at (0, 5)
    grid(0, 5),
    !.

dirt(1, 5) :- %Dirt at (1, 5)
   grid(1, 5),
   !.

dirt(2, 5) :- %Dirt at (2, 5)
   grid(2, 5),
   !.

dirt(0, 4) :-  % Dirt at (0, 4)
    grid(0, 4),
    !.

dirt(1, 4) :- %Dirt at (1, 4)
   grid(1, 4),
   !.

dirt(2, 4) :- %Dirt at (2, 4)
   grid(2