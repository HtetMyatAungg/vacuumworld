% Define the size of the grid (N x N)
grid_size(8).

% Represent the grid as a table of facts.
% Each fact represents a cell in the grid.
% The fact name is the coordinate (X, Y).
% The value of the fact is a list of wall types and contents present in that cell.

% Example:
% coord(0, 0) :- wall('north', 'west').
% coord(1, 0) :- wall('north').
% coord(2, 0) :- empty.

% Define a predicate to add a coordinate's data to the grid table.
coord(X, Y) :-
    Y = 0..grid_size(1)-1,  % Ensure Y is within the grid bounds
    integer(X),
    integer(Y),
    wall(Walls, Content), % Define Walls and Content,
    (   Walls = [] ->
        Content = null % Indicates empty cell (no walls & no content)
    );
    (   Walls = ['north', 'west'] ->
        Content = {id: "9af04778-08d6-4e40-8c6f-ba123d292a22", colour: "orange"} % Agent in cell
    );
   (  Walls = [] -> Content = null );% default empty if no walls and agent is null

% Define wall types.
wall('north', _).
wall('south', _).
wall('east', _).
wall('west', _).

% Define empty cell, which means there's nothing in the grid cell.
empty().
