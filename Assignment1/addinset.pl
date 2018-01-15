addinset(X, [], [X]).
addinset(X, L, L):-
    mymember(X, L),
    !.
addinset(X, L, [X|L]).