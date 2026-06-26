% ground truth/oracle: 8x8 sweep
:- discontiguous seen/1.
:- discontiguous wall/2.
seen(loc(0, 6)).
seen(loc(1, 6)).
seen(loc(2, 6)).
seen(loc(0, 7)).
seen(loc(1, 7)).
seen(loc(2, 7)).
seen(loc(0, 5)).
seen(loc(1, 5)).
seen(loc(2, 5)).
seen(loc(0, 4)).
seen(loc(1, 4)).
seen(loc(2, 4)).
seen(loc(0, 3)).
seen(loc(1, 3)).
seen(loc(2, 3)).
seen(loc(0, 2)).
seen(loc(1, 2)).
seen(loc(2, 2)).
seen(loc(0, 1)).
seen(loc(1, 1)).
seen(loc(2, 1)).
seen(loc(0, 0)).
seen(loc(1, 0)).
seen(loc(2, 0)).
seen(loc(3, 0)).
seen(loc(3, 1)).
seen(loc(3, 2)).
seen(loc(3, 3)).
seen(loc(3, 4)).
seen(loc(3, 5)).
seen(loc(3, 6)).
seen(loc(3, 7)).
seen(loc(4, 5)).
seen(loc(4, 6)).
seen(loc(4, 7)).
seen(loc(4, 4)).
seen(loc(4, 3)).
seen(loc(4, 2)).
seen(loc(4, 1)).
seen(loc(4, 0)).
seen(loc(5, 0)).
seen(loc(5, 1)).
seen(loc(5, 2)).
seen(loc(5, 3)).
seen(loc(5, 4)).
seen(loc(5, 5)).
seen(loc(5, 6)).
seen(loc(5, 7)).
seen(loc(6, 5)).
seen(loc(6, 6)).
seen(loc(6, 7)).
seen(loc(6, 4)).
seen(loc(6, 3)).
seen(loc(6, 2)).
seen(loc(6, 1)).
seen(loc(6, 0)).
seen(loc(7, 0)).
seen(loc(7, 1)).
seen(loc(7, 2)).
seen(loc(7, 3)).
seen(loc(7, 4)).
seen(loc(7, 5)).
seen(loc(7, 6)).
seen(loc(7, 7)).
wall(loc(0, 6), west).
wall(loc(0, 7), south).
wall(loc(0, 7), west).
wall(loc(1, 7), south).
wall(loc(2, 7), south).
wall(loc(0, 5), west).
wall(loc(0, 4), west).
wall(loc(0, 3), west).
wall(loc(0, 2), west).
wall(loc(0, 1), west).
wall(loc(0, 0), north).
wall(loc(0, 0), west).
wall(loc(1, 0), north).
wall(loc(2, 0), north).
wall(loc(3, 0), north).
wall(loc(3, 7), south).
wall(loc(4, 7), south).
wall(loc(4, 0), north).
wall(loc(5, 0), north).
wall(loc(5, 7), south).
wall(loc(6, 7), south).
wall(loc(6, 0), north).
wall(loc(7, 0), east).
wall(loc(7, 0), north).
wall(loc(7, 1), east).
wall(loc(7, 2), east).
wall(loc(7, 3), east).
wall(loc(7, 4), east).
wall(loc(7, 5), east).
wall(loc(7, 6), east).
wall(loc(7, 7), east).
wall(loc(7, 7), south).
seen(dirt(loc(2, 1), orange)).
seen(dirt(loc(3, 4), orange)).
seen(dirt(loc(4, 6), orange)).
seen(dirt(loc(5, 1), green)).
seen(dirt(loc(6, 4), orange)).
seen(agent('9af04778-08d6-4e40-8c6f-ba123d292a22', loc(0, 3), orange)).
seen(agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', loc(4, 0), green)).
