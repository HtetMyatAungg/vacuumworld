domain(8). % Grid size: 8x8

edge(X, Y) :- X in [0..7], Y in [0..7]. % Define grid edges

wall([[X, Y]]) :-
    X == 0, Y == 0;
    X == 7, Y == 0;
    X == 7, Y == 7;
    X == 0, Y == 7;
    Y in [0..7], X in [0..7], not(wall([[X, Y]]));

dirt([[X, Y]]) :-
    X in [0..7], Y in [0..7], not(wall([[X, Y]]));

agent([[X, Y]], ID, COLOR) :-
    X in [0..7], Y in [0..7], not(wall([[X, Y]])),
    (ID = '9af04778-08d6-4e40-8c6f-ba123d292a22', COLOR = 'orange') ;
    (ID = '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', COLOR = 'green').

grid([[X, Y], WALLS]) :-
    edge([X, Y]),
    (WALLS == [] -> dirt([[X, Y]]) ;
     WALLS = ["north", "west"] -> wall([[X, Y]]) ;
     WALLS = ["south", "east"] -> wall([[X, Y]]);
     WALLS = ["west"]-> wall([[X, Y]]));

grid([[X, Y], ID, COLOR]) :-
    edge([X, Y]),
    agent([[X, Y]], ID, COLOR);