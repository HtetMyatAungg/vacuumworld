:- discontiguous wall/3.
:- discontiguous dirt/3.
:- discontiguous agent/4.
:- discontiguous empty/2.

grid_size(5, 5).

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

dirt(2, 3, orange).
dirt(1, 2, green).
dirt(3, 1, orange).

agent(2, 0, 'c942b0ce-6c70-4311-a5b7-6b2640fe417c', green).
agent(4, 2, 'ec1d58f6-6db4-473d-af3e-518ca49c39f9', orange).

empty(0, 3).
empty(1, 3).
empty(0, 4).
empty(1, 4).
empty(2, 4).
empty(0, 2).
empty(2, 2).
empty(0, 1).
empty(1, 1).
empty(2, 1).
empty(0, 0).
empty(1, 0).
empty(3, 0).
empty(3, 2).
empty(3, 3).
empty(3, 4).
empty(4, 3).
empty(4, 4).
empty(4, 1).
empty(4, 0).