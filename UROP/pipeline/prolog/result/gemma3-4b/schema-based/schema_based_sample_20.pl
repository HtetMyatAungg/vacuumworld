grid_size(N).
grid(loc(X,Y)) :- X >= 0, X < N, Y >= 0, Y < N.
seen(dirt(loc(X,Y), Colour)) :- X >= 0, X < N, Y >= 0, Y < N, Colour = 'orange' .
seen(agent(Id, loc(X,Y), Colour)) :- X >= 0, X < N, Y >= 0, Y < N, Id = '9af04778-08d6-4e40-8c6f-ba123d292a22', Colour = 'orange' .
seen(agent(Id, loc(X,Y), Colour)) :- X >= 0, X < N, Y >= 0, Y < N, Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green'.
empty_location(loc(X,Y)) :- X >= 0, X < N, Y >= 0, Y < N.
wall(loc(X,Y), North) :- X >= 0, X < N, Y = 0.
wall(loc(X,Y), South) :- X >= 0, X < N, Y = N - 1.
wall(loc(X,Y), East) :- Y >= 0, Y < N, X = N - 1.
wall(loc(X,Y), West) :- Y >= 0, Y < N, X = 0.
wall(loc(0,0), north).
wall(loc(0,1), north).
wall(loc(0,2), north).
wall(loc(0,3), north).
wall(loc(0,4), north).
wall(loc(0,5), west).
wall(loc(0,6), west).
wall(loc(1,0), north).
wall(loc(1,1), north).
wall(loc(1,2), north).
wall(loc(1,3), north).
wall(loc(1,4), north).
wall(loc(1,5), west).
wall(loc(1,6), west).
wall(loc(2,0), north).
wall(loc(2,1), north).
wall(loc(2,2), north).
wall(loc(2,3), north).
wall(loc(2,4), north).
wall(loc(2,5), west).
wall(loc(2,6), west).
wall(loc(3,0), north).
wall(loc(3,1), north).
wall(loc(3,2), north).
wall(loc(3,3), north).
wall(loc(3,4), north).
wall(loc(3,5), west).
wall(loc(3,6), west).
wall(loc(4,0), north).
wall(loc(4,1), north).
wall(loc(4,2), north).
wall(loc(4,3), north).
wall(loc(4,4), north).
wall(loc(4,5), west).
wall(loc(4,6), west).
wall(loc(5,0), north).
wall(loc(5,1), north).
wall(loc(5,2), north).
wall(loc(5,3), north).
wall(loc(5,4), north).
wall(loc(5,5), west).
wall(loc(5,6), west).
wall(loc(6,0), east).
wall(loc(6,1), east).
wall(loc(7,0), east).
wall(loc(7,1), east).
wall(loc(7,2), east).
wall(loc(7,3), east).
wall(loc(7,4), east).
wall(loc(7,5), east).
wall(loc(7,6), east).
wall(loc(7,7), south).