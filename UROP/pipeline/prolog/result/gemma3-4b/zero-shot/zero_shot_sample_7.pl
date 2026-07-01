% Define the size of the square grid (N x N)
n(8).

% Representation: Grid is a list of lists.  Each cell contains:
%   - agent_id: atom representing the agent's ID (if present), or nil
%   - colour: atom representing the agent's color (if present), or nil
%   - walls: list of wall directions ('north', 'south', 'east', 'west')
%   - dirt: atom representing dirt presence ('orange', 'green', or null)

% Define the grid structure (N x N)
grid(N) :-
    n(N),
    create_grid(N).

% Helper predicate to create a blank grid
create_grid(0) :- !.
create_grid(N) :-
    findall([agent_id, colour, walls, dirt], [], grid_cells(N)).


% Predicate to populate the grid with data from the percept log
grid_cells(1) :-
    grid_cell(0, 0, nil, [], null),
    grid_cell(0, 1, nil, [], null),
    grid_cell(0, 2, nil, [], null),
    grid_cell(0, 3, nil, [], null),
    grid_cell(0, 4, nil, [], null),
    grid_cell(0, 5, nil, [], null),
    grid_cell(0, 6, nil, [], null),
    grid_cell(0, 7, ['west'], [], null),
    grid_cell(1, 0, ['north'], [], null),
    grid_cell(1, 1, [], [], null),
    grid_cell(1, 2, [], [], null),
    grid_cell(1, 3, [], [], null),
    grid_cell(1, 4, [], [], null),
    grid_cell(1, 5, [], [], null),
    grid_cell(1, 6, [], [], null),
    grid_cell(2, 0, ['north'], [], null),
    grid_cell(2, 1, [], [], null),
    grid_cell(2, 2, [], [], null),
    grid_cell(2, 3, [], [], null),
    grid_cell(2, 4, [], [], null),
    grid_cell(2, 5, [], [], null),
    grid_cell(2, 6, [], [], null),
    grid_cell(3, 0, ['west'], [], null),
    grid_cell(3, 1, [], [], null),
    grid_cell(3, 2, [], [], null),
    grid_cell(3, 3, ['south'], {'id' : '9af04778-08d6-4e40-8c6f-ba123d292a22', 'colour' : 'orange'}, null),
    grid_cell(3, 4, [], [], null),
    grid_cell(3, 5, [], [], null),
    grid_cell(4, 0, ['north'], [], null),
    grid_cell(4, 1, [], [], null),
    grid_cell(4, 2, [], [], null),
    grid_cell(4, 3, [], [], null),
    grid_cell(4, 4, [], [], null),
    grid_cell(4, 5, [], [], null),
    grid_cell(5, 0, ['north'], [], null),
    grid_cell(5, 1, {'id' : '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 'colour' : 'green'}, 'orange', null),
    grid_cell(5, 2, [], [], null),
    grid_cell(5, 3, [], [], null),
    grid_cell(5, 4, [], [], null),
    grid_cell(5, 5, [], [], null),
    grid_cell(6, 0, ['north'], [], null).

% Generic cell predicate -  Replace with more specific rules based on
% the percept log.