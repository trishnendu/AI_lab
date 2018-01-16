include(setmember).
setunion([], L, L).
setunion([X|L1], L2, L3):-
    setmember(X, L2),
    !,
    setunion(L1, L2, L3).
setunion([X|L1], L2, [X|L3]):-
    setunion(L1, L2, L3).