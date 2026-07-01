% Grid representation: grid([[walls, dirt, agent]], ...)
grid(N) :-
    findall([walls, dirt, agent],
           zip((0..N-1), (0..N-1)),  % Iterate through grid cells
           fun(_ , walls, dirt, agent) |> row_builder(walls, dirt, agent, [])).

row_builder([], [], [], [])::-!.
row_builder([Wall|Walls], [Dirt|Dirts], [Agent|Agents], RowResult):-
    Wall = false, Dirt = null, Agent=null,
    row_builder(Walls, Dirts, Agents, RowResult).

row_builder([Wall|Walls], [Dirt|Dirts], [Agent|Agents], RowResult):-
  Wall = true, Dirt = null , Agent = [], 
  row_builder(Walls, Dirts, Agents, RowResult).

row_builder([Wall|Walls], [Dirt|Dirts], [Agent|Agents], RowResult):-
  Wall = false, Dirt = "orange", Agent={},
   row_builder(Walls, Dirts, Agents, RowResult).

row_builder([Wall|Walls], [Dirt|Dirts], [Agent|Agents], RowResult):-
  Wall = true, Dirt = "green", Agent={},
  row_builder(Walls, Dirts, Agents, RowResult).


% Agent representation: agent(id, colour)
agent(id, colour) :-
    grid(N),
    find((x, y), ((walls, dirt, agent_rep) <- [], agent_rep = (id, colour)), _, _).

% Dirt representation: dirt(color)
dirt(color) :-
    grid(N),
    find((x, y), ((walls, dirt_rep, _) <- [], dirt_rep = color), _, _).

% Create the grid with correct dimensions based