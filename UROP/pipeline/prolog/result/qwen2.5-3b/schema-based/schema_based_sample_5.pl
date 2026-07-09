grid_size(9),

dirt(0, 6, null),
dirt(1, 6, null),
dirt(2, 6, null),
dirt(0, 7, dirt),
dirt(1, 7, dirt),
dirt(2, 7, dirt),
dirt(0, 5, dirt),
dirt(1, 5, dirt),
dirt(2, 5, dirt),
dirt(0, 4, dirt),
dirt(1, 4, dirt),
dirt(2, 4, dirt),
dirt(0, 3, agent(_, null)),
dirt(1, 3, dirty(agent(Id1, _, _, _) = true)),
dirt(2, 3, dirty(agent(Id1, _, _, _))),

dirt(0, 2, dirt),
dirt(1, 2, dirt),
dirt(2, 2, dirt),
dirt(0, 1, dirt),
dirt(1, 1, agent(_, null), agent(_, dirty(_) = true)),
dirt(2, 1, agent(Id2, _, dirt) ; agent(Id3, _, dirt)),

dirt(0, 0, dirt(_; agent(_, color(_) = green = false; _),
dirt(1, 0, agent(_, green),
dirt(2, 0, dirty(agent(_= true)),
dirt(3, 0, dirty(agent?(:_=true)),
dirt(4, 0, agent(:,yellow),
dirt(5, 0, dirt(?green ),
dirt(6, 0, dirt(color(_, _=_false ;_)),

wall(X, Y, north) :- X =:= 0 ;
X =:= length(Grid)-1,
Y > 0.

wall(X, Y, south) :- Y =:= length(Grids[1]) ;
X < (length(Grids)) - 1,
Y > 0
;
X > 0,
Y = (length(_Grids[length(Grids)])).

empty([_|T], Grid) :-
    grid_size(N),
    member(grid(Aj,F), T); F=1),
    member(agent(Id,_,_), Agent),  
    member((X, Y), Agents),
    not member(grid(X,Y),Grid),
    empty(T, FilteredGrid),
    append([grid(X, Y)|FilteredGrid], [], Grids2),
    append(Grids2, [wall(X, Y, north)], NewGrid).

empty([], []).
empty([_|Tail], NewGrid) :-
    empty(Tail, NewGrid).