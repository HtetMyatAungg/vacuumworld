grid(grid([[_-7,-6,-5,-4,-3,-2,-1,0],[_-6,_-5,_-4,_-3,-2,-1,0,1],[_-5,_-4,_-3,-2,-1,0,1,2],[_-4,_-3,-2,-1,0,1,2,3],[_-3,_-2,-1,0,1,2,3,4],[_-2,_-1,0,1,2,3,4,5],[_-1,0,1,2,3,4,5,6],[0,1,2,3,4,5,6,7]))).

walls(grid(N)), N #= 8.

north_wall(grid(I)), I \< 1.

south_wall(grid(I)), I > 7.

west_wall(grid(I,J)), I = 0, J \< 1.

east_wall(grid(I,J)), I = 7, J \< 1.

content(grid(N,X,Y), Content), grid(M,K) = Content, ((M-X)*N-K=Y).

agent_content(grid(N,X,Y), AgentContent), content(grid(N,X,Y), agent(AgentId,AgentColor)), AgentContent is agent(AgentId,AgentColor), agent_content(grid(N,X,Y), (X,Y)).

dirt_content(grid(N,X,Y), DirtContent), content(grid(N,X,Y), dirt(DirtType)), Content is dirt(DirtType, DirtContent).

prolog_cleanup(grid(_)).

agent(AgentId), grid(I,J), AgentContent \= agent(_,_), Content = agent(AgentId,AgentColor), agent_content(grid(I,J), (I,J));grid(I,J), NContent \= agent(_,_), content(grid(I,J), dirt(DirtType, NContent)), Content is dirt(DirtType, NContent).