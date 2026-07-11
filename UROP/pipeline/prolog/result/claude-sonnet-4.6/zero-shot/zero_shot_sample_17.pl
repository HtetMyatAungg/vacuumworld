:- discontiguous wall/3.
:- discontiguous dirt/3.
:- discontiguous agent/4.
:- discontiguous empty/2.

grid_size(11, 11).

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

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent(1, 0, 'd3af9897-9139-4ffe-8a15-2e9c6f06e71a', orange).
agent(5, 0, 'd6428e63-73b7-40a5-9cc9-ea3b5e61a86d', green).

empty(0, 9) :- true.
empty(1, 9) :- true.
empty(2, 9) :- true.
empty(1, 10) :- true.
empty(2, 10) :- true.
empty(0, 10) :- true.
empty(0, 8) :- true.
empty(1, 8) :- true.
empty(2, 8) :- true.
empty(0, 7) :- true.
empty(1, 7) :- true.
empty(2, 7) :- true.
empty(0, 6) :- true.
empty(1, 6) :- true.
empty(2, 6) :- true.
empty(0, 5) :- true.
empty(1, 5) :- true.
empty(2, 5) :- true.
empty(0, 4) :- true.
empty(2, 4) :- true.
empty(0, 3) :- true.
empty(1, 3) :- true.
empty(2, 3) :- true.
empty(0, 2) :- true.
empty(1, 2) :- true.
empty(2, 2) :- true.
empty(0, 1) :- true.
empty(1, 1) :- true.
empty(2, 1) :- true.
empty(0, 0) :- true.
empty(2, 0) :- true.
empty(3, 0) :- true.
empty(3, 1) :- true.
empty(3, 2) :- true.
empty(3, 4) :- true.
empty(3, 5) :- true.
empty(3, 7) :- true.
empty(3, 8) :- true.
empty(3, 9) :- true.
empty(3, 10) :- true.
empty(4, 8) :- true.
empty(4, 9) :- true.
empty(4, 10) :- true.
empty(4, 7) :- true.
empty(4, 6) :- true.
empty(4, 5) :- true.
empty(4, 4) :- true.
empty(4, 3) :- true.
empty(4, 2) :- true.
empty(4, 1) :- true.
empty(4, 0) :- true.
empty(5, 1) :- true.
empty(5, 2) :- true.
empty(5, 3) :- true.
empty(5, 4) :- true.
empty(5, 5) :- true.
empty(5, 6) :- true.
empty(5, 8) :- true.
empty(5, 9) :- true.
empty(5, 10) :- true.
empty(6, 8) :- true.
empty(6, 9) :- true.
empty(6, 10) :- true.
empty(6, 7) :- true.
empty(6, 6) :- true.
empty(6, 5) :- true.
empty(6, 4) :- true.
empty(6, 3) :- true.
empty(6, 2) :- true.
empty(6, 1) :- true.
empty(6, 0) :- true.
empty(7, 0) :- true.
empty(7, 1) :- true.
empty(7, 2) :- true.
empty(7, 3) :- true.
empty(7, 4) :- true.
empty(7, 6) :- true.
empty(7, 7) :- true.
empty(7, 8) :- true.
empty(7, 9) :- true.
empty(7, 10) :- true.
empty(8, 8) :- true.
empty(8, 9) :- true.
empty(8, 10) :- true.
empty(8, 7) :- true.
empty(8, 6) :- true.
empty(8, 5) :- true.
empty(8, 4) :- true.
empty(8, 3) :- true.
empty(8, 2) :- true.
empty(8, 1) :- true.
empty(8, 0) :- true.
empty(9, 0) :- true.
empty(9, 1) :- true.
empty(9, 3) :- true.
empty(9, 4) :- true.
empty(9, 5) :- true.
empty(9, 6) :- true.
empty(9, 8) :- true.
empty(9, 9) :- true.
empty(9, 10) :- true.
empty(10, 8) :- true.
empty(10, 9) :- true.
empty(10, 10) :- true.
empty(10, 7) :- true.
empty(10, 6) :- true.
empty(10, 5) :- true.
empty(10, 4) :- true.
empty(10, 3) :- true.
empty(10, 2) :- true.
empty(10, 1) :- true.
empty(10, 0) :- true.