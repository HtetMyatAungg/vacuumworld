cell(0, 3, empty, [west], [], []).
cell(1, 3, empty, [], [], []).
cell(2, 3, empty, [], [orange], []).
cell(0, 4, empty, [south, west], [], []).
cell(1, 4, empty, [south], [], []).
cell(2, 4, empty, [south], [], []).
cell(0, 2, empty, [west], [], []).
cell(1, 2, empty, [], [green], []).
cell(2, 2, empty, [], [], []).
cell(0, 1, empty, [west], [], []).
cell(1, 1, empty, [], [], []).
cell(2, 1, empty, [], [], []).
cell(0, 0, empty, [north, west], [], []).
cell(1, 0, empty, [north], [], []).
cell(2, 0, empty, [north], [], ['c942b0ce-6c70-4311-a5b7-6b2640fe417c', green]).
cell(3, 0, empty, [north], [], []).
cell(3, 1, empty, [], [orange], []).
cell(3, 2, empty, [], [], []).
cell(3, 3, empty, [], [], []).
cell(3, 4, empty, [south], [], []).
cell(4, 2, empty, [east], [], ['ec1d58f6-6db4-473d-af3e-518ca49c39f9', orange]).
cell(4, 3, empty, [east], [], []).
cell(4, 4, empty, [east, south], [], []).
cell(4, 1, empty, [east], [], []).
cell(4, 0, empty, [east, north], [], []).
wall(X, Y, north) :- 
    (cell(X, Y, _, Walls, _, _), member(north, Walls)); 
    Y = 0.
wall(X, Y, south) :- 
    (cell(X, Y, _, Walls, _, _), member(south, Walls));
    Y = 4.
wall(X, Y, west) :- 
    (cell(X, Y, _, Walls, _, _), member(west, Walls));
    X = 0.
wall(X, Y, east) :- 
    (cell(X, Y, _, Walls, _, _), member(east, Walls));
    X = 4.
agent_at(X, Y, Id, Colour) :- cell(X, Y, _, _, _, [Id, Colour]).
dirt_at(X, Y, Colour) :- cell(X, Y, _, _, [Colour], _).