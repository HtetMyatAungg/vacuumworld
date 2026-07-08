grid(8) :-
    agent(_ID1, [N1 = 4]), !,
    grid(N1+1).
grid(N1, Cell) :-
    (N1 < 8 -> N2 is N1 + 1; N2 = N1 - 1),
    grid(N2, Cell_2),
    member(Cell_2, [north(Cell3), west(Cell4), south(Cell5)]),
    append(north(Cell3), _SouthCellList, NorthCells),
    append(_NorthCells, [_; east(Cell2)], Cells),
    append(Cells, south(Cell5), Cell).

agent(a97256c1-5d7d-4b3a-b0e2-e8ccbf7f6bdc, north(south(Up))).
agent(20d056b7-9456-40ee-a48a-018aa1b844c2, south(Cell)).
agent(b3f7cbb6-dbcf-4e8d-b98c-c235a6f18fa4, west(down(Up))).
agent(9af04778-08d6-4e40-8c6f-ba123d292a22, N=6.E=0. NorthEast=false.South=true.West=true)).
agent(02a6d9ea-8b8e-4750-8000-c3a74a63fd9c, [N=1.E=3.NorthEast=false.South=true.West=true)). 
agent(02ab111f-7d7f-4e02-b8db-ebaa3edbbfa9, N=2).
agent(fc1fe43d-edec-402f-8c37-b8dd955af2f2, [N=4.E=0.NorthEast=false.South=true.West=true)).
agent(7e4a3965-cbe2-4db0-a4f9-b81fc3da2bdc, ).
agent(b4c3d716-adba-45ec-93c4-dcbfae654eae, ).
agent(3cf3f73a-b038-424d-a1bf-dd99bb29d30b, N=0).