% Convention used is Event Fluent Time for easier left to right readiblity

:- dynamic happensAt/2.
:- dynamic initiatesAt/3.
:- dynamic terminatesAt/3.
:- dynamic initially/2.

:- discontiguous happensAt/2.
:- discontiguous terminatesAt/3.
:- discontiguous initiatesAt/3.
:- discontiguous initially/2.

initial(0). % Initial time is 0.

holdsAt(F, T) :- 
    initial(0),
    initially(F, 0),
    0 =< T,
    \+ brokenAt(F, 0, T).
holdsAt(F, T) :-
    happensAt(E, Ti),
    Ti =< T,
    initiatesAt(E, F, Ti),
    \+ brokenAt(F, Ti, T).

brokenAt(F, Ts, Tend) :-
    happensAt(E, Ti),
    terminatesAt(E, F, Ti),
    Ts =< Ti, Ti =< Tend.

% Bump rule: Bump happens when the agent does not change coordinate in a direction. When a bump happens, it assertz a fact of wallAt/3.
:- dynamic wallAt/3.
:- discontiguous wallAt/3.
:- dynamic bump/4.
:- discontiguous bump/4.

bump(D, X, Y, T) :-
    happensAt(move(D), T),
    holdsAt(at(X,Y), T),
    \+ wallAt(X,Y,D),
    assertz(wallAt(X, Y, D)). % Belief Expansion: adding new facts to grow the KB monotonically. aka monotonic knowledge accumulation

% Find(N) logic

%to find n of a square, we look at the 2 asserted wallAt and their D. Get Xmin and Xmax from wallAt.
% X and Y always starts at 0 and ends at N-1.

findbyWidth(N) :-
    wallAt(Xmin,_,west),
    wallAt(Xmax,_,east),
    N is Xmax - Xmin + 1.

findbyHeight(N) :-
    wallAt(_,Ymin,north),
    wallAt(_,Ymax,south),
    N is Ymax - Ymin + 1.

% square-grid assumption
find(N) :- 
    findbyWidth(N),
    findbyHeight(N).

