quicksort(L, S):-
    quicksortacc(L, [], S).

quicksortacc([], A, A).
quicksortacc([X|L], A, S):-
    partition(L, Lt, X, Gt),
    quicksortacc(Gt, A, Gs),
    quicksortacc(Lt, [X|Gs], S).

partition([], [], _, []).
partition([X|L], [X|Lt], H, Gt):-
    X =< H,
    !,
    partition(L, Lt, H, Gt).
partition([X|L], Lt, H, [X|Gt]):-
    partition(L, Lt, H, Gt).