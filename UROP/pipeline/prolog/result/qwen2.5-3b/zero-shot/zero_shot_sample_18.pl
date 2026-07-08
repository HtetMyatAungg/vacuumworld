grid(grid(10,
    [([0,6],walls([west])),
     ([1,6],empty),
     ([2,6],empty),
     ([0,7],walls([south,west])),
     ([1,7],walls([south])),
     ([2,7],walls([south])),
     ([0,5],walls([west])),
     ([1,5],empty),
     ([2,5],empty),
     ([0,4],walls([west])),
     ([1,4],empty),
     ([2,4],empty),
     ([0,3],[9af04778-08d6-4e40-8c6f-ba123d292a22|empty)],
     ([1,3],empty),
     ([2,3],empty),
     ([0,2],walls([west])),
     ([1,2],empty),
     ([2,2],empty),
     ([0,1],walls([west])),
     ([1,1],empty),
     ([2,1],[green|orange]),
     ([0,0],walls([north,west])),
     ([1,0],walls([north])),
     ([2,0],walls([north])),
     ([3,0],walls([north])),
     ([3,1],empty),
     ([3,2],empty),
     ([3,3],empty),
     ([3,4],[orange|green]),
     ([3,5],empty),
     ([3,6],empty),
     ([3,7],walls([south])),
     ([4,5],empty),
     ([4,6],[orange|green]),
     ([4,7],walls([south])),
     ([4,4],empty),
     ([4,3],empty),
     ([4,2],empty),
     ([4,1],empty),
     ([4,0],walls([north|east])),
     ([5,0],walls([north])),
     ([5,1],[green|empty]),
     ([5,2],empty),
     ([5,3],empty),
     ([5,4],empty),
     ([5,5],empty),
     ([5,6],empty),
     ([5,7],walls([south])),
     ([6,5],walls([])),
     ([6,6],walls([])),
     ([6,7],walls([south])),
     ([6,4],[orange|green]),
     ([6,3],walls([])),
     ([6,2],walls([])),
     ([6,1],walls([])),
     ([6,0],walls([north])),
     ([7,0],walls([east,north])),
     ([7,1],walls([east])),
     ([7,2],walls([east])),
     ([7,3],walls([east])),
     ([7,4],walls([east])),
     ([7,5],walls([east])),
     ([7,6],walls([east])),
     ([7,7],walls([north,south]))
    ]
   )
).
grid(grid(N,Walls),
     N,
     [W|Ws],
     Walls=[W|Wals]
).

greenWall(x,y). greenWall(7,0). greenWall(4,5). greenWall(6,6). greenWall(4,7). greenWall(6,7). greenWall(7,1). greenWall(7,3). greenWall(7,4). greenWall(6,4).

orangeWall(x,y). orangeWall(3,4). orangeWall(3,5). orangeWall(0,0). orangeWall(1,0). orangeWall(2,1). orangeWall(5,0). orangeWall(5,1). orangeWall(7,1). orangeWall(3,7). orangeWall(6,6). orangeWall(4,7).

northWest(x,y,Walls). northEast(x,y,Walls).
northWest(0,0,[west]).
northWest(3,0,[east,north]).
northWest(5,0,[east,north]).
northWest(0,1,[west]).
northWest(4,x,[east]).
northWest(2,0,[west]).

northEast(x,y,Walls). northEast(x,Ny,Walls).
northEast(7,6,[south]).
northEast(Nx,7,Walls).
northEast(Nx,Y,Walls) :- Y<Nx.
northEast(X,Ny,Walls) :- X<Ny, not(northWest(X,Ny,Walls)).

wallNorthWest(x,y). wallSouthWest(x,y). wallNortheast(x,y). wallSouthEast(x,y).

wallSouth(x,y).
wallSouth(Nx,Y) :- Nx<N.

northWall(0,Y). northX(Walls) :- Wall=X|Walls, not(wallNorth(X,Walls)), X<Y.
southWall(Y,X). southX(Walls) :- Wall=X|Walls, not(wallSouth(X,Walls)), Y>X.