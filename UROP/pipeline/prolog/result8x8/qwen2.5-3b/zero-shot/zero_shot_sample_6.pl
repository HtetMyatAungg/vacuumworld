grid(7).  
cell(grid(7), 0, 0).
cell(grid(7), 1, 0).
cell(grid(7), 2, 0).
cell(grid(7), 3, 0).
cell(grid(7), 4, 0).
cell(grid(7), 5, 0).
cell(grid(7), 6, 0).

agent_type(cell(grid(7), 1, 2), green).  

agent_type(cell(grid(7), 0, 4), orange) .

agent_type(cell(grid(7), 1, 4), green).  

agent_type(cell(grid(7), 2, 4), orange).
  
grid_north_wall(grid(N), X, Y) :- N > Y, cell(grid(N), X, Y), wallis(grid(N), north, [X,Y]).
grid_south_wall(grid(N), X, Y) :- Y < N-1, cell(grid(N), X, Y), wallis(grid(N), south, [X,Y]).

grid_east_wall(grid(N), X, Y) :- X < N-1, cell(grid(N), X, Y), wallis(grid(N), east, [X,Y]).
grid_west_wall(grid(N), X, Y) :- X > 0, cell(grid(N), X, Y), wallis(grid(N), west, [X,Y]).

grid_north_wall(grid(7), 1, 0).
grid_north_wall(grid(7), 2, 0).
grid_north_wall(grid(7), 3, 0).
grid_north_wall(grid(7), 4, 0).
grid_north_wall(grid(7), 5, 0).
grid_north_wall(grid(7), 6, 0).

grid_south_wall(grid(7), 1, 7).
grid_south_wall(grid(7), 2, 7).
grid_south_wall(grid(7), 3, 7).
grid_south_wall(grid(7), 4, 7).
grid_south_wall(grid(7), 5, 7).
grid_south_wall(grid(7), 6, 7).

grid_east_wall(grid(N), 1, Y) :- N>Y.
grid_east_wall(grid(N), 2, Y) :- N>Y.
grid_east_wall(grid(N), 3, Y) :- N>Y.
grid_east_wall(grid(N), 4, Y) :- N>Y.
grid_east_wall(grid(N), 5, Y) :- N>Y.

grid_west_wall(grid(N), 1, Y) :- X>0, N=7.
grid_west_wall(grid(7), 2, Y) .
grid_west_wall(grid(7), 3, Y) .
grid_west_wall(grid(7), 4, Y) .
grid_west_wall(grid(7), 5, Y) .

agent_type(cell(_G,N,Y), green):-
  cell(grid(N), N,Y).
  
wallis(7, north, [(0,0); (1,0); (2,0); (3,0); (4,0); (5,0); (6,0)]).
wallis(7, south, [(0,7); (1,7); (2,7); (3,7); (4,7); (5,7); (6,7); (7,7)]).

wallis(7, east, [(0,1); (1,1); (2,1); (3,1); (4,1); (5,1); (6,1)]).  
wallis(7, west, [(0,0); (3,0); (4,0); (5,0); (6,0); (7,0)]).

grid_invalid(grid(7), X, Y) :-
  member([X,Y], [[0,1],[1,1],[2,1],[3,1],[4,1],[5,1],[6,1]]).