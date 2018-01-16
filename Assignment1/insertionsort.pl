insertionsort([], []).
insertionsort([X|L], S):-
    insertionsort(L, S1),
    orderedinsert(X, S1, S).

orderedinsert(X, [], [X]).
orderedinsert(X, [T|L], [X|[T|L]]):-
    X =< T,!.
orderedinsert(X, [T|L], [T|Y]):-
    orderedinsert(X, L, Y).