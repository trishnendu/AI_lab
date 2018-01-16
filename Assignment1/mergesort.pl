mergesort([], []).
mergesort([X], [X]).
mergesort(L, S):-
    divide(L, L1, L2),
    mergesort(L1, L1s),
    mergesort(L2, L2s),
    orderedmerge(L1s, L2s, S).

divide([], [], []).
divide([X], [X], []).
divide([X|[Y|L]], [X|L1], [Y|L2]):-
    divide(L, L1, L2).

orderedmerge(L1, [], L1).
orderedmerge([], L2, L2).
orderedmerge([X|L1], [Y|L2], [X|L]):-
    X < Y, 
    !,
    orderedmerge(L1, [Y|L2], L).
orderedmerge([X|L1], [Y|L2], [Y|L]):-
    X > Y, 
    !,
    orderedmerge([X|L1], L2, L).
orderedmerge([X|L1], [Y|L2], [X|[Y|L]]):-
    orderedmerge(L1, L2, L).    

