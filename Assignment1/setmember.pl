setmember(X, [X|_]):-
    !.
setmember(X, [Y|L]):-
    setmember(X, L).