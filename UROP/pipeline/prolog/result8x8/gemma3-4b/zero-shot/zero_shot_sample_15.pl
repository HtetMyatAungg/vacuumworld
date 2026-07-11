n_size := 8.

grid(X, Y, State) :-
    findall((Wx, Wy, Wz, Wyn), (
        (wx == nil) , (wy == nil) , (wz == nil) , (wyn == nil) % No walls
    ), [wx, wy, wz, wyn], State).

grid(X, Y, State) :-
    findall((Wx, Wy, Wz, Wyn), (
        (wx == ['west']) , (wy == nil) , (wz == nil) , (wyn == nil) % West Wall
    ), [wx, wy, wz, wyn], State).

grid(X, Y, State) :-
    findall((Wx, Wy, Wz, Wyn), (
        (wx == nil) , (wy == ['south']) , (wz == nil) , (wyn == nil) % South Wall
    ), [wx, wy, wz, wyn], State).

grid(X, Y, State) :-
    findall((Wx, Wy, Wz, Wyn), (
        (wx == nil) , (wy == nil) , (wz == ['east']) , (wyn == nil) % East Wall
    ), [wx, wy, wz, wyn], State).

grid(X, Y, State) :-
    findall((Wx, Wy, Wz, Wyn), (
        (wx == ['north']) , (wy == nil) , (wz == nil) , (wyn == nil) % North Wall
    ), [wx, wy, wz, wyn], State).

grid(X, Y, State) :-
    State = [[nil, nil, nil, nil, nil, nil, nil, nil],
           [nil, nil, nil, nil, nil, nil, nil, nil],
           [nil, nil, nil, nil, nil, nil, nil, nil],
           [nil, nil, nil, nil, nil, nil, nil, nil],
           [nil, nil, nil, nil, nil, nil, nil, nil],
           [nil, nil, nil, nil, nil, nil, nil, nil],
           [nil, nil, nil, nil, nil, nil, nil, nil],
           [nil, nil, nil, nil, nil, nil, nil, nil]
         ].