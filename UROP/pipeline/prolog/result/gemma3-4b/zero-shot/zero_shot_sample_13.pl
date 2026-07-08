% Define the size of the grid (N x N)
n(5).

% Representation of the grid as a list of lists
grid([X | Ys]) = [[x | Ys] | [Y | Zs]] where X in [0..n(1)-1], Ys in [0..n(1)-1], Zs in 0..n(1)-1].

% Define the walls for each cell
walls((X, Y), W) :-
  W ins [north, south, east, west],
  ( X = 0 -> (W == north, W == west);
    (X = n(1) - 1 -> (W == south, W == east));
    true).

% Define the agent type and colour for each cell. Using a separate predicate for that
agent((X, Y), Agent) :-
  Agent.id @= '9af04778-08d6-4e40-8c6f-ba123d292a22',
  Agent.colour @= 'orange'.

agent((X, Y), Agent) :-
  Agent.id @= '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',
  Agent.colour @= 'green'.

% Define the dirt for each cell.
dirt((X, Y), Dirt) :-
  Dirt ins ['orange','green'],
  true.

% Define the structure of a percept log entry.
percept_log_entry(Entry) :-
    coord(X, Y),
    walls(X, Y),
    dirt(X, Y),
    agent(X,Y).

% Generate a complete representation of the grid
grid_representation:-
  n(5), % Assume 5x5 grid for this example and simplify. Modify accordingly
  findall(Entry, (
           member(Coord, range(0, n(1) - 1)),
           (
              (walls(Coord, Walls), dirt(Coord, Dirt), agent(Coord, Agent)) when Walls != [] and Dirt != null and Agent!=null
            )
           ), % Ensure all cells are recorded. This simplifies
           percept_log_entry(Entry)
  )).