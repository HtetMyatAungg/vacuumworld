grid(
    row(0, [
        cell(0, 6, west),
        cell(1, 6),
        cell(2, 6)
    ]),
    row(1, [
        cell(0, 7, south, west),
        cell(1, 7, south),
        cell(2, 7, south)
    ]),
    row(2, [
        cell(0, 5, west),
        cell(1, 5),
        cell(2, 5)
    ]),
    row(3, [
        cell(0, 4, west),
        cell(1, 4),
        cell(2, 4)
    ]),
    row(4, [
        cell(0, 3, west),
        cell(1, 3, green),
        cell(2, 3),
        cell(3, 4, orange),
        cell(3, 5),
        cell(3, 6),
        cell(7, 7, south)
    ]),
    row(5, [
        cell(0, 0, north, west),
        cell(1, 0, north),
        cell(2, 0, north),
        cell(3, 1),
        cell(4, 0, north),
        cell(5, 0, north),
        cell(6, 0, north)
    ]),
    row(6, [
        cell(3, 5),
        cell(4, 5, orange),
        cell(6, 5),
        cell(7, 6, south)
    ]),
    row(7, [
        cell(7, 1, east, south),
        cell(7, 2, east),
        cell(7, 3, east),
        cell(7, 4, east),
        cell(7, 5, east),
        cell(7, 6)
    ])
).

north_west_wall.
south_west_wall.
west_wall.
north_east_wall.
north_wall.
east_wall.
south_wall.