grid(grid([[[null,null,null],[null,dirt(orange),null],[null,null]],
           [[null,null,null],[null,null,null],[dirt(orange),null,dirt(green)],
            [null,dirt(green),null]], 
           [[null,null,null],[null,null,null],[dirt(orange),null,dirt(green)],
            [null,dirt(green),null]], 
           [[null,null,null],[null,null,dirt(orange)],[],[]],
           [[null,null,null],[null,null,null],[dirt(orange),null,dirt(green)],
            [null,dirt(green),null]],
           [[null,null,null],[null,null,null],agent(id(9af04778-08d6-4e40-8c6f-ba123d292a22,orange)],[],[]],
           grid([[[_north,_west]],[[_south]],[[_north]],[[_east,_north]],[[_north]],[[_south]],[[_north]],[[_east,_south]]])).

wall(wallows([[[_north]],[_west]])).

walk(wallows([[[_south]],[_east,_north]])).

agent(agent([id(9af04778-08d6-4e40-8c6f-ba123d292a22,orange)])).

wall(wallows([[[_north]],[_west]])).

walk(wallows([[[_south]],[_east,_north]])).
   
agent(agent([id(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c,green)])).
  
walk(wallows([[[_north]],[_west]])).

walk(wallows([[[_south]],[_east,_north]])).