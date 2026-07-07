grid_size(7).
grid(X,Y) :- between(0,6,X), between(0,6,Y).
dirt(6,4,'orange').
dirt(5,1,'green').
dirt(6,5,'green').
agent(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c,4,0,'green').
agent(90a19ba0-5474-479f-a9ad-df5232bbce5b,5,1,'green').  
agent(9fc869e7-895c-45cb-b24d-9bf8b30a8ecf,3,5,'green'). 


wall(X,7,'south'). 
wall(X,0,'north'). 
wall(0,Y,'west').  
wall(6,Y,'east'). 


