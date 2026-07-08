% Define the size of the square grid (N x N) - Assuming a 7x7 grid for this example.  This needs to be configurable in a real implementation.
grid_size := 7.

% Representation:  A grid is represented as a list of lists,
% where each inner list represents a row.

% Facts:
%   agent(Id, Colour) - Indicates an agent at a particular location with a specific ID and colour.
%   dirt(Coord, Colour) - Indicates dirt at a particular location with a specific colour.
%   wall(Coord, Direction) - Indicates a wall at a particular location in a specific direction.

% Define the grid as a predicate to easily access its contents. The initial state is all empty.
grid(X, Y, []) :-
    X = 0, Y = 0;
    X > 0, Y > 0, X < grid_size + 1 , Y < grid_size+1,
    Y= 0,
   true.

grid(X, Y, Row) :-
  Row = [[]] ;
  length(Row, GridSize).


% Rules for constructing the knowledge base:
walls(Coord, Direction) :-
    Coord = [X, Y],
    X >= 0, X < grid_size + 1,
    Y>= 0, Y < grid_size + 1,
    Direction = west | south | east | north.

agent(Id, Colour) :-
    Id = "9af04778-08d6-4e40-8c6f-ba123d292a22",
    Colour = orange.

agent(Id, Colour) :-
  Id = "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c",
    Colour = green.


dirt(Coord, Colour) :-
    Coord = [X, Y],
    X >= 0, X < grid_size + 1,
    Y>= 0, Y < grid_size + 1,
    Colour = orange | green .

% Example instances:
/*
  [
   {
      "coord": [
       0,
        6
     ],
     "walls": [],
     "dirt": null,
     "agent": null
   },
   ...
 */