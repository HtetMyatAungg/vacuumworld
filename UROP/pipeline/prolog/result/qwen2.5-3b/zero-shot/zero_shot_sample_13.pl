grid(
    row(0, [
        cell(0, 6, dirt),
        cell(1, 6, dirt),
        cell(2, 6, dirt),
        wall(north, 0),
        cell(3, 6, agent(id("9af04778-08d6-4e40-8c6f-ba123d292a22"), colour("orange")), south, 6)
    ]),
    row(1, [
        wall(north, 1),
        cell(2, 5, dirt),
        cell(3, 5, agent(id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c"), colour("green")), south, 5)
    ]),
    row(2, [
        wall(north, 2),
        cell(3, 4, dirt, west, 3),
        agent(id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c"), colour("green"), east, 2)
    ]),
    row(3, [
        wall(north, 3),
        cell(3, 3, dirt, west, 3),
        cell(4, 3, dirt, south, 3),
        agent(id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c"), colour("green"), east, 4)
    ]),
    row(4, [
        wall(north, 4),
        cell(4, 2, dirt, south, 4),
        agent(id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c"), colour("green"), east, 5)
    ]),
    row(5, [
        wall(north, 5),
        cell(5, 1, dirt, north, 5),
        agent(id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c"), colour("green"),
               east, 6)
    ]),
    row(6, [
        wall(north, 6),
        cell(6, 1, dirt, north, 6),
        agent(id("02a6d9ea-8b8e-4750-8000-c3a74a63fd9c"), colour("green"),
               east, 7)
    ]),
    row(7, [
        cell(7, 2, dirt, north, 7),
        wall(south, 7),
        cell(7, 1, dirt, south, 7),
        cell(7, 0, dirt, east, 7)
    ])
).