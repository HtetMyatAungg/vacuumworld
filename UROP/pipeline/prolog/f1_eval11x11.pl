% ground truth/oracle: 11x11 sweep
:- discontiguous oracle_dirt/3.
:- discontiguous oracle_agent/4.
:- discontiguous oracle_empty/2.
:- discontiguous wall/3.
grid_size(11).
grid(0, 9).
grid(1, 9).
grid(2, 9).
grid(0, 10).
grid(1, 10).
grid(2, 10).
grid(0, 8).
grid(1, 8).
grid(2, 8).
grid(0, 7).
grid(1, 7).
grid(2, 7).
grid(0, 6).
grid(1, 6).
grid(2, 6).
grid(0, 5).
grid(1, 5).
grid(2, 5).
grid(0, 4).
grid(1, 4).
grid(2, 4).
grid(0, 3).
grid(1, 3).
grid(2, 3).
grid(0, 2).
grid(1, 2).
grid(2, 2).
grid(0, 1).
grid(1, 1).
grid(2, 1).
grid(0, 0).
grid(1, 0).
grid(2, 0).
grid(3, 0).
grid(3, 1).
grid(3, 2).
grid(3, 3).
grid(3, 4).
grid(3, 5).
grid(3, 6).
grid(3, 7).
grid(3, 8).
grid(3, 9).
grid(3, 10).
grid(4, 8).
grid(4, 9).
grid(4, 10).
grid(4, 7).
grid(4, 6).
grid(4, 5).
grid(4, 4).
grid(4, 3).
grid(4, 2).
grid(4, 1).
grid(4, 0).
grid(5, 0).
grid(5, 1).
grid(5, 2).
grid(5, 3).
grid(5, 4).
grid(5, 5).
grid(5, 6).
grid(5, 7).
grid(5, 8).
grid(5, 9).
grid(5, 10).
grid(6, 8).
grid(6, 9).
grid(6, 10).
grid(6, 7).
grid(6, 6).
grid(6, 5).
grid(6, 4).
grid(6, 3).
grid(6, 2).
grid(6, 1).
grid(6, 0).
grid(7, 0).
grid(7, 1).
grid(7, 2).
grid(7, 3).
grid(7, 4).
grid(7, 5).
grid(7, 6).
grid(7, 7).
grid(7, 8).
grid(7, 9).
grid(7, 10).
grid(8, 8).
grid(8, 9).
grid(8, 10).
grid(8, 7).
grid(8, 6).
grid(8, 5).
grid(8, 4).
grid(8, 3).
grid(8, 2).
grid(8, 1).
grid(8, 0).
grid(9, 0).
grid(9, 1).
grid(9, 2).
grid(9, 3).
grid(9, 4).
grid(9, 5).
grid(9, 6).
grid(9, 7).
grid(9, 8).
grid(9, 9).
grid(9, 10).
grid(10, 8).
grid(10, 9).
grid(10, 10).
grid(10, 7).
grid(10, 6).
grid(10, 5).
grid(10, 4).
grid(10, 3).
grid(10, 2).
grid(10, 1).
grid(10, 0).
wall(0, 9, west).
wall(0, 10, south).
wall(0, 10, west).
wall(1, 10, south).
wall(2, 10, south).
wall(0, 8, west).
wall(0, 7, west).
wall(0, 6, west).
wall(0, 5, west).
wall(0, 4, west).
wall(0, 3, west).
wall(0, 2, west).
wall(0, 1, west).
wall(0, 0, north).
wall(0, 0, west).
wall(1, 0, north).
wall(2, 0, north).
wall(3, 0, north).
wall(3, 10, south).
wall(4, 10, south).
wall(4, 0, north).
wall(5, 0, north).
wall(5, 10, south).
wall(6, 10, south).
wall(6, 0, north).
wall(7, 0, north).
wall(7, 10, south).
wall(8, 10, south).
wall(8, 0, north).
wall(9, 0, north).
wall(9, 10, south).
wall(10, 8, east).
wall(10, 9, east).
wall(10, 10, east).
wall(10, 10, south).
wall(10, 7, east).
wall(10, 6, east).
wall(10, 5, east).
wall(10, 4, east).
wall(10, 3, east).
wall(10, 2, east).
wall(10, 1, east).
wall(10, 0, east).
wall(10, 0, north).
oracle_dirt(1, 4, orange).
oracle_dirt(3, 3, orange).
oracle_dirt(3, 6, orange).
oracle_dirt(5, 7, orange).
oracle_dirt(7, 5, green).
oracle_dirt(9, 2, green).
oracle_dirt(9, 7, green).
oracle_agent('d3af9897-9139-4ffe-8a15-2e9c6f06e71a', 1, 0, orange).
oracle_agent('d6428e63-73b7-40a5-9cc9-ea3b5e61a86d', 5, 0, green).
oracle_empty(0, 9).
oracle_empty(1, 9).
oracle_empty(2, 9).
oracle_empty(0, 10).
oracle_empty(1, 10).
oracle_empty(2, 10).
oracle_empty(0, 8).
oracle_empty(1, 8).
oracle_empty(2, 8).
oracle_empty(0, 7).
oracle_empty(1, 7).
oracle_empty(2, 7).
oracle_empty(0, 6).
oracle_empty(1, 6).
oracle_empty(2, 6).
oracle_empty(0, 5).
oracle_empty(1, 5).
oracle_empty(2, 5).
oracle_empty(0, 4).
oracle_empty(2, 4).
oracle_empty(0, 3).
oracle_empty(1, 3).
oracle_empty(2, 3).
oracle_empty(0, 2).
oracle_empty(1, 2).
oracle_empty(2, 2).
oracle_empty(0, 1).
oracle_empty(1, 1).
oracle_empty(2, 1).
oracle_empty(0, 0).
oracle_empty(2, 0).
oracle_empty(3, 0).
oracle_empty(3, 1).
oracle_empty(3, 2).
oracle_empty(3, 4).
oracle_empty(3, 5).
oracle_empty(3, 7).
oracle_empty(3, 8).
oracle_empty(3, 9).
oracle_empty(3, 10).
oracle_empty(4, 8).
oracle_empty(4, 9).
oracle_empty(4, 10).
oracle_empty(4, 7).
oracle_empty(4, 6).
oracle_empty(4, 5).
oracle_empty(4, 4).
oracle_empty(4, 3).
oracle_empty(4, 2).
oracle_empty(4, 1).
oracle_empty(4, 0).
oracle_empty(5, 1).
oracle_empty(5, 2).
oracle_empty(5, 3).
oracle_empty(5, 4).
oracle_empty(5, 5).
oracle_empty(5, 6).
oracle_empty(5, 8).
oracle_empty(5, 9).
oracle_empty(5, 10).
oracle_empty(6, 8).
oracle_empty(6, 9).
oracle_empty(6, 10).
oracle_empty(6, 7).
oracle_empty(6, 6).
oracle_empty(6, 5).
oracle_empty(6, 4).
oracle_empty(6, 3).
oracle_empty(6, 2).
oracle_empty(6, 1).
oracle_empty(6, 0).
oracle_empty(7, 0).
oracle_empty(7, 1).
oracle_empty(7, 2).
oracle_empty(7, 3).
oracle_empty(7, 4).
oracle_empty(7, 6).
oracle_empty(7, 7).
oracle_empty(7, 8).
oracle_empty(7, 9).
oracle_empty(7, 10).
oracle_empty(8, 8).
oracle_empty(8, 9).
oracle_empty(8, 10).
oracle_empty(8, 7).
oracle_empty(8, 6).
oracle_empty(8, 5).
oracle_empty(8, 4).
oracle_empty(8, 3).
oracle_empty(8, 2).
oracle_empty(8, 1).
oracle_empty(8, 0).
oracle_empty(9, 0).
oracle_empty(9, 1).
oracle_empty(9, 3).
oracle_empty(9, 4).
oracle_empty(9, 5).
oracle_empty(9, 6).
oracle_empty(9, 8).
oracle_empty(9, 9).
oracle_empty(9, 10).
oracle_empty(10, 8).
oracle_empty(10, 9).
oracle_empty(10, 10).
oracle_empty(10, 7).
oracle_empty(10, 6).
oracle_empty(10, 5).
oracle_empty(10, 4).
oracle_empty(10, 3).
oracle_empty(10, 2).
oracle_empty(10, 1).
oracle_empty(10, 0).
