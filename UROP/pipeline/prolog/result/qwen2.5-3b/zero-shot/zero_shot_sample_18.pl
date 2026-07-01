grid(
  [
    [_, _, _, _, _, _],
    [_ , _ , _ , _ , _ , _],
    [_ , _ , _ , _ , _ , _],
    [_ , _ , _ , _ , _ , _],
    [_ , _ , _ , _ , _ , _],
    [_ , _ , _ , _ , _ , _],
    [_ , _ , _ , _ , _ , _],
    [_, _, _, _, _, _]
  ]
).

walls(
  [wal(0,0,north)],
  [],
  [wal(1,0,north), wal(2,0,north), wal(3,0,north), wal(4,0,north), wal(5,0,north), wal(6,0,north), wal(7,0,north)],
  [wal(0,1), wal(1,1), wal(2,1), wal(3,1), wal(4,1), wal(5,1), wal(6,1), wal(7,1)],
  [wal(0,2), wal(1,2), wal(2,2), wal(3,2), wal(4,2), wal(5,2), wal(6,2), wal(7,2)],
  [wal(0,3), wal(1,3), wal(2,3), wal(3,3), wal(4,3), wal(5,3), wal(6,3), wal(7,3)],
  [wal(0,4), wal(1,4), wal(2,4), wal(3,4), wal(4,4), wal(5,4), wal(6,4), wal(7,4)],
  [wal(0,5), wal(1,5), wal(2,5), wal(3,5), wal(4,5), wal(5,5), wal(6,5), wal(7,5)],
  [wal(0,6), wal(1,6), wal(2,6), wal(3,6), wal(4,6), wal(5,6), wal(6,6), wal(7,6)]
).

agent('9af04778-08d6-4e40-8c6f-ba123d292a22'(_)),
agent('02a6d9ea-8b8e-4750-8000-c3a74a63fd9c').

dirt(orange(3,4), green(4,5)),

can_move(north, _),
can_move(south, []),
can_move(east, []),
can_move(west, []).

can_pass(wal(_,1,_)).