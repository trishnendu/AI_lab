permutationsort([], []).
permutationsort(L, S):-
    permutatelist(L, S),
    ifordered(S),
    !.
permutationsort(L, S):-
    permutationsort(L, S).    
ifordered([]).
ifordered([X]).
ifordered([X|[Y|R]]):-
    X =< Y,
    ifordered([Y|R]).