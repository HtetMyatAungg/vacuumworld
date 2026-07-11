grid_size(8).

walled_north(x0,y0).
walled_north(x1,y1).
walled_north(x2,y2).
walled_west(x3,y3).
walled_west(x4,y4).
walled_south(x5,y5).
walled_east(x6,y6).

agent_at(x4,y0,agent_id('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',green)).
agent_at(x0,y3,agent_id('9af04778-08d6-4e40-8c6f-ba123d292a22',orange)).

dirt_present_at(x0,y5).
dirt_present_at(x3,y4).
dirt_present_at(x6,y5).
dirt_present_at(x7,y1).
dirt_present_at(x7,y2).
dirt_present_at(x7,y3).
dirt_present_at(x7,y4).

empty_at(_,_).