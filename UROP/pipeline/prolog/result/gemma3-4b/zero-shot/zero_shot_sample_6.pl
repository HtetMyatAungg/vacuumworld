% grid(X, Y, walls, dirt, agent)
% This allows us to specify that the cell at (X,Y) has the specified properties.

grid([0, 0], ['north', 'west'], null, null).
grid([1, 0], [], null, null).
grid([2, 0], [], null, null).
grid([0, 1], ['south', 'west'], null, null).
grid([1, 1], ['south'], null, null).
grid([2, 1], ['south'], null, null).
grid([0, 2], ['west'], null, null).
grid([1, 2], [], null, null).
grid([2, 2], [], null, null).
grid([0, 3], ['west'], agent(id('9af04778-08d6-4e40-8c6f-ba123d292a22'), colour('orange')) ,null).
grid([1, 3], [], null, null).
grid([2, 3], [], null, null).
grid([0, 4], ['west'], null, null).
grid([1, 4], [], null, null).