domain(N).
N := 7.

walls([west, east, north, south]).

agent_id(ID) = ID.

dirt(DIR) = DIR.

grid(X, Y, WallData, DirtData, AgentData) :-
    X >= 0,
    X < N,
    Y >= 0,
    Y < N,
    wall_detail(X, Y, WallData),
    dirt_detail(X, Y, DirtData),
    agent_detail(X, Y, AgentData).

wall_detail(X, Y, Wall) :-
  case X of
    0 -> Wall = [north];
    N - 1 -> Wall = [south];
    _ -> Wall = [];
  case Y of
    0 -> Wall = [west];
    N - 1 -> Wall = [east];
    _ -> Wall = [];
  end.

dirt_detail(X, Y, Dirt) :-
    Dirt = null.

agent_detail(X, Y, Agent) :-
    Agent = {id:ID, colour:Colour},
    agent_id(ID) = ID,
    Colour = 'orange' | 'green'.