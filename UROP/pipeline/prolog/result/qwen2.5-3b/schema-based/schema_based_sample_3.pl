grid_size(8).

% Section A: Translation facts

dirt(0,7, 'orange').
agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 0,5, 'orange').
empty(X,Y) :- between(0,7,X), between(0,7,Y), \+ grid(X,Y).

% Section B: Wall rules

wall(X,Y,north).
wall(X,Y,south).
wall(X,Y,east).
wall(X,Y,west).