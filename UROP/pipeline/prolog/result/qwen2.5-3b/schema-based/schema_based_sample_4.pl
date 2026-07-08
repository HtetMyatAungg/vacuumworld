grid_size(8).

grid(X, Y) :- (X >= 0; Y >= 0; X < 8; Y < 8),
    grid_(X, Y).

dirt(X, Y, Colour) :-
    grid(X, Y), 
    percept(_, dirt(X, Y, _, _)).

agent(Id, X, Y, Colour) :-
    Id \= "none",
    percept(PerceptLogEntry),
    agent_in_entry(PerceptLogEntry, AgentId, X, Y, Colour),
    (X >= 0; Y >= 0; X < 8; Y < 8).

empty(X, Y) :- grid(X, Y), not(dirt(_, _, _)), not(agent(_, _, _, _)).

wall(North, East, Dir) :-
    North > 0;
    East < N-1,
    Dir = north;
    North = N-1,
    Dir = south;
    East > 0,
    Dir = west;
    North = 0,
    Left = East - 1, 
    Right = East + 1, 
    (Dir == east; Dir == west), 
    Left > 0, 
    Right < N-1.

N := 8.
End