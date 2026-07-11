% Grid dimensions
grid_size(8, 8).

% Directions
direction(north).
direction(south).
direction(east).
direction(west).

% Basic adjacency (within grid bounds)
adjacent((X,Y), (X1,Y), east)  :- X1 is X+1, X1 < 8.
adjacent((X,Y), (X1,Y), west)  :- X1 is X-1, X1 >= 0.
adjacent((X,Y), (X,Y1), south) :- Y1 is Y+1, Y1 < 8.
adjacent((X,Y), (X,Y1), north) :- Y1 is Y-1, Y1 >= 0.

% Walls from percepts
wall((0,6), west).
wall((0,7), south).
wall((0,7), west).
wall((1,7), south).
wall((2,7), south).
wall((0,5), west).
wall((0,4), west).
wall((0,3), west).
wall((0,2), west).
wall((0,1), west).
wall((0,0), north).
wall((0,0), west).
wall((1,0), north).
wall((2,0), north).
wall((3,0), north).
wall((3,7), south).
wall((4,7), south).
wall((4,0), north).
wall((5,0), north).
wall((5,7), south).
wall((6,7), south).
wall((6,0), north).
wall((7,0), east).
wall((7,0), north).
wall((7,1), east).
wall((7,2), east).
wall((7,3), east).
wall((7,4), east).
wall((7,5), east).
wall((7,6), east).
wall((7,7), east).
wall((7,7), south).

% Implicit boundary walls (derived from grid limits)
boundary_wall((X,_Y), west)  :- X =:= 0.
boundary_wall((X,_Y), east)  :- grid_size(W,_), X =:= W-1.
boundary_wall((_X,Y), north) :- Y =:= 0.
boundary_wall((_X,Y), south) :- grid_size(_,H), Y =:= H-1.

has_wall(Pos, Dir) :-
    wall(Pos, Dir);
    boundary_wall(Pos, Dir).

% Dirt
dirt((2,1), orange).
dirt((3,4), orange).
dirt((4,6), orange).
dirt((5,1), green).
dirt((6,4), orange).

% Agents
agent((0,3), '9af04778-08d6-4e40-8c6f-ba123d292a22', orange).
agent((4,0), '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', green).

% Cell classification
cell((X,Y), agent(ID,Colour)) :-
    agent((X,Y), ID, Colour).
cell((X,Y), dirt(Colour)) :-
    dirt((X,Y), Colour).
cell((X,Y), empty) :-
    X >= 0, X < 8,
    Y >= 0, Y < 8,
    \+ agent((X,Y), _, _),
    \+ dirt((X,Y), _).