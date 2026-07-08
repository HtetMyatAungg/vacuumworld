grid_size(8).

grid(empty(_X,_Y)).

dirt(dirt_1, _Y, orange).
agent(agent_9af04778-08d6-4e40-8c6f-ba123d292a22, 0,5,orange).
agent(agent_02a6d9ea-8b8e-4750-8000-c3a74a63fd9c, 3,0,green).
agent(agent_02a6d9ea-8b8e-4750-8000-c3a74a63fd9c, _X,1,green).

wall(_X,_Y,north).
wall(_X,Y,south).
wall(X,_Y,east).
wall(X,_Y,west).

X is > 0,Y is > 0,! = (X,\+grid(empty(X,Y))) ! = (Y,\+grid(empty(X,Y))).

@halt.