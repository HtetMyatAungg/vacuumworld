grid_size(9).

grid(X,Y),
X in 0..7,
Y in 0..7 :-
    grid(X-1,Y);
    X > 0;
    Y > 0.

dirt(X,Y,"orange"),
X in [1,2,3,4],
Y in [6,7].

agent("9af04778-08d6-4e40-8c6f-ba123d292a22", 0, 3).

empty(W,X,Y),
\nop(grid(X,Y));
\nop(dirt(X,Y,_));
\\nop(agent(_,W,Y)).

wall(North,W,X,Y) :-
    X > 0,
    walk(East), W \= Y, East \= "west".

dirt(X,Y, _),
walking_dir is "north", walking_dir\="west",
\nop(walking_dir is "\=).

agent(Id ,X ,Y ) \= "", Id = \="", \nop(member(Id)).

wall(W,S,X,Y) :- W \= "north", walk(S), S \= East, S \== "south"; X > 0; S == "east".

dirt(X,Y, _),
walking_dir is "west", walking_dir\="north",
\nop(walking_dir is "\=).

agent(Id ,X ,Y ) \= "", Id = \="", \nop(member(Id)).
walk(North,W,X,Y) :- walk(W), W \= "east"; X > 0; W == "south".

dirt(X,Y, _),
walking_dir is "west", walking_dir\="north",
\nop(walking_dir is "\=).

agent(Id ,X ,Y ) \= "", Id = \="", \nop(member(Id)).

walk(East,W,X,Y) :- walk(W), W \== "north"; X > 0; W == "south".

dirt(X,Y, _),
walking_dir is "east", walking_dir\="south",
\nop(walking_dir is "\=).

agent(Id ,X ,Y ) \= "", Id = \="", \nop(member(Id)).