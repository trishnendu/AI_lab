ifsubsequence([], _).
ifsubsequence([X|L], [X|M]):-
    ifsubsequence(L, M),
    !.
ifsubsequence([X|L], [Y|M]):-
    ifsubsequence([X|L], M).