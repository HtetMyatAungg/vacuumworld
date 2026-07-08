% grid size is 8
n_size(8).

% Represents a cell in the grid as a list of walls and content
grid([C1], [C2], [C3], [C4], [C5], [C6], [C7], [C8]) :-
  C1 = [wall('west'), wall('north')],
  C2 = [wall('south'), wall('east')],
  C3 = [wall('south')],
  C4 = [wall('west')],
  C5 = [dirt('orange')],
  C6 = [wall('west')],
  C7 = [dirt('orange')],
  C8 = [wall('north')];

grid([C1], [C2], [C3], [C4], [C5], [C6], [C7], []) :-
  C1 = [wall('west'), wall('north')],
  C2 = [wall('south'), wall('east')],
  C3 = [],
  C4 = [wall('west')],
  C5 = [dirt('orange')],
  C6 = [wall('west')],
  C7 = [dirt('orange')];

grid([C1], [C2], [], [C4], [C5], [C6], [C7], [C8]) :-
    C1 = [wall('west'), wall('north')],
    C2 = [wall('south'), wall('east')],
    C3 = [],
    C4 = [wall('west')],
    C5 = [dirt('orange')],
    C6 = [wall('west')],
    C7 = [dirt('orange')];

grid([C1], [C2], [], [C4], [C5], [C6], [], [C8]) :- 
  C1 = [wall('west'), wall('north')],
  C2 = [wall('south'), wall('east')],
  C3 = [],
  C4 = [wall('west')],
  C5 = [dirt('orange')],
  C6 = [wall('west')],
  C7 = [dirt('orange')];

% Represents a coordinate as a list of x and y
coordinate(0, 0) :- !.
coordinate(1, 0) :- !.
coordinate(2, 0) :- !.
coordinate(3, 0) :- !.
coordinate(3, 1) :- !.
coordinate(3, 2) :- !.
coordinate(3, 3) :- !.
coordinate(3, 4) :- !.
coordinate(3, 5) :- !.
coordinate(3, 6) :- !.