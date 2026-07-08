grid(7, 8).
wall([0,0], north).
wall([1,0], north).
wall([2,0], north).
wall([3,0], north).
wall([4,0], north).
wall([5,0], north).
wall([6,0], north).
wall([7,0], east,north).
wall([7,1], east).
wall([7,2], east).
wall([7,3], east).
wall([7,4], east).
wall([7,5], east).
wall([7,6], east).
wall([7,7], east,south).

at_agent(["9af04778-08d6-4e40-8c6f-ba123d292a22", "orange"], [0,3]).
at_dirt("orange", [2,3]).
at_dirt("orange", [4,5]).
at_dirt("green", [4,0]).
at_dirt("orange", [6,4]).