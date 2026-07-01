grid_size(14).
grid(loc(X, Y)) :-
    ( X between 0, 13 ; Y between 0, 13 )..
seen(dirt(loc(X, Y), Colour)) :-
    percept({coord:[X,Y],dirt:Visibility},_),
    atom_chars(Visibility,Chars),
    ColorList = ['null'|Chars],
    member(Colour,ColorList).
seen(agent(Id, loc(X,Y), Colour)) :-
    percept({coord:[X,Y],agent:AgentDetails},_),
    Id \= "null",
    AgentColour is casefold_atom(lowercase_atom(Colour)),
    atomic_list_concat([Id,'-',AgentColour],_,AgentStr),
    atom_chars(AgentStr,Chars),
    ColourList = ['null'|Chars],
    member(Colour,ColourList).
seen(agent(_, loc(X,Y), "green")) :-
    percept({coord:[X,Y],dirt:Visibility},_), Visibility == 'green'.
seen(agent(Id, loc(X,Y), "orange")) :-
    percept({coord:[X,Y],agent:AgentDetails},_),
    Id \= "null",
    AgentColour is casefold_atom(lowercase_atom(Colour)),
    atomic_list_concat([Id,'-',AgentColour],_,AgentStr),
    atom_chars(AgentStr,Chars),
    ColourList = ['null'|Chars],
    member("orange",ColourList).
empty_location(loc(X,Y)) :-
    percept({coord:[X,Y]},_).
wall(loc(X,-1), west) :- grid(loc(X,Y)), X > 0, \+ grid(loc(X-1,_)).
wal‌l(loc(X,+1), east) :- grid(loc(X,Y)), X < last(last(grid),1)-1.
wal‌r(loc(-1,Y), south) :- grid(loc(X,Y)), Y > 0, \+ grid(loc(_,Y-1)).
wall(loc(+1,Y), north) :- grid(loc(X,Y)), Y < first(first(grid),1).