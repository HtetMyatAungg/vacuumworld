grid_size(8).
grid(loc(X,Y)) :- Yinx[0..7], Xinx[0..7].
seen(dirt(loc(X,Y), Colour)) :- Xinx[0..7], Yinx[0..7], Colour in {'orange', 'green'}.
seen(agent(Id, loc(X,Y), Colour)) :- Xinx[0..7], Yinx[0..7], Id = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green'.
empty_location(loc(X,Y)) :- Xinx[0..7], Yinx[0..7], not (seen(dirt(loc(X,Y), _)) or seen(agent(_, loc(X,Y), _))).
wall(north, loc(X,Y)) :- Xinx[0..7], Yinx = 7.
wall(south, loc(X,Y)) :- Xinx[0..7], Yinx = 0.
wall(east, loc(X,Y)) :- Yinx[0..7], Xinx = 7.
wall(west, loc(X,Y)) :- Yinx[0..7], Xinx = 0.