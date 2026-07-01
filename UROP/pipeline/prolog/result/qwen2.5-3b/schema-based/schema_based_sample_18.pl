grid_size(13).

% Grid information.
grid(loc(X,Y)) :- grid_size(N), X is I * N, Y is J * N, domain([I,J],0,N-1).

% Seen facts for dirt cell.
seen(dirt(loc(X,Y,_Colour))) :-
    grid(loc(X,Y)), not seen(loc(X,Y)).

% Seen facts for agent cell.
seen(agent(Id,loc(X,Y,Colour))) :-
    grid(loc(X,Y)), seen(Cell = agent(_,Id)),
    Cell \= seen(loc(X,Y)).

% Empty location
empty_location(loc(X,Y)) :-
    grid(loc(X,Y)), not seen(Cell), not (Cell = dirt(_Colour,Coloring) ; Cell = agent(_,loc(_X,_Y,coloring _Colour,Coloring))).

% Generalised wall rules.
grid_size(N) :- N > 0.
walk(grid_size(1), loc(X,y), north).
walk(grid_size(N), loc(X,y), west) :- N > 1, X < N-1.
walk(grid_size(N), loc(X,y), south) :- N > 1, Y < N-1.
walk(grid(Wet), Loc, Dir) :-
    walk(grid(Wall1), Loc, OtherDirs),
    foldl(\X,Y,Wet1,\Y,WetNotDir),
    Wet1 \= wet(Loc,OtherDir).

% Wall rules for boundary walls.
wall(loc(X, Y, north)) :- grid_size(N), X < N-1.
wal(walk(loc(X,Y,east)), grid_size(N), N > 1, X =< N - 1).
wal(walk(loc(X,0,south)), grid_size(N), Y \= 0, N > 1).
wal(walk(loc(7,Y,west)) :- grid_size(N), X > 0, N > 1.