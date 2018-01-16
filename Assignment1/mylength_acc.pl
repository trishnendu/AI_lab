mylength_acc(L, N):-
    lacc(L, 0, N).
lacc([], A, A).
lacc([X|L], A, N):-
    B is A + 1,
    lacc(L, B, N).
    