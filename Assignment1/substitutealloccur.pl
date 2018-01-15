substitutealloccur(_, [], _, []).
substitutealloccur(X, [X|L], Y, [Y|M]):-
    substitutealloccur(X, L, Y, M),
    !.
substitutealloccur(X, [A|L], Y, [A|M]):-
    substitutealloccur(X, L, Y, M).