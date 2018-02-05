not(P):- 
    (call(P) -> fail ; true). 

nexthigherpermutation(L1, L):-
    higherpermutation(L1, L),
    not(farhigherpermutation(L1, L)).

higherpermutation(L1, L):-
    permutatelist(L1, L),
    higher(L, L1).

higher([H1|T1], [H|T]):-
    H1 > H,
    !.

higher([H|T1], [H|T]):-
    higher(T1, T).

farhigherpermutation(L1, L):-
    higherpermutation(L2, L),
    higher(L1, L2).