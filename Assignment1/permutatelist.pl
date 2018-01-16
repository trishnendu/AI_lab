permutatelist([], []).
permutatelist([H|R], L):-
    permutatelist(R, T),
    myselect(H, L, T).
