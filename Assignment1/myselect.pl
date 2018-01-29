myselect(X, [X|R], R).
myselect(X, [Y|L], [Y|R]):-
    myselect(X, L, R).