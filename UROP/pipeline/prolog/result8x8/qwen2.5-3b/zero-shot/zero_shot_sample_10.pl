grid(N) :-
    (N > 0, N < 8), !,
    grid_1(N).

grid(7).
    
grid_1(1) -->
    [wall(west), _, _, _, _, _, _],
    dirty(_),
    [wall(east)],
    _,
    _.

grid_1(2) -->
    [_, wall(north), -, -, -], 
    dirty(_, south, east), 
    clean, 
    [wall(south)], 
    [dirty(west, south)],
    clean,
    [wall(east)],
    [clean],
    [clean, wall(south)],
    [clean].

grid_1(3) -->
    [_, _, wall(north), dirty(_, _), -, -], 
    -,
    dirty(west),
    -, 
    [dirty(south)],
    [clean, clean, wall(east)],
    [clean],
    [clean, clean, clean, wall(south)],    
    [-, clean, clean].

(grid_1(N) -->
    grid_1(N-1),
    clean,
    [wall(north)],
    dirty(west)
).