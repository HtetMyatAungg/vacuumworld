% Define symbols for walls
wall(west)     :- true.
wall(east)     :- true.
wall(north)    :- true.
wall(south)    :- true.

% Define symbols for dirt
dirt(orange)   :- true.
dirt(green)    :- true.

% Define symbols for agents
agent(id, colour) :- true.

% Grid representation: a list of lists (2D array).
% Each element represents a cell and its contents.
grid(N) :-
    N >= 0,  % Ensure N is a non-negative integer
    0 is N, % Setting the grid size to NxN, where N is given as input.

    % Initialize an empty grid with dimensions N x N.
    grid_list = [[nil]];

    % Populate the grid based on the percept log
    populate_grid(N, grid_list).


% Helper predicate to populate the grid:
populate_grid(0, Grid) :-
    Grid = [[[]]].  % Base case: empty grid.

populate_grid(N, Grid) :-
    N > 0,
    NewRow = [nil],
    OldGrid = tail(Grid),
    append_row(OldGrid, NewRow, NewGrid),
    NewGrid = Result,
    populate_grid(N-1, Result).



% Helper predicate to append a row to the grid:
append_row([], Row, [Row]) :- !.
append_row([Head|Tail], Row, [Head|Result]) :-
  append_row(Tail, Row, Result).


% Example of how to query the grid (not part of the core definition)
%% ?- grid(5).