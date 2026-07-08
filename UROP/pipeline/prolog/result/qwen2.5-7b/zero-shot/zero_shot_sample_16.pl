grid(8).
agent_present(r,3, '9af04778-08d6-4e40-8c6f-ba123d292a22', orange).
agent_present(r,5, '02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', green).
wall(west, 0, _, south).
wall(north, _, 0, east).
wall(south, _, 7, east).
wall(east, 3, _, north).
wall(east, 5, _, north).
wall(west, 2, (dirt, orange)).
wall(west, 4, (dirt, orange)).
wall(west, 6, (dirt, orange)).
wall(south, 0, _, south).
wall(north, _, 1, east).
wall(north, _, 2, east).
wall(north, _, 3, east).
wall(north, _, 4, east).
wall(north, _, 5, east).
wall(south, 6, _, south).