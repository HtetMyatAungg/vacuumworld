:- discontiguous wall/3.
:- discontiguous dirt/3.
:- discontiguous agent/4.
:- discontiguous empty/2.

grid_size(11, 11).

wall(0, 9, west).
wall(1, 10, south).
wall(0, 10, south).
wall(0, 10, west).
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
wall(0, 9, west).

dirt(1, 4, orange).
dirt(3, 3, orange).
dirt(3, 6, orange).
dirt(5, 7, orange).
dirt(7, 5, green).
dirt(9, 2, green).
dirt(9, 7, green).

agent(1, 0, "d3af9897-9139-4ffe-8a15-2e9c6f06e71a", orange).
agent(5, 0, "d6428e63-73b7-40a5-9cc9-ea3b5e61a86d", green).

empty(0, 9) :- \+ dirt(0, 9, _), \+ agent(0, 9, _, _).
empty(1, 9) :- \+ dirt(1, 9, _), \+ agent(1, 9, _, _).
empty(2, 9) :- \+ dirt(2, 9, _), \+ agent(2, 9, _, _).
empty(0, 10) :- \+ dirt(0, 10, _), \+ agent(0, 10, _, _).
empty(1, 10) :- \+ dirt(1, 10, _), \+ agent(1, 10, _, _).
empty(2, 10) :- \+ dirt(2, 10, _), \+ agent(2, 10, _, _).
empty(0, 8) :- \+ dirt(0, 8, _), \+ agent(0, 8, _, _).
empty(1, 8) :- \+ dirt(1, 8, _), \+ agent(1, 8, _, _).
empty(2, 8) :- \+ dirt(2, 8, _), \+ agent(2, 8, _, _).
empty(0, 7) :- \+ dirt(0, 7, _), \+ agent(0, 7, _, _).
empty(1, 7) :- \+ dirt(1, 7, _), \+ agent(1, 7, _, _).
empty(2, 7) :- \+ dirt(2, 7, _), \+ agent(2, 7, _, _).
empty(0, 6) :- \+ dirt(0, 6, _), \+ agent(0, 6, _, _).
empty(1, 6) :- \+ dirt(1, 6, _), \+ agent(1, 6, _, _).
empty(2, 6) :- \+ dirt(2, 6, _), \+ agent(2, 6, _, _).
empty(0, 5) :- \+ dirt(0, 5, _), \+ agent(0, 5, _, _).
empty(1, 5) :- \+ dirt(1, 5, _), \+ agent(1, 5, _, _).
empty(2, 5) :- \+ dirt(2, 5, _), \+ agent(2, 5, _, _).
empty(0, 4) :- \+ dirt(0, 4, _), \+ agent(0, 4, _, _).
empty(2, 4) :- \+ dirt(2, 4, _), \+ agent(2, 4, _, _).
empty(0, 3) :- \+ dirt(0, 3, _), \+ agent(0, 3, _, _).
empty(1, 3) :- \+ dirt(1, 3, _), \+ agent(1, 3, _, _).
empty(2, 3) :- \+ dirt(2, 3, _), \+ agent(2, 3, _, _).
empty(0, 2) :- \+ dirt(0, 2, _), \+ agent(0, 2, _, _).
empty(1, 2) :- \+ dirt(1, 2, _), \+ agent(1, 2, _, _).
empty(2, 2) :- \+ dirt(2, 2, _), \+ agent(2, 2, _, _).
empty(0, 1) :- \+ dirt(0, 1, _), \+ agent(0, 1, _, _).
empty(1, 1) :- \+ dirt(1, 1, _), \+ agent(1, 1, _, _).
empty(2, 1) :- \+ dirt(2, 1, _), \+ agent(2, 1, _, _).
empty(0, 0) :- \+ dirt(0, 0, _), \+ agent(0, 0, _, _).
empty(2, 0) :- \+ dirt(2, 0, _), \+ agent(2, 0, _, _).
empty(3, 0) :- \+ dirt(3, 0, _), \+ agent(3, 0, _, _).
empty(3, 1) :- \+ dirt(3, 1, _), \+ agent(3, 1, _, _).
empty(3, 2) :- \+ dirt(3, 2, _), \+ agent(3, 2, _, _).
empty(3, 4) :- \+ dirt(3, 4, _), \+ agent(3, 4, _, _).
empty(3, 5) :- \+ dirt(3, 5, _), \+ agent(3, 5, _, _).
empty(3, 7) :- \+ dirt(3, 7, _), \+ agent(3, 7, _, _).
empty(3, 8) :- \+ dirt(3, 8, _), \+ agent(3, 8, _, _).
empty(3, 9) :- \+ dirt(3, 9, _), \+ agent(3, 9, _, _).
empty(3, 10) :- \+ dirt(3, 10, _), \+ agent(3, 10, _, _).
empty(4, 0) :- \+ dirt(4, 0, _), \+ agent(4, 0, _, _).
empty(4, 1) :- \+ dirt(4, 1, _), \+ agent(4, 1, _, _).
empty(4, 2) :- \+ dirt(4, 2, _), \+ agent(4, 2, _, _).
empty(4, 3) :- \+ dirt(4, 3, _), \+ agent(4, 3, _, _).
empty(4, 4) :- \+ dirt(4, 4, _), \+ agent(4, 4, _, _).
empty(4, 5) :- \+ dirt(4, 5, _), \+ agent(4, 5, _, _).
empty(4, 6) :- \+ dirt(4, 6, _), \+ agent(4, 6, _, _).
empty(4, 7) :- \+ dirt(4, 7, _), \+ agent(4, 7, _, _).
empty(4, 8) :- \+ dirt(4, 8, _), \+ agent(4, 8, _, _).
empty(4, 9) :- \+ dirt(4, 9, _), \+ agent(4, 9, _, _).
empty(4, 10) :- \+ dirt(4, 10, _), \+ agent(4, 10, _, _).
empty(5, 1) :- \+ dirt(5, 1, _), \+ agent(5, 1, _, _).
empty(5, 2) :- \+ dirt(5, 2, _), \+ agent(5, 2, _, _).
empty(5, 3) :- \+ dirt(5, 3, _), \+ agent(5, 3, _, _).
empty(5, 4) :- \+ dirt(5, 4, _), \+ agent(5, 4, _, _).
empty(5, 5) :- \+ dirt(5, 5, _), \+ agent(5, 5, _, _).
empty(5, 6) :- \+ dirt(5, 6, _), \+ agent(5, 6, _, _).
empty(5, 8) :- \+ dirt(5, 8, _), \+ agent(5, 8, _, _).
empty(5, 9) :- \+ dirt(5, 9, _), \+ agent(5, 9, _, _).
empty(5, 10) :- \+ dirt(5, 10, _), \+ agent(5, 10, _, _).
empty(6, 0) :- \+ dirt(6, 0, _), \+ agent(6, 0, _, _).
empty(6, 1) :- \+ dirt(6, 1, _), \+ agent(6, 1, _, _).
empty(6, 2) :- \+ dirt(6, 2, _), \+ agent(6, 2, _, _).
empty(6, 3) :- \+ dirt(6, 3, _), \+ agent(6, 3, _, _).
empty(6, 4) :- \+ dirt(6, 4, _), \+ agent(6, 4, _, _).
empty(6, 5) :- \+ dirt(6, 5, _), \+ agent(6, 5, _, _).
empty(6, 6) :- \+ dirt(6, 6, _), \+ agent(6, 6, _, _).
empty(6, 7) :- \+ dirt(6, 7, _), \+ agent(6, 7, _, _).
empty(6, 8) :- \+ dirt(6, 8, _), \+ agent(6, 8, _, _).
empty(6, 9) :- \+ dirt(6, 9, _), \+ agent(6, 9, _, _).
empty(6, 10) :- \+ dirt(6, 10, _), \+ agent(6, 10, _, _).
empty(7, 0) :- \+ dirt(7, 0, _), \+ agent(7, 0, _, _).
empty(7, 1) :- \+ dirt(7, 1, _), \+ agent(7, 1, _, _).
empty(7, 2) :- \+ dirt(7, 2, _), \+ agent(7, 2, _, _).
empty(7, 3) :- \+ dirt(7, 3, _), \+ agent(7, 3, _, _).
empty(7, 4) :- \+ dirt(7, 4, _), \+ agent(7, 4, _, _).
empty(7, 6) :- \+ dirt(7, 6, _), \+ agent(7, 6, _, _).
empty(7, 7) :- \+ dirt(7, 7, _), \+ agent(7, 7, _, _).
empty(7, 8) :- \+ dirt(7, 8, _), \+ agent(7, 8, _, _).
empty(7, 9) :- \+ dirt(7, 9, _), \+ agent(7, 9, _, _).
empty(7, 10) :- \+ dirt(7, 10, _), \+ agent(7, 10, _, _).
empty(8, 0) :- \+ dirt(8, 0, _), \+ agent(8, 0, _, _).
empty(8, 1) :- \+ dirt(8, 1, _), \+ agent(8, 1, _, _).
empty(8, 2) :- \+ dirt(8, 2, _), \+ agent(8, 2, _, _).
empty(8, 3) :- \+ dirt(8, 3, _), \+ agent(8, 3, _, _).
empty(8, 4) :- \+ dirt(8, 4, _), \+ agent(8, 4, _, _).
empty(8, 5) :- \+ dirt(8, 5, _), \+ agent(8, 5, _, _).
empty(8, 6) :- \+ dirt(8, 6, _), \+ agent(8, 6, _, _).
empty(8, 7) :- \+ dirt(8, 7, _), \+ agent(8, 7, _, _).
empty(8, 8) :- \+ dirt(8, 8, _), \+ agent(8, 8, _, _).
empty(8, 9) :- \+ dirt(8, 9, _), \+ agent(8, 9, _, _).
empty(8, 10) :- \+ dirt(8, 10, _), \+ agent(8, 10, _, _).
empty(9, 0) :- \+ dirt(9, 0, _), \+ agent(9, 0, _, _).
empty(9, 1) :- \+ dirt(9, 1, _), \+ agent(9, 1, _, _).
empty(9, 3) :- \+ dirt(9, 3, _), \+ agent(9, 3, _, _).
empty(9, 4) :- \+ dirt(9, 4, _), \+ agent(9, 4, _, _).
empty(9, 5) :- \+ dirt(9, 5, _), \+ agent(9, 5, _, _).
empty(9, 6) :- \+ dirt(9, 6, _), \+ agent(9, 6, _, _).
empty(9, 8) :- \+ dirt(9, 8, _), \+ agent(9, 8, _, _).
empty(9, 9) :- \+ dirt(9, 9, _), \+ agent(9, 9, _, _).
empty(9, 10) :- \+ dirt(9, 10, _), \+ agent(9, 10, _, _).
empty(10, 0) :- \+ dirt(10, 0, _), \+ agent(10, 0, _, _).
empty(10, 1) :- \+ dirt(10, 1, _), \+ agent(10, 1, _, _).
empty(10, 2) :- \+ dirt(10, 2, _), \+ agent(10, 2, _, _).
empty(10, 3) :- \+ dirt(10, 