edge(X, Y, Dir) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8,
    (
        (Dir = 'north') -> Y > 0
    ),
    (
        (Dir = 'south') -> Y < 7
    ),
    (
        (Dir = 'east') -> X < 7
    ),
    (
        (Dir = 'west') -> X > 0
    ).

grid(N) :-
    N > 0,
    N >= 8.

agent(Id, Colour) :-
    member(agent_entry(Id, Colour), percept_log).

agent_entry(Id, Colour) :-
    member([
        coord([X, Y]),
        walls(Walls),
        dirt(Dirt),
        agent(Agent)
    ], percept_log),
    agent(Agent),
    Agent.agent_id =:= Id,
    Agent.colour =:= Colour.

walls(Walls) :-
    member(wall_entry(Walls), percept_log).

wall_entry(Walls) :-
    member([
        coord([X, Y]),
        Walls
    ], percept_log).

dirt(Dirt) :-
    member(dirt_entry(Dirt), percept_log).

dirt_entry(Dirt) :-
    member([
        coord([X, Y]),
        Dirt
    ], percept_log).

coord([X, Y]) :-
    X >= 0,
    X < 8,
    Y >= 0,
    Y < 8.