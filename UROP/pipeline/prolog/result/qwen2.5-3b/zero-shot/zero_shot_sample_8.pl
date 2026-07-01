grid([[[0,6,[_|_],[9af04778-08d6-4e40-8c6f-ba123d292a22,nil]],
         [1,6,[nil,_],[9af04778-08d6-4e40-8c6f-ba123d292a22,nil]],
         [2,6,[nil,nil],[9af04778-08d6-4e40-8c6f-ba123d292a22,nil]]],

[3,7,[_],['north',[9af04778-08d6-4e40-8c6f-ba123d292a22]],
[3,6,'south','east',[]],
[3,5,'west',[nil,_]],
[3,4,'north'],
...

[7,5,[w],['east',[02a6d9ea-8b8e-4750-8000-c3a74a63fd9c]],
[7,4,[],'east',[]],
[7,3,'north',['_'],['_','west',[nil,_]],[])],
[7,2,'west',[],['__']],[nil,[w],[]]],
[7,1]['_',[_],[],'north',[02a6d9ea-8b8e-4750-8000-c3a74a63fd9c]],
[7,0,[],'north',[],[nil,[nil,nil]]],
[7,2,'east',[_,w]],['w'],[]]),
[7,1],'_',[],
[7,0,['_',[_]],'north',[02a6d9ea-8b8e-4750-8000-c3a74a63fd9c],[nil,[nil]]],

[8,5,None,'west',[],['_','east',[nil,_],[]]],
[8,7,['_',[_]],'south',[_,_],[]],
[8,1,nil,'%','north',[w,nil,[_],[],[]]],
...
[4,3,None,'north',[]],
[4,5,w,[],'north',[],[],
[5,2,nil,w],[],[],['west'],[],[],[]]],
{}}).

validWalls(grid(_), Grid) :-
    memberchk(se, W),
    length(W, 16),
    findall([X,Y], (member(row(X,_), Grid), !member(col(X,Y), Grid)), Walls),
    checkBoundary(Grid, {north,Walls1}, WB2),
    findall([X,Y], (member((row(X),col(Y),D), WB2), Y0 =:= 0, X0 < 7, D == _|_[Y,X,D]), Walls),
   !,
    checkHorizontalGrid(Grid,{WB3}).

checkBoundary(_Grid, DirMap, WB) :-
    findall([X,Y], (member((row(X),col(Y),D),DirMap), Y =:= 0, X < 7, D == _|_(Y,X,D)), Walls),
   !,
    checkVerticalGrid(Grid,{WB}).

checkVerticalGrid(grid(_), DirMap) :-
    length(DirMap,16),
    findall([X,Y], (member((row(X),col(Y),D),DirMap), Y0 =:= 0, X < 7, D == _|_[Y,X,D]), Walls),
   !,
        checkBoundary(Grid,{WB}).

validWalls(grid(_), Grid) :-
    memberchk(se, W),
    length(W, N),
    N > 8,
    findall([X,Y], (member((row(X),col(Y)),-WB2), Y0 =:= 0, X < 7, -WB2 == _|_[Y,X,-WB2]), Waires1),
   !,
    checkBoundary(Grid,{WB3}),
    findall(Z,X=(row(X0),col(Z))-(row(X1),col(Z)),Waires3),
   !,
    allInOne([_],[],Waires1,Waires3).

add(-Y, [_|X],[nil|Y]):-!,
  add(Y,X,Z).
add(_,_,[Z]).