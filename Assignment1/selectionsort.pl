selectionsort([], []).
selectionsort(L, [M|S]):-
    least(M, L, R),
    selectionsort(R, S).

least(M, L, R):-
    myselect(M, L, R),
    smaller(M, R).

smaller(_, []).
smaller(X, [H|T]):-
    X =< H,
    smaller(X, T).