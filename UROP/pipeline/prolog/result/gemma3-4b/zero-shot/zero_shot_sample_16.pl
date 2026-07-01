domain(0..7).
type(grid).
edge(cell, [north, south, east, west]).
wall(cell, direction) :- cell in [0..7], direction \in edge(cell).

% Define the grid as a set of cells.  N = 8 for an 8x8 grid.
grid([0,1,2,3,4,5,6,7]).
grid([0,1,2,3,4,5,6,7]).
grid([0,1,2,3,4,5,6,7]).
grid([0,1,2,3,4,5,6,7]).
grid([0,1,2,3,4,5,6,7]).
grid([0,1,2,3,4,5,6,7]).
grid([0,1,2,3,4,5,6,7]).
grid([0,1,2,3,4,5,6,7]).

% Define the walls for each cell.
wall(0, west).
wall(0, north).
wall(1, north).
wall(1, west).
wall(2, north).
wall(2, west).
wall(3, west).
wall(3, north).
wall(4, west).
wall(4, north).
wall(5, west).
wall(5, north).
wall(6, north).
wall(6, west).
wall(7, north).
wall(7, west).

% Define the dirt in each cell.
dirt([0, 0], null).
dirt([0, 1], null).
dirt([0, 2], null).
dirt([0, 3], {"9af04778-08d6-4e40-8c6f-ba123d292a22", "orange"}).
dirt([0, 4], null).
dirt([0, 5], null).
dirt([0, 6], null).
dirt([0, 7], ["south", "west"]).
dirt([1, 0], ["north"]).
dirt([1, 1], null).
dirt([1, 2], null).
dirt([1, 3], null).
dirt([1, 4], null).
dirt([1, 5], null).
dirt([1, 6], null).
dirt([1, 7], ["south"]).
dirt([2, 0], ["north", "west"]).
dirt([2, 1], null).
dirt([2, 2], null).
dirt([2, 3], null).
dirt([2, 4], null).
dirt([2, 5], null).
dirt([2, 6], null).
dirt([2, 7], ["south"]).
dirt([3, 0], null).
dirt([3, 1], null).
dirt([3, 2], null).
dirt([3, 3], null).
dirt([3, 4], ["south", "west"]).
dirt([3, 5], null).
dirt([3, 6], null).
dirt([3, 7], ["south"]).
dirt([4, 0], null).
dirt([4, 1], null).
dirt([4, 2], null).
dirt([4, 3], null).
dirt([4, 4], null).
dirt([4, 5], null).
dirt([4, 6], {"orange", null}).
dirt([4, 7], ["south"]).
dirt([5, 0], ["north"]).
dirt([5, 1], {"green", null}).
dirt([5, 2], null).
dirt([5, 3], null).
dirt([5, 4], null).
dirt([5, 5], null).
dirt([5, 6], null).
dirt([5, 7], ["south"]).
dirt([6, 0], ["north"]).
dirt([6, 1], null).
dirt([6, 2], null).
dirt([6, 3], null).
dirt([6, 4], {"orange", null}).
dirt([6, 5], null).
dirt([6, 6], null).
dirt([6, 7], ["south"]).
dirt([7, 0], ["east", "north"]).
dirt([7, 1], ["east"]).
dirt([7, 2], ["east"]).
dirt([7, 3], ["east"]).
dirt([7, 4], ["east"]).
dirt([7, 5], ["east"]).
dirt([7, 6], ["east"]).