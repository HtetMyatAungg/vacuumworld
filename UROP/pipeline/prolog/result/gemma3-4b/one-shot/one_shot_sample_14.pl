grid_size(9).
grid(loc(_,_)) :- total_rows() > 0, total_cols() > 0.
total_rows() = 9.
total_cols() = 9.
seen(dirt(loc(_,_), Colour)) :- Colour insitu[Colour].
seen(agent(Id, loc(_,_), Colour)) :- Id == '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour insitu[Colour].
empty_location(loc(_,_)) :- not (seen(dirt(_,_,_)) or seen(agent(_,_,_))).
wall((X,Y), North) :- X = 0, Y in [0..8].
wall((X,Y), South) :- X = 8, Y in [0..8].
wall((X,Y), East) :- Y = 0, X in [0..8].
wall((X,Y), West) :- Y = 8, X in [0..8].