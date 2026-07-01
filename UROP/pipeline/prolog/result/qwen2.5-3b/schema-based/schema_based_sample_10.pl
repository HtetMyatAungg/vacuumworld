grid_size(8).

grid(loc(X, Y)) :-
    (   X >= 0, X =< 7
    -> true ;
       failure ),
    (   Y >= 0, Y =< 7
    -> true ;
       failure ).

seen(dirt(loc(X,Y), green)) :-
    percept(
      [
        { "coord": [ X, Y ],
          "walls": [],
          "dirt": null,
          "agent": null },
        { "coord": [ X, Y ],
          "walls": [],
          "dirt": "green",
          "agent": null }
      ] ).

seen(dirt(loc(X,Y), orange)) :-
    percept(
      [
        { "coord": [ X, Y ],
          "walls": [],
          "dirt": null,
          "agent": null },
        { "coord": [ X, Y ],
          "walls": [],
          "dirt": "orange",
          "agent": null }
      ] ).

seen(agent(Id, loc(X,Y), green)) :-
    percept(
      [
        { "coord": [ X, Y ],
          "walls": [],
          "dirt": null,
          "agent": { id: Id, colour: green } },
        { "coord": [ X, Y ],
          "walls": [],
          "dirt": null,
          "agent": { id: Id, colour: green } }
      ] ).

seen(agent(Id, loc(X,Y), orange)) :-
    percept(
      [
        { "coord": [ X, Y ],
          "walls": [],
          "dirt": null,
          "agent": { id: Id, colour: orange } },
        { "coord": [ X, Y ],
          "walls": [],
          "dirt": null,
          "agent": { id: Id, colour: orange } }
      ] ).

empty_location(loc(X,Y)) :-
    percept(
      [
        { "coord": [ X, Y ],
          "walls": [ "north", "east" ],
          "dirt": null,
          "agent": null },
        { "coord": [ X, Y ],
          "walls": [ "south", "west", "east" ],
          "dirt": null,
          "agent": null }
      ] ).

wall(loc(X,Y,north)) :-
    grid(loc(X, 0); loc(s_n1(_X, L+1), Y) ; _).

wall(loc(X,Y,south)) :-
    grid(loc(_Y,X); loc(n_s1(Y-1), X ; s_n8(_X, _Y) ; N).

wall(loc(X,Y,east)) :-
    grid(loc(L,Y) ; loc(s_eL(- _X+1), Y) ; _).

wall(loc(X,Y,west)) :-
    grid(loc(f_Ln(- _Y), Y) ; loc(n_w8(X-1), Y); _).

wal(l(_,N)(grid(loc(C,N(_X,L)) ; grid(loc(N_C(_C), C) ; N)).
wal(l((_,_))(not(grid(_))).