grid_size(10).  
grid(loc(X,Y)) :-
    X in 0..9,
    Y in 0..9.
seen(dirt(loc(X,Y), Colour)) :-
    grid(loc(X,Y)),
    ground(Colour),
    alldifferent([X,Y], Xs),
    list_to_set(Xs).
seen(agent(Id, loc(X,Y), Colour)) :-
    grid(loc(X,Y)),
    nonvar(Id),
    nonvar(Colour),
    ground(Id),
    ground(Colour),
    alldifferent([X,Y], Xs),
    list_to_set(Xs).
empty_location(loc(X,Y)) :-
    \+ grid(loc(X,Y)),
    \+ seen(dirt(loc(X,Y,_))),
    \+ seen(agent(_,loc(X,Y,_))).

walddir(walk_dir, walk_dir).
walddir(case_lats, case_lats).
walddir(wha_dir, wha_dir).
walddir(laldr, laldr).  
walddir_wwl(wll, wll).
walddir_wh(wlh, wh2h).
walddir_wh(wlh1, whdhl).

case_dir(case_lats, case_lats).
case_dir(walk_dir, walk_dir).
case_dir(wha_dir, wha_dir).
case_dir(laldr, laldr).
case_dir(wh_hl, whl_dirs).
case_dir(whl2_, walk_dir).  

walddir_wl(wlh, wll).
walddir_wh(wlh1, whl_dirs).

walldir_wwl(wll2, wll2).
walddir_wll(wll3, wll).
walddir_wh(hla1h, laldr).  
walddir_wh(lah1a, walk_dir).
walddir_wh(wha2d, wha_dir).

walldir_wwl_wwl(wlh, wll).
walddir_wh_wwl(wli, whl_dirs). 

case_dir(case_lats_1, case_lats_1).
case_dir(laldr_1, walk_dir).
case_dir(wha_dir_1, walk_dir).
case_dir(wwhi, case_lats).
case_dir(hlaeh2, walk_dir).
case_dir(wlla3, laldr).  

walldir_wll5,wli4_(walk_dir).

wall(loc(X,Y), dir(Wall)):-
    \+ grid(loc(X,Y)),
    nonvar(Y),
    Y < 0,
    ground(dir(Walk)).
walldir_wwl(whh2a, walk_dir).

case_lats1, walldir_wh(walhhd2, walk_dir).
case_lats3, walddir_case_lats(wlahlh5, halaeh2).  

wall(loc(X,Y), dir(Walk)):-
    \+ grid(loc(X,Y)),
    nonvar(Y),
    ground(dir(Whl)).
walldir_wh_wwl(whf_ha1, walk_dir).

case_lats4, walldir_wll(wlh1a3, wlahlhd2).  

walddir(case_dir, case_dir).
walldir_wwl(case_dir_1, case_dir).  
walddir_wwl(case_dir1_, case_dir):

walddir_whi1(whh1dh4, lalaehd2).

case_dir_wwl(wlh5_, wllh3).  

case_lats5, walldir_wll(laldr_2, walk_dir).