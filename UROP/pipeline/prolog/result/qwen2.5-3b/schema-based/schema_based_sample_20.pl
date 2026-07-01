grid_size(9).
seen(dirt(loc(X,Y))) :-
    member(Member = [X|Y], @PerceptLog),
    Member is [0..8, _, Y].
seen(agent(Id, loc(X,Y), Colour)) :-
    Agent = {id(Id), colour(Colour)},
    member([Id,loc(X,Y),Colour], @PerceptLog).
empty_location(loc(Row,Col)) :-
    Row >= 0,
    Col >= 0,
    Row < N,
    Col < M,
    not(member(dirt(loc(X,Y)), @PerceptLog)),
    not(member(agent(Id, loc(X,Y), _), @PerceptLog)).
    
% Section B — Wall rules:

wall(loc(1,M), west) :- M =< 5.
wallexit(loc(N,1), east).
wallexit(loc(M,N-1), north).
wallexit(loc(N,M), south).

grid_size(9) :-
    member(Fact, @PerceptLog),
    atom_string(N, Fact),
    integer(N).