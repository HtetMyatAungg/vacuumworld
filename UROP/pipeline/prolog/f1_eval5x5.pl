% ground truth/oracle: 5x5 sweep
:- discontiguous oracle_dirt/3.
:- discontiguous oracle_agent/4.
:- discontiguous oracle_empty/2.
:- discontiguous wall/3.
grid_size(5).
grid(0, 3).
grid(1, 3).
grid(2, 3).
grid(0, 4).
grid(1, 4).
grid(2, 4).
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
grid(4, 2).
grid(4, 3).
grid(4, 4).
grid(4, 1).
grid(4, 0).
wall(0, 3, west).
wall(0, 4, south).
wall(0, 4, west).
wall(1, 4, south).
wall(2, 4, south).
wall(0, 2, west).
wall(0, 1, west).
wall(0, 0, north).
wall(0, 0, west).
wall(1, 0, north).
wall(2, 0, north).
wall(3, 0, north).
wall(3, 4, south).
wall(4, 2, east).
wall(4, 3, east).
wall(4, 4, east).
wall(4, 4, south).
wall(4, 1, east).
wall(4, 0, east).
wall(4, 0, north).
oracle_dirt(2, 3, orange).
oracle_dirt(1, 2, green).
oracle_dirt(3, 1, orange).
oracle_agent('c942b0ce-6c70-4311-a5b7-6b2640fe417c', 2, 0, green).
oracle_agent('ec1d58f6-6db4-473d-af3e-518ca49c39f9', 4, 2, orange).
oracle_empty(0, 3).
oracle_empty(1, 3).
oracle_empty(0, 4).
oracle_empty(1, 4).
oracle_empty(2, 4).
oracle_empty(0, 2).
oracle_empty(2, 2).
oracle_empty(0, 1).
oracle_empty(1, 1).
oracle_empty(2, 1).
oracle_empty(0, 0).
oracle_empty(1, 0).
oracle_empty(3, 0).
oracle_empty(3, 2).
oracle_empty(3, 3).
oracle_empty(3, 4).
oracle_empty(4, 3).
oracle_empty(4, 4).
oracle_empty(4, 1).
oracle_empty(4, 0).
