% Section A — Translation facts:

% Assert the following ground facts from the percept log:
% grid_size(N) where N is the side length of the grid.
grid_size(7).

% grid(X,Y) are facts with the entire grid coordinates.
grid(x,y) :- x in [0..7], y in [0..7].

% dirt(X,Y, Colour) for each cell containing dirt.
dirt(3, 3, orange).
dirt(6, 4, orange).
dirt(5, 1, green).

% agent(Id, X,Y, Colour) for each cell containing an agent.
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 3, 3, orange).
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4, 0, green).


% empty(X,Y) for each cell that has neither dirt nor an agent.
empty(x,y) :- x in [0..7], y in [0..7], not (dirt(x,y,'') or agent( _, x, y, _ )).

% Section B — Wall rules:

% wall(X,Y, Dir) rules for boundary walls.
% Your rules must generalise — they should work for any grid size, not just the one observed.
% Do not enumerate wall(X,Y, Dir) as facts.

wall(x, 0, 'west') :- x in [1..7].
wall(x, 0, 'east') :- x in [0..6].
wall(0, y, 'north') :- y in [1..7].
wall(0, y, 'south') :- y in [0..6].
wall(7, y, 'west') :- y in [1..7].
wall(7, y, 'east') :- y in [0..6].
wall(x, 7, 'north') :- x in [1..7].
wall(x, 7, 'south') :- x in [0..6].