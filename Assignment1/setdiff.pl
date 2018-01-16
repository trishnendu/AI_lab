include(setmember).
setdiff([], _, []).
setdiff([X|L1], L2, L3):-
    setmember(X, L2),
    !,
    setdiff(L1, L2, L3).
setdiff([X|L1], L2, [X|L3]):-
    setdiff(L1, L2, L3).