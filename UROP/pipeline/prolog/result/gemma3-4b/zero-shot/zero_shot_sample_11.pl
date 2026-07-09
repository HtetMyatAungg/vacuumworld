edge(X, Y) :- between(0, 7).
grid(N) :- N > 0.
coord(X, Y) :- X >= 0, X < 8, Y >= 0, Y < 8.
wall(X,Y, WallType) :- coord(X, Y), (WallType ins 'north', Y = 0) ; (WallType ins 'south', Y = 7) ; (WallType ins 'east', X = 7) ; (WallType ins 'west', X = 0).
dirt(X, Y, DirtType) :- coord(X, Y), (DirtType ins 'orange') ; (DirtType ins 'green') ; DirtType = null.
agent(X, Y, AgentID, Colour) :- coord(X, Y), (AgentID == '9af04778-08d6-4e40-8c6f-ba123d292a22', Colour = 'orange') ; (AgentID == '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', Colour = 'green').