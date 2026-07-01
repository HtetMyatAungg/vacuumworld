correct(grid_size(16)).
correct(grid(loc(X,Y)) where X = 0..15 , Y = 0..7).
correct(seen(dirt(loc(X,Y))) where grid(loc(X,Y)) ).
correct(seen(agent(Id, loc(X,Y))) where grid(loc(X,Y)), seen(dirt(loc(X,Y))), atomic(L) ).
correct(seen(agent(Id, loc(X,Y), Colour)) where seen(agent(Id, loc(X,Y))), atomic(Colour)  ).
correct(empty_location(loc(X,Y)) where not(grid(loc(X,Y)), not(seen(dirt(loc(X,Y))) ), not(seen(agent(_, loc(X,Y)))) ).
wall(loc(0,Y), north).
wal
loc(NY, east).
wal
loc(YX, south).
wal
loc(X16, west).
forall((X,Y,NY,YX,X16),(id(X,Y,NY,YX,X16) ) :-
    grid(loc(X,Y)) ,
    grid(loc(X16)),
    grid(loc(NY,YX)),
    loc_dist(loc(X,Y),loc(X16),DXY),
    loc_dist(loc(X16),loc(NY,YX),DNY),
    DDX is abs(DXY - DNY),
    X = 0,
    X16 < 15,
    NY > 0
) :-
    wall(loc(X,NY+DDX), west).
forall((X,Y,NY,YX,X16),(id(X,Y,NY,YX,X16) ) :-
    grid(loc(X,Y)) ,
    grid(loc(X16)),
    grid(loc(NY,YX)),
    loc_dist(loc(X,Y),loc(X16),DXY),
    loc_dist(loc(X16),loc(NY,YX),DNY),
    DDX is abs(DXY - DNY),
    X = 15,
    X16 < 16,
    NY > 0
) :-
    wall(loc(X,NY+DDX), east).
forall((X,Y,NY,YX,X16),(id(X,Y,NY,YX,X16) ) :-
    grid(loc(X,Y)) ,
    grid(loc(X16)),
    grid(loc(NY,YX)),
    loc_dist(loc(X,Y),loc(X16),DXY),
    loc_dist(loc(X16),loc(NY,YX),DNY),
    DDX is abs(DXY - DNY),
    Y = 0,
    X16 < 8,
    NY > 0
) :-
    wall(loc(NY+DDX,YX), south).
forall((X,Y,NY,YX,X16),(id(X,Y,NY,YX,X16) ) :-
    grid(loc(X,Y)) ,
    grid(loc(X16)),
    grid(loc(NY,YX)),
    loc_dist(loc(X,Y),loc(X16),DXY),
    loc_dist(loc(X16),loc(NY,YX),DNY),
    DDX is abs(DXY - DNY),
    Y = 7,
    X16 < 8,
    NY > 0
) :-
    wall(loc(NY+DDX,YX), north).
forall((X,Y,NY,YX,X16),(id(X,Y,NY,YX,X16) ) :-
    grid(loc(X,Y)) ,
    grid(loc(X16)),
    (NY < 8,
     NY > -1
    ),
    wall(loc(NY+DDX,YX), west ).
forall((X,Y,NY,YX,X16),(id(X,Y,NY,YX,X16) ) :-
    grid(loc(X,Y)) ,
    grid(loc(X16)),
    (NY < 8,
     NY > -1
    ),
    wall(loc(NY+DDX,YX), east ).
forall((X,Y,NY,YX,X16),(id(X,Y,NY,YX,X16) ) :-
    grid(loc(X,Y)) ,
    grid(loc(X16)),
    (NY < 8,
     NY > -1
    ),
    wall(loc(NY+DDX,YX), south ).
forall((X,Y,NY,YX,X16),(id(X,Y,NY,YX,X16) ) :-
    grid(loc(X,Y)) ,
    grid(loc(X16)),
    (NY < 8,
     NY > -1
    ),
    wall(loc(NY+DDX,YX), north ).
forall((X,Y,NY,YX,X16),(id(X,Y,NY,YX,X16) ) :-
    grid(loc(X,Y)) ,
    grid(loc(X16)),
    (NY < 8,
     NY > -1
    ),
    wall(loc(NY+DDX,YX), south ).
forall((X,Y,NY,YX,X16),(id(X,Y,NY,YX,X16) ) :-
    grid(loc(X,Y)) ,
    grid(loc(X16)),
    (NY < 8,
     NY > -1
    ),
    wall(loc(NY+DDX,YX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DXY )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(NY+DXY,NY+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DXY )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(NY+DXY,NY+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DXY )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(NY+DXY,NY+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DXY )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(NY+DXY,NY+DDX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), north ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), west ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), east ).
forall((id(X,0,YX,X16,X17,Y1), (loc_dist(loc(0,YX),loc(NY,Y1)) =:= DDX )) :-
    ((NY < 8,
      NY > -1
     )
    ), wall(loc(YX+DXY,YX+DDX), south ).
forall((id(X,0,YX,X16,X17,Y1