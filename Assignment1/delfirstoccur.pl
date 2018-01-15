delfirstoccur(_, [], []).
delfirstoccur(X, [X|L], L):-
    !.
delfirstoccur(X, [Y|L], [Y|M]):-
    delfirstoccur(X, L, M).

