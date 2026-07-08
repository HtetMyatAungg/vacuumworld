grid(grid(10, 8,
   [ (northwest),
     (neighbordir(South), neighborderdir(West)),
     [(N=0, W=6),
      (N#<15, N#>, W=N mod 8 * 2 + 1#7),
      (N=W/2+4#, E=(W-2)#8,
       S=W/E/N#south, NE=W/E*N-W/E#northeast,
       SW=E/W*W-N#southeast#west, SE=W/E*E-W/N*north#northwest)
     ],
   gridcontents([(N=0, W=6),
      [(C,W,D,A),
       (2,1,E,(9af04778-08d6-4e40-8c6f-ba123d292a22),A#orange),],
       ...]))).