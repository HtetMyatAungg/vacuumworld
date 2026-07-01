n(8).
wall('north').
wall('south').
wall('east').
wall('west').

cell(X, Y) :- X > 0, X =< n(8), Y > 0, Y =< n(8).
dirt(X, Y) :- X >= 1, X =< n(8), Y >= 1, Y =< n(8).
agent(X, Y) :- X >= 1, X =< n(8), Y >= 1, Y =< n(8).

grid_size(N) :- n(N).

build_grid(N) :-
    findall((X, Y, Walls, Dirt, Agent), (cell(X, Y), wall_present(X, Y, Walls), dirt_value(X, Y, Dirt), agent_value(X, Y, Agent)), Grid);
    [].

wall_present(X, Y, Walls) :- member(Wall, Walls).

dirt_value(X, Y, Dirt) :- (Dirt == null -> fail; true).

agent_value(X, Y, Agent) :- (Agent == null -> fail; true).

grid_data(N) :-
    grid_size(N),
    findall((X, Y, Walls, Dirt, Agent), (cell(X, Y), wall_present(X, Y, Walls), dirt_value(X, Y, Dirt), agent_value(X, Y, Agent)), Grid).

create_grid(N) :-
  findall((X,Y,Walls,Dirt,Agent), (cell(X,Y), wall_present(X,Y,Walls), dirt_value(X,Y,Dirt), agent_value(X,Y,Agent)), Grid),
  maplist(\p -> (p[0], p[1], p[2]), Grid, Grid).
