grid(N) :-
    n(N),
    Cell([[empty | t] | t ..]), % Create a grid of N rows with an empty initial element
    generate_grid(N, []).

generate_grid(0, Grid) :-
    Grid = [],
    !.

generate_grid(N, Grid) :-
    RowIndex <- N-1,  % Row index from bottom up (0 to N-1)
    CellIndex <- 0,   % Column index from left to right (0 to N-1) ,
    add_wall(RowIndex, CellIndex, Grid),
    generate_grid(RowIndex - 1, \TempGrid) ->
        \TempGrid = Temp,
        Grid = [Temp|Grid].

add_wall(RowIndex, CellIndex, Grid) :-
  % Get the relevant percept log entry
  PerceptEntry <- get_percept_entry(RowIndex,CellIndex),
   
  % Update the grid based on the percept. If walls present add them to the grid
      ((PerceptEntry \== null) and (PerceptEntry \== []) and 
       (walls(PerceptEntry, Walls))) ->
        % Convert walls list to atom so it can be added to the Grid
        append_to_grid(Grid,Walls).
   
    %. If the entry is empty or null skip this grid  
else:
  .

append_to_grid(Grid, Walls) :-
    Case <- make_case(Grid,Walls),
    assertz(Case).

make_case(Grid, Walls) :-
    % Build a string representation of wall boundaries and insert them in a new list
    generate_wall_string(Walls, WString),
    List <- [WString|Grid],
    !.

generate_wall_string([], WString) :-
   WString = ''.

generate_wall_string([Wall | Rest], WString) :-
    % Construct the string representing wall boundaries separated by commas.
    generate_wall_string(Rest, RestString),
    append_string(WString, Wall, CommaString),
    append_string(CommaString, RestString, FinalString).

append_string("", S1, S2) :-
   S2 = S1.

append_string(S1, "", S2) :-
	S1 = S2.

append_string(S1, S2, Result) :-
    tail(S1),
    append_stringHelper(S1, S2, Result).

append_stringHelper("", "", Result) :-
   Result = ''.

append_stringHelper(S1, "", Result) :-
  Result = S1.

append_stringHelper("", S2, Result) :-
	Result = S2.



append_stringHelper(S1, S2, Result) :-
    tail(S1),
    append_stringHelper(tail(S1), S2, Temp),
    append_string(Result, [head(S1)], Temp).

% Helper predicate to retrieve percept log entry based on coordinates
get_percept_entry(RowIndex, ColIndex) :-
  member((coord: [RowIndex,ColIndex], walls([...]), dirt(null), agent(null)), all_percepts).

all_percepts := [
  {coord: [0,6], walls:["west"], dirt:null, agent:null},
  {coord: [1,6], walls:["south"], dirt:null, agent:null},
  {coord: [2,6], walls:["south"], dirt:null, agent:null},
  {coord: [3,6], walls:["south"], dirt:null, agent:null},
  {coord: [4,6], walls:["south"], dirt:null, agent:null},
  {coord: [5,6], walls:["west", "south"], dirt:null, agent:null},
  {coord: [5,5], walls:["south"], dirt:null, agent:null},
  {coord: [5,4], walls:["south"], dirt:null, agent:null},
  {coord: [5,3], walls:["west"], dirt:null, agent:null},
  {coord: [5,2], walls:["west"], dirt:null, agent:null},
  {coord: [5,1], walls:["west"], dirt:null, agent:null},
  {coord: [5,0], walls:["north"], dirt:null, agent:null},
  {coord: [6,5], walls:["east"], dirt:null, agent:null},
  {coord: [6,6], walls:["south"], dirt:null, agent:null},
  {coord: [6,4], walls:["orange"], dirt:"orange", agent:null},
  {coord: [6,3], walls:["north"], dirt:null, agent:null},
  {coord: [6,2], walls:["north"], dirt:null, agent:null},
  {coord: [6,1], walls:["north"], dirt:null, agent:null},
  {coord: [6,0], walls:["north"], dirt:null, agent:null},
  {coord: [7,0], walls:["east", "north"], dirt:null, agent:null},
  {coord: [7,1], walls:["east"], dirt:null, agent:null},
  {coord: [7,2], walls:["east"], dirt:null, agent:null},
  {coord: [7,3], walls:["east"], dirt:null, agent:null},
  {coord: [7,4], walls:["east"], dirt:null, agent:null},
  {coord: [7,5], walls:["east"], dirt:null, agent:null},
  {coord: [7,6], walls:["east"], dirt:null, agent:null},
  {coord: [7,7], walls:["east", "south"], dirt:null, agent:null}
].