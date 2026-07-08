% Define the size of the grid (N x N)
n(8).

% Represent the grid as a list of lists. Each element represents a cell.
% 'empty' indicates an empty cell, 'wall' indicates a wall, and 'agent' holds agent data.
grid(Grid) :-
    findall(Cell, 0..n(1)-1, (
        Cell = [Row, Col]
    ), Grid).

% Define the walls for each cell.  Walls are represented as a list of strings ("north", "south", "east", "west").
walls(Grid) :-
    findall(WallList, 0..n(1)-1, (
        Cell = [Row, Col],
          WallList = calculate_walls(Row, Col, Grid)

    ), WallList).


% Helper predicate to actually calculates the walls based on neighborhood
calculate_walls(Row,Col,Grid) :-
  adjacent_cells(Row,Col,Neighbours),
  wall_list(Neighbours,WallList).

% Function that returns a list of adjacent cells for coordinate (Row, Col).
adjacent_cells(Row,Col,Neighbours) :-
    findall([r,c], (abs(r-Row)<n(1), abs(c-Col)<n(1)), Neighbours).

% Helper predicate for checking walls based on neighbor coordinates
wall_list([],[]).
wall_list([Cell|Rest],Walls) :-
  get_walls(Cell, Walls),
  wall_list(Rest,Walls).


% Get the wall data of a grid, returns a list of cells and surrounding walls.
get_walls([Row,Col], WallList) :-
  findall(Wall, ( (Wall in ["north", "south", "east", "west"]), adjacent_cells(Row, Col, Neighbours)), WallList).

% Example usage:
% ?- grid(Grid), walls(Grid).