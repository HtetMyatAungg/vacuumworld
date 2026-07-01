n(8).
type(Cell) :- between(0, 7, X), between(0, 7, Y).
wall(West) :- X = 0.
wall(South) :- Y = 0.
wall(East) :- X = 7.
wall(North) :- Y = 7.

dirt(Orange) :- between(0, 2, X), Y in [0..7].
dirt(Green) :- between(5, 7, X), Y in [0..7].
dirt(None) :- true.

agent(Id, Colour) :-
    between(0, 2, X), between(0, 2, Y).

percept({X, Y} | walls | dirt | agent) :-
    type({X, Y}),
    wall_present({X, Y}, walls),
    dirt_present({X, Y}, dirt),
    agent_present({X, Y}, agent).

wall_present({X, Y}, []) :-
    (   X = 0 -> wall(West);
        Y = 0 -> wall(South);
        X = 7 -> wall(East);
        Y = 7 -> wall(North);
        true).


wall_present({X, Y}, [Wall]) :-
    (   X = 0 -> Wall == West ;
        Y = 0 -> Wall == South;
        X = 7 -> Wall == East;
        Y = 7 -> Wall == North;
        true).

dirt_present({X, Y}, []) :- true.

dirt_present({X, Y}, [Dirt]) :-
    (   X in [0, 1, 2] , Y in [0..7