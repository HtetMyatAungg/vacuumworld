% Define the size of the square grid (N x N)
n(8).

% Represent the grid as a list of lists
grid(Grid) :-
    n(N),
    Grid = [[[] for _ in 0..N-1] for _ in 0..N-1],  % Initialize empty grid
    create_grid(Grid, N).

% Helper predicate to populate the initial grid state.
create_grid(Grid, N) :-
    length(Grid, N), % Check grid dimensions
    forall(i <- 0..(N-1), forall(j <- 0..(N-1), Grid !! i !! j = [])).

% Represent agents as records with ID and color.
agent(Id, Colour) :-
    Id = '9af04778-08d6-4e40-8c6f-ba123d292a22',
    Colour = 'orange'.

agent(Id, Colour) :-
    Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',
    Colour = 'green'.


% Define wall directions
wall('north').
wall('south').
wall('east').
wall('west').

% Represents the percept log as a list of observations.
observation(Coord, Walls, Dirt, Agent) :-
    (   Dirt = null
    ->  Walls = Walls
    ;   Dirt \= null
    );
    Dirt = 0,
    Walls = Walls .

% Predicate to create the Knowledge Base from the percept log.
build_kb :-
    forall(i <- 0..7,
        forall(j <- 0..7,
            (observation(coord(i,j), walls(walls), dirt(dirt), agent(agent))
            )
        )
    ).

% Helper predicates for coordinates and wall directions.
coord(X, Y) :- X >= 0, X < n(8), Y >= 0, Y < n(8).
walls([]).
walls([W]) :- wall(W).
walls([W1, W2]) :- wall(W1), wall(W2).
walls([W1, W2, W3]) :- wall(W1), wall(W2), wall(W3).

dirt(null).
dirt('orange').
dirt('green').

% To execute the KB: build_kb.