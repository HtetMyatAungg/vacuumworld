grid_size(12).

grid(loc(X,Y)) :- between(0,VectLen,_), (VectLen is X + Y, V is floor(sqrt(VectLen)), X is V mod 2 + 1, Y is VectLen - vmod(V,2)).