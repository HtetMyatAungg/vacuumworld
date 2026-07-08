grid(grid(0:6;1:6;2:6),
     grid(0:7;1:7;2:7),
     grid(0:5;1:5;2:5),
     grid(0:4;1:4;2:4;dirt(orange)),
     grid(0:3;1:3;2:3;dirt(orange)),
     grid(0:2;1:2;2:2;dirt(green)),
     grid(0:1;1:1;grid(X:Y;dirt()))@<7,1;7,2;7,3;7,4;7,5;7,6;7,7>,
     grid(0;1;4:7;dirt(orange);dirt(green)),
     grid(0;1;6:7;dirt(orange)),
     grid(7:0;7:1;7:2;7:3;7:4;7:5;7:6;grid(X:Y;dirt(green))@<0,0;0:1>)),
     wall(wall(north, grid(0;Y;X)),wall(south, grid(X;N;Y)),wall(east, grid(Y;X;N)),wall(west, grid(Y;X;S))),

% Position of agent (orange) and object (green)
position(agent(id('9af04778-08d6-4e40-8c6f-ba123d292a22'), colour(orange)), grid(X:Y;dirt()))@<0:3;0:5;0:6>.

% Walls
wall(wall(north, grid(0;Y;X)), wall(south, grid(X;N;Y)), wall(east, grid(Y;X;N)), wall(west, grid(Y;X;S))).

% Initial position of agent
initial_position(agent(id('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c'))@<7:1>).