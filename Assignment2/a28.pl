%flatten1(L, L1)
flatten1([], []).
flatten1([X|L], F):-
    !,
    flatten1(X, F1),
    flatten1(L, F2),
    append(F1, F2, F).
flatten1(X, [X]).


