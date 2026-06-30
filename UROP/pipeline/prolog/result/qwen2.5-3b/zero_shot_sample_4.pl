```prolog
grid_size(N) :- N is #(1). % Number of rows and columns in a grid.
loc(X,Y) :- (X-1) is / N. % Coordinates of cell A#(#/(N+1)), B.
seen(dirt(loc(_, Y), Colour)) :- (Y < N+1).
{ X, Y } :: loc(N, #(#/N)) - / N, seen(agent(Id, _, Colour)) - / N-1. % for each agent with a cell containing dirt.

wall(loc(X,Y), Dir) :- (Y < N+1).
agent(Id, loc(X,Y), Dir) :-
    X < N+1.
```
In this solution:
1. We start by defining the grid and coordinates logic using Prolog's existential questions. 
2. Next, we define boundary wall rules.
3. Finally, we ensure agent detection and proper placement in a grid environment.

Please note that this script cannot handle an exact square grid because of edge cases like edge detection or moving outside boundary boundaries. If you want to support such behavior, it would need more specific conditions such as checking if cell bounds fit.