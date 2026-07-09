edge(X, Y, wall) :- between(0, 7, X), between(0, 7, Y).
edge(X, Y, dirt) :- between(0, 7, X), between(0, 7, Y).
edge(X, Y, agent) :- between(0, 7, X), between(0, 7, Y).