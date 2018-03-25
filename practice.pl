merge_sort([], []).
merge_sort([X], [X]).
merge_sort(L, S):-
    divide(L, L1, L2),
    merge_sort(L1, S1),
    merge_sort(L2, S2),
    ordered_merge(S1, S2, S).

divide([], [], []).
divide([X], [X], []).
divide([X|[Y|H]], [X|L1], [Y|L2]):-
    divide(H, L1, L2).

ordered_merge(L1, [], L1).
ordered_merge([], L2, L2).
ordered_merge([X|L1], [Y|L2], [X|L]):-
    X < Y, !,
    ordered_merge(L1, [Y|L2], L).
ordered_merge([X|L1], [Y|L2], [Y|L]):-
    Y < X, !,
    ordered_merge([X|L1], L2, L).
ordered_merge([X|L1], [Y|L2], [X|[Y|L]]):-
    X = Y, !,
    ordered_merge(L1, L2, L).


custom_rev(L, R):-
    custom_rev_help(L, L, [], R).
custom_rev_help([X|L], [A|[B|H]], F, R):-
    custom_rev_help(L, H, [X|F], R).
custom_rev_help([M|L], [X], F, R):-
    reverse(L, R1),
    append(F, [M|R1], R).    

myselect([H|L], H, L).
myselect([X|L], H, [X|R]):-
    myselect(L, H, R).

permutate_list([], []).
permutate_list(L, [H|P]):-
    myselect(L, H, R),
    permutate_list(R, P).

