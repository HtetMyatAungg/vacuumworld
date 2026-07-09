grid(8).

walls(west, (0, _)) :- grid(N).  
walls(east, (_, N - 1)) :- grid(N).  
walls(north, (_, 1)) :- grid(N).  
walls(south, (_, N)) :- grid(N).
  
contents(west, (X, Y), 'orange') :- walls(west, (X, Y)).
contents(west, (X, Y), D) :- grid(X), \+ length(grid(X), Y).
contents(east, (X, Y), 'green') :- length(grid((X - 3)/2)), contains(L1, id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", "green"), L1).
contents(east, (X, Y), D) :- grid((X - 3)/2), \+ contains(L, id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", "green"), L).
contents(east, (X, Y), 'orange') :- length(grid((X - 1)/2)), contains(L1, id("9af04778-08d6-4e40-8c6f-ba123d292a22", "orange"), L1).
contents(east, (X, Y), D) :- grid((X - 1)/2), \+ contains(L, id("9af04778-08d6-4e40-8c6f-ba123d292a22", "orange"), L).
contents(south, (X, Y), 'green') :- length(grid((Y - 3)/2)), contains(L1, id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", "green"), L1).
contents(south, (X, Y), D) :- grid((Y - 3)/2), \+ contains(L, id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", "green"), L).
contents(south, (X, Y), 'orange') :- length(grid((Y - 1)/2)), contains(L1, id("9af04778-08d6-4e40-8c6f-ba123d292a22", "orange"), L1).
contents(south, (X, Y), D) :- grid((Y - 1)/2), \+ contains(L, id("9af04778-08d6-4e40-8c6f-ba123d292a22", "orange"), L).

agent(id("9af04778-08d6-4e40-8c6f-ba123d292a22", _), (X, Y)) :- contains(L2, 'green', X), \+ length(grid(X)), contents(south, (X, Y)).
agent(id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c", _), (X, N)) :- length(grid((N - 1)/2)), contains(L2, 'orange', X).

contains([H|T], H, [H|T]).
contains([_|T], R, S) :- contains(T, R, S).