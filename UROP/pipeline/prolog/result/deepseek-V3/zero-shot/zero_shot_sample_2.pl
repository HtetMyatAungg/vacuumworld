cell(0, 3, empty, west).
cell(1, 3, empty, none).
cell(2, 3, dirt(orange), none).
cell(0, 4, empty, south+west).
cell(1, 4, empty, south).
cell(2, 4, empty, south).
cell(0, 2, empty, west).
cell(1, 2, dirt(green), none).
cell(2, 2, empty, none).
cell(0, 1, empty, west).
cell(1, 1, empty, none).
cell(2, 1, empty, none).
cell(0, 0, empty, north+west).
cell(1, 0, empty, north).
cell(2, 0, agent(green, c942b0ce-6c70-4311-a5b7-6b2640fe417c), north).
cell(3, 0, empty, north).
cell(3, 1, dirt(orange), none).
cell(3, 2, empty, none).
cell(3, 3, empty, none).
cell(3, 4, empty, south).
cell(4, 2, agent(orange, ec1d58f6-6db4-473d-af3e-518ca49c39f9), east).
cell(4, 3, empty, east).
cell(4, 4, empty, east+south).
cell(4, 1, empty, east).
cell(4, 0, empty, east+north).
wall(X, Y, north) :- cell(X, Y, _, walls) , sub_atom(walls, 0, _, _, north).
wall(X, Y, south) :- cell(X, Y, _, walls) , sub_atom(walls, 0, _, _, south).
wall(X, Y, east) :- cell(X, Y, _, walls) , sub_atom(walls, 0, _, _, east).
wall(X, Y, west) :- cell(X, Y, _, walls) , sub_atom(walls, 0, _, _, west).
has_dirt(X, Y, Color) :- cell(X, Y, dirt(Color), _).
has_agent(X, Y, Color, Id) :- cell(X, Y, agent(Color, Id), _).