grid_size(5).
grid(X, Y) :- X in [0..4], Y in [0..4].
dirt(X, Y, Colour) :- X in [0..4], Y in [0..4], Colour in {'orange', 'green'}.
agent(Id, X, Y, Colour) :- X in [0..4], Y in [0..4],
    (Id == '02a6d9ea-8b8e-4700-8c6f-ba123d292a22', Colour == 'orange') ;
    (Id == '9af04778-08d6-4e00-8c6f-ba123d292a22', Colour == 'green') ;
    (Id == 'abcdef12-3456-7890-abcd-efghijkl', Colour == 'orange') ;
    (Id == 'fedcba98-7654-3210-zyxw-vbnm', Colour == 'green').
empty(X, Y) :- X in [0..4], Y in [0..4].
wall(X, Y, N) :- X in [0..4], Y in [0..4],
    (X == 0, Y == 0, N == 'north');
    (X == 0, Y == 1, N == 'west');
    (X == 0, Y == 2, N == 'west');
    (X == 0, Y == 3, N == 'west');
    (X == 0, Y == 4, N == 'west');
    (X == 1, Y == 0, N == 'east');
    (X == 2, Y == 0, N == 'east');
    (X == 3, Y == 0, N == 'east');
    (X == 4, Y == 0, N == 'east');
    (X == 4, Y == 1, N == 'east');
    (X == 4, Y == 2, N == 'east');
    (X == 4, Y == 3, N == 'east');
    (X == 4, Y == 4, N == 'east');
    (X == 1, Y == 4, N == 'east');
    (X == 2, Y == 4, N == 'east');
    (X == 3, Y == 4, N == 'east');
    (X == 4, Y == 4, N == 'south');
    (X == 3, Y == 4, N == 'south');
    (X == 1, Y == 4, N == 'south');
    (X == 2, Y == 4, N == 'south');
    (X == 3, Y == 4, N == 'south');
    (X == 5, Y == 0, N == 'east');
    (X == 6, Y == 0, N == 'east');
    (X == 7, Y == 0, N == 'east');
    (X == 7, Y == 1, N == 'east');
    (X == 7, Y == 2, N == 'east');
    (X == 7, Y == 3, N == 'east');
    (X == 7, Y == 4, N == 'east');
    (X == 7, Y == 5, N == 'east');
    (X == 7, Y == 6, N == 'east');
    (X == 7, Y == 7, N == 'east').