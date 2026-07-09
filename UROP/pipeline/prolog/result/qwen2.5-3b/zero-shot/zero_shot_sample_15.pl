grid(grid(0,6,nil), grid(1,6,nil), grid(2,6,nil)).
grid(grid(0,7,[west,south],nil), grid(1,7,[],south,nil), grid(2,7,[],nil)).
grid(grid(0,5,[west],nil,agent(id("9af04778-08d6-4e40-8c6f-ba123d292a22"),colour("orange"))), grid(1,5,nil), grid(2,5,[],nil)).
grid(grid(0,4,[west],nil,nil), grid(1,4,nil), grid(2,4,nil)).
grid(grid(0,3,[west],agent(nil,nil:nil),nil), grid(1,3,nil), grid(2,3,nil)).
grid(grid(0,2,[west],nil,nil), grid(1,2,nil), grid(2,2,nil)).
grid(grid(0,1,[west],nil,nil:nil), nil(nil), grid(2,1,nil)).
grid(agent(id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c"),colour("green")), grid(1,0,[],north_(:-nil)), grid(2,0,[],north_(:-nil))).
south_walls(south).
north_walls(north).
north(west,north).
south(west,south).