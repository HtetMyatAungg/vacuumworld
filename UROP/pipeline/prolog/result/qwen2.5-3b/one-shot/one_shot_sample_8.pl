grid_size(10).

grid(loc(_X,_Y)).

seen(dirt(loc(_X,_Y),_Colour)).
seen(agent(_,loc(_X,_Y),_Colour)).
empty_location(loc(_X,_Y)).

% Define boundary walls

walldir(walkdir(wall(loc(X,Y,north)), right), left).
walldir(walkdir(walkdir(loc(X,Y,south),right),left),right).

walkdir(_, _Dir).

walkdir(walkdir(loc(X, Y, north),right), left).

walkdir(walldir((loc(X, Y, west),left)), right).

% Define walls on the other sides if applicable.
walldir(walldir(loc(X,Y,east),_Dir),_Revwalledir).

revside(loc(4,_Y),north,west).
revside(loc(_X,4),south,east).
revside(_,west,north).
revside(east,south,_).
revside(_,north,west).

walldir(walkdir(walldir(walkdir(loc(X,Y,east),_Dir), _Revwalledir),_OtherSideDir),_Dir).

% End of Prolog code