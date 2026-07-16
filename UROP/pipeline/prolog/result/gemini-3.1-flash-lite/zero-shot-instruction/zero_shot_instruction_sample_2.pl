wall(north, X, 0) :- X >= 0, X =< 10.
wall(south, X, 10) :- X >= 0, X =< 10.
wall(west, 0, Y) :- Y >= 0, Y =< 10.
wall(east, 10, Y) :- Y >= 0, Y =< 10.
cell(1, 4, dirt(orange)).
cell(3, 3, dirt(orange)).
cell(3, 6, dirt(orange)).
cell(5, 7, dirt(orange)).
cell(7, 5, dirt(green)).
cell(9, 2, dirt(green)).
cell(9, 7, dirt(green)).
agent(1, 0, orange, 'd3af9897-9139-4ffe-8a15-2e9c6f06e71a').
agent(5, 0, green, 'd6428e63-73b7-40a5-9cc9-ea3b5e61a86d').