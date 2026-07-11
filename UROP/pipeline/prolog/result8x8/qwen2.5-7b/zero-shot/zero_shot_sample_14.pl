grid_size(8).
walls([[0,6], "west"]).
walls([[1,7], "south"]).
walls([[2,7], "south"]).
walls([[0,5], "west"]).
walls([[0,4], "west"]).
walls([[0,3], "west", dirt("orange")]) :- true.
walls([[2,3], "south"]).
walls([[0,2], "west"]).
walls([[1,0], "north"]).
walls([[2,0], "north"]).
walls([[3,0], "north"]).
walls([[4,5], "south", dirt("orange")]) :- true.
walls([[5,0], "north"]).
walls([[6,5], "south", dirt("orange")]) :- true.
walls([[7,0], "east", "north"]).
walls([[7,1], "east"]).
walls([[7,2], "east"]).
walls([[7,3], "east"]).
walls([[7,4], "east"]).
walls([[7,5], "east"]).
walls([[7,6], "east"]).
walls([[7,7], "east", "south"]).