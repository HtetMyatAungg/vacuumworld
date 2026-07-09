edge(X,Y) :- between(0,7), X >= Y.
grid(N) :- N > 0, N = 4.
cell(X,Y) :- between(0,7), X >= 0, X < 7, Y >= 0, Y < 7.

wall(X, Y, Wall) :-
    cell(X, Y),
    (   X == 0 and Wall = "west"
    ;   X == 6 and Wall = "east"
    ;   Y == 0 and Wall = "north"
    ;   Y == 6 and Wall = "south").

dirt(X, Y, Dirt) :-
    cell(X, Y),
    (   X == 0 and Y == 0 and Dirt = "orange"
    ;   X == 1 and Y == 0 and Dirt = "green"
    ;   X == 2 and Y == 0 and Dirt = "orange"
    ;   X == 3 and Y == 0 and Dirt = "orange"
    ;   X == 0 and Y == 1 and Dirt = "green"
    ;   X == 1 and Y == 1 and Dirt = "green"
    ;   X == 2 and Y == 1 and Dirt = "orange"
    ;   X == 3 and Y == 1 and Dirt = "orange"
     ).

agent(X, Y, AgentId) :-
    cell(X, Y),
    (   X == 0 and Y == 0 and AgentId = "9af04778-08d6-4e40-8c6f-ba123d292a22"
    ;   X == 4 and Y == 0 and AgentId = "02a6d9ea-8b8e-4750-8000-c3a74a63fd9c").

grid_representation :-
  findall((X,Y), (edge(X,Y), dirt(X, Y, _)), List),
    reverse(List).