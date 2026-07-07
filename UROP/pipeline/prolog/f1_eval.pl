% ground truth/oracle: 8x8 sweep
:- discontiguous oracle_dirt/3.
:- discontiguous oracle_agent/4.
:- discontiguous oracle_empty/2.
:- discontiguous wall/3.
grid_size(8).
grid(0, 6).
grid(1, 6).
grid(2, 6).
grid(0, 7).
grid(1, 7).
grid(2, 7).
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
grid(4, 5).
grid(4, 6).
grid(4, 7).
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
grid(6, 5).
grid(6, 6).
grid(6, 7).
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
wall(0, 6, west).
wall(0, 7, south).
wall(0, 7, west).
wall(1, 7, south).
wall(2, 7, south).
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
wall(3, 7, south).
wall(4, 7, south).
wall(4, 0, north).
wall(5, 0, north).
wall(5, 7, south).
wall(6, 7, south).
wall(6, 0, north).
wall(7, 0, east).
wall(7, 0, north).
wall(7, 1, east).
wall(7, 2, east).
wall(7, 3, east).
wall(7, 4, east).
wall(7, 5, east).
wall(7, 6, east).
wall(7, 7, east).
wall(7, 7, south).
oracle_dirt(2, 1, orange).
oracle_dirt(3, 4, orange).
oracle_dirt(4, 6, orange).
oracle_dirt(5, 1, green).
oracle_dirt(6, 4, orange).
oracle_agent('9af04778-08d6-4e40-8c6f-ba123d292a22', 0, 3, orange).
oracle_agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c', 4, 0, green).
oracle_empty(0, 6).
oracle_empty(1, 6).
oracle_empty(2, 6).
oracle_empty(0, 7).
oracle_empty(1, 7).
oracle_empty(2, 7).
oracle_empty(0, 5).
oracle_empty(1, 5).
oracle_empty(2, 5).
oracle_empty(0, 4).
oracle_empty(1, 4).
oracle_empty(2, 4).
oracle_empty(1, 3).
oracle_empty(2, 3).
oracle_empty(0, 2).
oracle_empty(1, 2).
oracle_empty(2, 2).
oracle_empty(0, 1).
oracle_empty(1, 1).
oracle_empty(0, 0).
oracle_empty(1, 0).
oracle_empty(2, 0).
oracle_empty(3, 0).
oracle_empty(3, 1).
oracle_empty(3, 2).
oracle_empty(3, 3).
oracle_empty(3, 5).
oracle_empty(3, 6).
oracle_empty(3, 7).
oracle_empty(4, 5).
oracle_empty(4, 7).
oracle_empty(4, 4).
oracle_empty(4, 3).
oracle_empty(4, 2).
oracle_empty(4, 1).
oracle_empty(5, 0).
oracle_empty(5, 2).
oracle_empty(5, 3).
oracle_empty(5, 4).
oracle_empty(5, 5).
oracle_empty(5, 6).
oracle_empty(5, 7).
oracle_empty(6, 5).
oracle_empty(6, 6).
oracle_empty(6, 7).
oracle_empty(6, 3).
oracle_empty(6, 2).
oracle_empty(6, 1).
oracle_empty(6, 0).
oracle_empty(7, 0).
oracle_empty(7, 1).
oracle_empty(7, 2).
oracle_empty(7, 3).
oracle_empty(7, 4).
oracle_empty(7, 5).
oracle_empty(7, 6).
oracle_empty(7, 7).
