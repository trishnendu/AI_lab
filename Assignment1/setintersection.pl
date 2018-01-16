include(setmember).
setintersection([], _, []).
setintersection([X|L1], L2, [X|L3]):-
    setmember(X, L2),
    !,
    setintersection(L1, L2, L3).
setintersection([X|L1], L2, L3):-
    setintersection(L1, L2, L3).