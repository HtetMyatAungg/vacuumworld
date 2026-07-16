:- dynamic cell/2, dirt/3, agent/4, wall/3.

grid_size(11, 11).

cell(0, 9).
cell(1, 9).
cell(2, 9).
cell(0, 10).
cell(1, 10).
cell(2, 10).
cell(0, 8).
cell(1, 8).
cell(2, 8).
cell(0, 7).
cell(1, 7).
cell(2, 7).
cell(0, 6).
cell(1, 6).
cell(2, 6).
cell(0, 5).
cell(1, 5).
cell(2, 5).
cell(0, 4).
cell(1, 4).
cell(2, 4).
cell(0, 3).
cell(1, 3).
cell(2, 3).
cell(0, 2).
cell(1, 2).
cell(2, 2).
cell(0, 1).
cell(1, 1).
cell(2, 1).
cell(0, 0).
cell(1, 0).
cell(2, 0).
cell(3, 0).
cell(3, 1).
cell(3, 2).
cell(3, 3).
cell(3, 4).
cell(3, 5).
cell(3, 6).
cell(3, 7).
cell(3, 8).
cell(3, 9).
cell(3, 10).
cell(4, 8).
cell(4, 9).
cell(4, 10).
cell(4, 7).
cell(4, 6).
cell(4, 5).
cell(4, 4).
cell(4, 3).
cell(4, 2).
cell(4, 1).
cell(4, 0).
cell(5, 0).
cell(5, 1).
cell(5, 2).
cell(5, 3).
cell(5, 4).
cell(5, 5).
cell(5, 6).
cell(5, 7).
cell(5, 8).
cell(5, 9).
cell(5, 10).
cell(6, 8).
cell(6, 9).
cell(6, 10).
cell(6, 7).
cell(6, 6).
cell(6, 5).
cell(6, 4).
cell(6, 3).
cell(6, 2).
cell(6, 1).
cell(6, 0).
cell(7, 0).
cell(7, 1).
cell(7, 2).
cell(7, 3).
cell(7, 4).
cell(7, 5).
cell(7, 6).
cell(7, 7).
cell(7, 8).
cell(7, 9).
cell(7, 10).
cell(8, 8).
cell(8, 9).
cell(8, 10).
cell(8, 7).
cell(8, 6).
cell(8, 5).
cell(8, 4).
cell(8, 3).
cell(8, 2).
cell(8, 1).
cell(8, 0).
cell(9, 0).
cell(9, 1).
cell(9, 2).
cell(9, 3).
cell(9, 4).
cell(9, 5).
cell(9, 6).
cell(9, 7).
cell(9, 8).
cell(9, 9).
cell(9, 10).
cell(10, 8).
cell(10, 9).
cell(10, 10).
cell(10, 7).
cell(10, 6).
cell(10, 5).
cell(10, 4).
cell(10, 3).
cell(10, 2).
cell(10, 1).
cell(10, 0).

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