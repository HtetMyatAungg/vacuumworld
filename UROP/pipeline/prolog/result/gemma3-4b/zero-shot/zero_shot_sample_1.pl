% Define the size of the grid (N x N)
grid_size(8).

% Representation:  A list of lists representing the grid cells.
% Each cell contains information about walls and content.

% Walls: ['north', 'south', 'east', 'west']
% Content: null or a map with 'id' and 'colour'.


% Define predicates for accessing grid elements.
grid(X, Y) :-
    between(0, grid_size(1)-1, X_val),
    between(0, grid_size(1)-1, Y_val),
    X == X_val,
    Y == Y_val.

% Define the grid itself.
create_grid() :-
    N is grid_size(1),
    initialize_grid(N),
    !;

initialize_grid(N) :-
  grid_data = [],
  forall(_, forall((X,Y), (grid(X, Y),
       cell_data(X, Y, walls, content))) , grid_data = cell_data).


% Helper predicate to get cell data.
cell_data(X, Y, Walls, Content) :-
    grid(X, Y),
    walls = case
        ((Walls == [] , 'none') ; (Walls == ['west'] , 'west') ; (Walls == ['east'] , 'east') ; (Walls == ['north'] , 'north') ; (Walls == ['south'] , 'south'));
    content = case
        (Content = null, 'empty' ) ;
        (Content = {'id' : Id, 'colour' : Colour}, case colour of {Colour, _}  );
    end.

% Example: Show the grid (for debugging)
show_grid() :-
    N is grid_size(1),
    forall(i = 0, i < N, (forall(j = 0, j < N, write(' '), nl))),nl.