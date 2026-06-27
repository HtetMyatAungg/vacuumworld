grid_size(8).

grid(loc(0,0)). grid(loc(1,0)). grid(loc(2,0)). grid(loc(3,0)). grid(loc(4,0)). grid(loc(5,0)). grid(loc(6,0)). grid(loc(7,0)).
grid(loc(0,1)). grid(loc(1,1)). grid(loc(2,1)). grid(loc(3,1)). grid(loc(4,1)). grid(loc(5,1)). grid(loc(6,1)). grid(loc(7,1)).
grid(loc(0,2)). grid(loc(1,2)). grid(loc(2,2)). grid(loc(3,2)). grid(loc(4,2)). grid(loc(5,2)). grid(loc(6,2)). grid(loc(7,2)).
grid(loc(0,3)). grid(loc(1,3)). grid(loc(2,3)). grid(loc(3,3)). grid(loc(4,3)). grid(loc(5,3)). grid(loc(6,3)). grid(loc(7,3)).
grid(loc(0,4)). grid(loc(1,4)). grid(loc(2,4)). grid(loc(3,4)). grid(loc(4,4)). grid(loc(5,4)). grid(loc(6,4)). grid(loc(7,4)).
grid(loc(0,5)). grid(loc(1,5)). grid(loc(2,5)). grid(loc(3,5)). grid(loc(4,5)). grid(loc(5,5)). grid(loc(6,5)). grid(loc(7,5)).
grid(loc(0,6)). grid(loc(1,6)). grid(loc(2,6)). grid(loc(3,6)). grid(loc(4,6)). grid(loc(5,6)). grid(loc(6,6)). grid(loc(7,6)).
grid(loc(0,7)). grid(loc(1,7)). grid(loc(2,7)). grid(loc(3,7)). grid(loc(4,7)). grid(loc(5,7)). grid(loc(6,7)). grid(loc(7,7)).

seen(dirt(loc(2,1), orange)).
seen(dirt(loc(3,4), orange)).
seen(dirt(loc(4,6), orange)).
seen(dirt(loc(5,1), green)).
seen(dirt(loc(6,4), orange)).

seen(agent('9af04778-08d6-4e40-8c6f-ba123d292a22', loc(0,3), orange)).
seen(agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', loc(4,0), green)).

empty_location(loc(0,0)).
empty_location(loc(1,0)).
empty_location(loc(2,0)).
empty_location(loc(3,0)).
empty_location(loc(5,0)).
empty_location(loc(6,0)).
empty_location(loc(7,0)).
empty_location(loc(0,1)).
empty_location(loc(1,1)).
empty_location(loc(3,1)).
empty_location(loc(4,1)).
empty_location(loc(6,1)).
empty_location(loc(7,1)).
empty_location(loc(0,2)).
empty_location(loc(1,2)).
empty_location(loc(2,2)).
empty_location(loc(3,2)).
empty_location(loc(4,2)).
empty_location(loc(5,2)).
empty_location(loc(6,2)).
empty_location(loc(7,2)).
empty_location(loc(1,3)).
empty_location(loc(2,3)).
empty_location(loc(3,3)).
empty_location(loc(4,3)).
empty_location(loc(5,3)).
empty_location(loc(6,3)).
empty_location(loc(7,3)).
empty_location(loc(0,4)).
empty_location(loc(1,4)).
empty_location(loc(2,4)).
empty_location(loc(4,4)).
empty_location(loc(5,4)).
empty_location(loc(7,4)).
empty_location(loc(0,5)).
empty_location(loc(1,5)).
empty_location(loc(2,5)).
empty_location(loc(3,5)).
empty_location(loc(4,5)).
empty_location(loc(5,5)).
empty_location(loc(6,5)).
empty_location(loc(7,5)).
empty_location(loc(0,6)).
empty_location(loc(1,6)).
empty_location(loc(2,6)).
empty_location(loc(3,6)).
empty_location(loc(5,6)).
empty_location(loc(6,6)).
empty_location(loc(7,6)).
empty_location(loc(0,7)).
empty_location(loc(1,7)).
empty_location(loc(2,7)).
empty_location(loc(3,7)).
empty_location(loc(4,7)).
empty_location(loc(5,7)).
empty_location(loc(6,7)).
empty_location(loc(7,7)).

wall(loc(X,Y), north) :- grid_size(N), grid(loc(X,Y)), Y =:= 0, X >= 0, X < N.
wall(loc(X,Y), south) :- grid_size(N), grid(loc(X,Y)), Y =:= N - 1, X >= 0, X < N.
wall(loc(X,Y), west) :- grid_size(N), grid(loc(X,Y)), X =:= 0, Y >= 0, Y < N.
wall(loc(X,Y), east) :- grid_size(N), grid(loc(X,Y)), X =:= N - 1, Y >= 0, Y < N.