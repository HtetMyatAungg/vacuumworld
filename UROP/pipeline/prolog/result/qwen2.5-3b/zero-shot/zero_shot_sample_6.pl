grid(grid),
k0(west,k0,west), k0(south,k0,south),
k1(west,k1,west), k1(north,k1,north),
k2(west,k2,west), k2(north,k2,north), k2(south,k2,south),
k3(west,k3,west), k3(east,k3,east), k3(north,k3,north), k3(south,k3,south),
k4(west,k4,west), k4(east,k4,east), k4(north,k4,north), k4(south,k4,south),
k5(west,k5,west), k5(east,k5,east), k5(north,k5,north), k5(south,k5,south),
k6(west,k6,west), k6(east,k6,east), k6(north,k6,north), k6(south,k6,south),
k7(west,k7,west), k7(north,k7,north), k7(east,k7,east), k7(south,k7,south).

grid(k0,west);grid(k1,west);grid(k2,west);grid(k3,west);grid(k4,west);grid(k5,west);grid(k6,west);grid(k7,west),

grid(k0,north);grid(k1,north);grid(k2,north);grid(k3,north);grid(k4,north);grid(k5,north);grid(k6,north);grid(k7,north),

k1(north,k0,east) ; k1(south,k0,south),

grid(k1,west), grid(k1,north),

grid(k2,west);grid(k2,north),

k3(west,k2,north) ; k3(south,k2,west) ;

grid(k2,west);grid(k2,east);grid(k2,north);

k4(east,k3,east), k4(north,k3,north);

grid(k3,west), grid(k3,north), grid(k3,south),

k5(west,k4,north) ; k5(south,k4,west); grid(k5,east) , grid(k5,north);

grid(k4,west), grid(k4,east), grid(k4,north),

k6(west,k5,west) ; k6(north,k5,south), grid(k6,east) ,

grid(k5,west), grid(k5,east), grid(k5,north).

k7(east,k6,west);k7(south,k6,north);

grid(k6,west), grid(k6,east),

grid(k7,west);grid(k7,east).