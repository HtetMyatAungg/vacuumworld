grid_size(9).

north_wall(true).

south_wall(false,true);
south_wall(_,false) ; empty(X,Y), wall_rule(W,H,_).

wall_rule(North, East, Direction) :-
    Direction = east -> north_wall(North,East);
    Direction = west -> south_wall(East,W,North);
    Direction = south -> wall(W,North,East).

north_wall(true).

south_wall(false,true);
south_wall(_,false); empty(X,Y), wall_rule(W,H,_).

dirt(X,Y,Color) :-
    grid(X,Y),
    percept(X,Y,_Color,Color,_Agent).

agent(Id,X,Y,Color) :-
    percept(X,Y,Id,_,Color),
    grid(X,Y).

empty(X,Y) :-
    grid(X,Y),
    not(dirt(_,Y,X)),
    not(agent(_,Y,X)).

color("orange","orange").

color("green","green").