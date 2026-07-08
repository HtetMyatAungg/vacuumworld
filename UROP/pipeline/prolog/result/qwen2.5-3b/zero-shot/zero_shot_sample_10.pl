grid(area(
    area(0, 6)..
    area(1, 6)..
    area(2, 6)..
    area(3, 7) north..
    area(4, 7) south..
    area(5, 7) south..
    area(6, 7) south..
    area(7, 0) north east..
    area(7, 1) east..
    area(7, 2) east..
    area(7, 3) east..
    area(7, 4) east..
    area(7, 5) east..
    area(7, 6) south
)).

agent(area(_, _), id("9af04778-08d6-4e40-8c6f-ba123d292a22"), color(orange)).
agent(area(_, _), id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c"), color(green)).

wall(area(X, Y), north) :- X = 0.
wall(area(X, Y), north) :- X = A, Y > A, A #< 7.
wall(area(X, Y), south) :- Y = 7.
wall(area(X, Y), east) :- X = 7, Y #> 0.
wall(area(X, Y), west) :- X = 0.

dirt(area(X, Y)) :- area(X, Y), dirt_value(area(X, Y), DirtVal), DirtVal \= null.
dirt_value(area(0, 6), DirtVal)..
dirt_value(area(3, 4), DirtVal)..
dirt_value(area(4, 5), DirtVal)..
dirt_value(area(4, 7), DirtVal)..
dirt_value(area(5, 1), DirtVal)..
dirt_value(area(6, 3), DirtVal).
dirt_value(_, null).