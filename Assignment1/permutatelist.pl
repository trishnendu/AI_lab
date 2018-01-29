include(myselect).
permutatelist([], []).
permutatelist(L, [H|R]):-
    myselect(H, L, T),
    permutatelist(T, R).
    
