delalloccur(_, [], []).
delalloccur(X, [X|L], M):-
    delalloccur(X, L, M),
    !.
delalloccur(X, [Y|L], [Y|M]):-
    delalloccur(X, L, M).