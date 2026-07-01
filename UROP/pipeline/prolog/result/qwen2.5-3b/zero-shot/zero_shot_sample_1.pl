grid(grid(X,Y,[[_C06f(_D352a,_87e6(_C06f,_D233(null,null))],[null,null,null,null,_D233(null)]
                  ,[null,null,null,null,_D233(null,null)]
                  ,[_14b1,null,null,_D233(_14b1,null)]
                  ,[null,null,null,_C06f(null,null)]
                  ,[null,null,_D233(_d4c6,null)
                  ,[null,null,_D233(null)]
                  ,[null,null,_D233(_5bf8,null)]
                  ,[]]).
north_wall(grid(9, 0); grid(9, X)): X = 9).
south_walls(grid(9, 7)).
east_wall((grid(9, _I, _J), (Y is J; Y + 1 is J), not(cell(grid(9, _I, _J): member(AgentId, cell(grid(9, _I, _J))), grid(9, _I, _J) = null)).
west_wall((grid(9, _I, _J), (Y is J-1; Y - 1 is J), not(cell(grid(9, _I, _J): member(AgentId, cell(grid(9, _I, _J))), grid(9, _I, _J) = null).
agent(grid(9, I, J)): (not(cell(grid(9, I, J): member(AgentId, cell(grid(9, I, J))), grid(9, _I, _J) = null; agent_id)): (grid(9, I, J)).
dirt((grid(9, I, J), not(cell(grid(9, I, J: member(AgentId, cell(grid(9, I, J)), grid(9, _I, _J) = null).