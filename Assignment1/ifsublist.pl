ifsublist([], _).
ifsublist([X|S], [X|L]):-   %X is a sublist of Y
    ifprefix(S, L),
    !.
    
ifsublist([X|S], [Y|L]):-
    ifsublist([X|S], L).

ifprefix([], _).
ifprefix([X|S], [X|L]):-
    ifprefix(S, L).
