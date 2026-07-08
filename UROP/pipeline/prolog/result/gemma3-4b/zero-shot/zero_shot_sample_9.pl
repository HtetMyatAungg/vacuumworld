% Define the size of the grid (N x N) - Assuming a 7x7 grid based on percept log
grid_size := 7.

% Representation for a cell in the grid:
%   agent(id, colour).
%   dirt(colour).
%   wall('north', 'south', 'east', 'west').

% Define predicates to represent the grid cells:
cell(X, Y) :-
    0 < X < grid_size + 1,
    0 < Y < grid_size + 1.

% Walls for each cell - initialized to empty
walls(X, Y) :-
    cell(X, Y),
    wall_north(X, Y),
    wall_south(X, Y),
    wall_east(X, Y),
    wall_west(X, Y).

% Define the wall relationships for each cell:
wall_north(X, Y) :-
    Y < grid_size,
    !.

wall_south(X, Y) :-
    Y > 1,
    !.

wall_east(X, Y) :-
    X < grid_size,
    !.

wall_west(X, Y) :-
    X > 1,
    !.


% Define the content of each cell (agent, dirt):
agent(X, Y, id, colour) :-
    cell(X, Y),
    id = '9af04778-08d6-4e40-8c6f-ba123d292a22',
    colour = 'orange'.

agent(X, Y, id, colour) :-
    cell(X, Y),
    id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',
    colour = 'green'.

dirt(X, Y, colour) :-
    cell(X, Y),
    colour = 'orange'.

dirt(X, Y, colour) :-
    cell(X, Y),
    colour = 'green'.

% Define the initial state of the grid:
init_grid() :-
    forall(cell(_, _), \+ (agent(_, _, _, _))),
    forall(cell(_, _), \+ (dirt(_))),
    forall(cell(_, _), walls(_)).
