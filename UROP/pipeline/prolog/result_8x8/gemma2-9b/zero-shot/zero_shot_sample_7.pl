grid(0,6,wall(west)).
grid(1,6,[]).
grid(2,6,[]).
grid(0,7,wall([south, west])).
grid(1,7,wall(south)).
grid(2,7,wall(south)).

grid(0,5,wall(west)).
grid(1,5,[]).
grid(2,5,[]).
grid(0,4,wall(west)).
grid(1,4,[]).
grid(2,4,[]).

grid(0,3,agent('#id-9af04778-08d6-4e40-8c6f-ba123d292a22',orange)).
grid(1,3,[]).
grid(2,3,[]).

grid(0,2,wall(west)).
grid(1,2,[]).
grid(2,2,dirt(orange)). 
grid(0,1,wall(west)).
grid(1,1,[]).
grid(2,1,[]).

grid(0,0,wall([north, west])).
grid(1,0,wall(north)).
grid(2,0,wall(north)). 
grid(3,0,wall(north)). 

grid(3,1,[]).
grid(3,2,[]).
grid(3,3,[]).
grid(3,4,dirt(orange)). 


grid(3,5,[]).
grid(3,6,[]).
grid(3,7,wall(south)).

grid(4,5,[]).
grid(4,6,dirt(orange)).
grid(4,7,wall(south)).



grid(4,4,[]).
grid(4,3,[]).
grid(4,2,[]).
grid(4,1,[]) .

grid(4,0,agent('#id-02a6d9ea-8b8e-4750-8000-c3a74a63fd9c',green)).




grid(5,0,wall(north)). 
grid(5,1,dirt('green')). 

grid(5,2,[]).
grid(5,3,[]).
grid(5,4,[]).
grid(5,5,[]).

grid(5,6,[]).
grid(5,7,wall(south)). 
  



grid(6,5,[]).
grid(6,6,[]).
grid(6,7,wall(south)).
grid(6,4,dirt('orange')).

grid(6,3,[]).


grid(6,2,[]).
grid(6,1,[]). 


grid(6,0,wall(north)).



grid(7,0,wall([east, north])). 
grid(7,1,wall(east)).
grid(7,2,wall(east)).
grid(7,3,wall(east)).

grid(7,4,wall(east)).

grid(7,5,wall(east)).
grid(7,6,wall(east)).
grid(7,7,wall([east, south])).


