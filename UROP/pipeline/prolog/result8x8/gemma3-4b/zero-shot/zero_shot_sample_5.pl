domains
    grid_cell(X, Y, Walls, Dirt, Agent) :-
      X > 0, X =< 8,
      Y > 0, Y =< 8,
      all_walls(Walls, X, Y),
      Dirt == null | Dirt != null,
      Agent == null | Agent != null.

    agent_cell(X, Y, ID) :-
      X > 0, X =< 8,
      Y > 0, Y =< 8,
      X == 4, Y == 0, ID =\