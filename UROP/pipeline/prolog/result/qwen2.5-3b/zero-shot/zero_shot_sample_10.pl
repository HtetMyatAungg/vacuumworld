grid(X-Y), walls([(0,5), (0,6), (3,4), (3,5), (6,4), (6,5), (7,5), (7,6), (6,6), (7,7)]), dirt(orange, green), agent(color(green), (4,0)), agent(color(orange), (0,3)).

all_clean_and_no_agents_or_dirt([], []).
all_clean_and_no_agents_or_dirt([cell(X, Y)|T]) :-
  X < 8,
  not(walls((X,Y))),
  not(agent(_,_,(X,Y)) in T),
  all_clean_and_no_agents_or_dirt(T).

walls((X,Y), true) --> [wall((X,Y))].
walls(_Wall, false).

clean_and_without_agents_or_dirt([], []).
clean_and_without_agents_or_dirt([cell(X, Y,DustIn, AgentColor)|T], OutList) :-
  Y < 8,
  X < 8,
  not(walls((X,Y))),
  not(agent(_,AgentColor, (X, Y)) in T),
  clean = cell(Y, X, Wall1),
  walls((Y,X), Wall2),
  not(wallis((Y,X))),
  clean_and_without_agents_or_dirt(T, OutList).

% Function to initialize grid with given properties (walls and agents/dust)
grid([wall(X-Y) | T]) :-
  Y < 8,
  X < 8,
  walls((X,Y)),
  not(wallis((X,Y))),
  not(agent(_,AgentColor,(X,Y)) in T),
  grid(T).

% Initialize all other cells as clean
all_clean_and_no_agents_or_dirt([clean]) --> [].
all_clean_and_no_agents_or_dirt([cell(Y, X, Wall1)|T]) :-
  clean = cell(X,Y, YC-OC),
  not(wallis((Y,X))),
  not(agent(_,_,(X,Y)) in T),
  all_clean_and_no_agents_or_dirt(T).