bubble_sort(L, S):-
    bacc(L, [], S).

bacc([], A, A).
bacc([H|T], A, S):-
    bubble(H, T, NT, M),
    bacc(NT, [M|A], S).
   
bubble(X, [], [], X).
bubble(X, [Y|T], [Y|NT], M):-
    X>Y, !,
    bubble(X, T, NT, M).
bubble(X, [Y|T], [X|NT], M):-
    bubble(Y, T, NT, M).