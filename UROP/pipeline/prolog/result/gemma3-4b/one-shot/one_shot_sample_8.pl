grid_size(8).
grid(x, y) :- x > 0 , x < 8 , y > 0 , y < 8 .
dirt(x, y, colour) :- x > 0 , x < 7 , y > 0 , y < 7 , colour = 'green' .
dirt(x,y,color) :- x>0,x<7,y>1,y<6, color = 'orange'.

agent(id, x, y, colour) :- x > 0 , x < 3 , y > 0 , y < 7, id like 'agent-%'.
agent(id, x, y, colour) :- x == 3, y == 7, color = 'orange', id = '9af04778-08d6-4e40-8c6f-ba123d292a22'.
agent(id, x, y, colour) :- x > 0 , x < 8, y > 0 , y < 8,  color = 'white'.

empty(x, y) :- x > 0, x < 8, y > 0 , y < 8 .
wall(x, y, north) :- x > 0, x < 7, y == 0.
wall(x, y, south) :- x > 0, x < 7, y == 7.
wall