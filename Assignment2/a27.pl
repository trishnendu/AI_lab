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

%heap_sort
heapify(nil, nil).
heapify(bt(L, X, R), Heap):-
    heapify(L, Heapl),
    heapify(R, Heapr),
    adjust(X, Heapl, Heapr, Heap).

adjust(X, Heapl, Heapr, bt(Heapl, X, Heapr)):-
    greater(X, Heapl),
    greater(X, Heapr),!.

adjust(X, bt(L, X1, R), Heapr, bt(Heapl, X1, Heapr)):-
    X > X1,!,
    greater(X1, Heapr),
    adjust(X, L, R, Heapl).

adjust(X, Heapl, bt(L, X1, R), bt(Heapl, X1, Heapr)):-
    X > X1,!,
    greater(X1, Heapl),
    adjust(X, L, R, Heapr).

adjust(X, L, R, bt(L, X, R)).

greater(X, nil).
greater(X, tree(L, X1, R)):-
    X =< X1.

list_to_bt([X], bt(nil, X, nil)).
list_to_bt([X|L], bt(Left, X, nil)):-
    list_to_bt(L, Left).

heap_sort(L, S):-
    list_to_bt(L, Bt),
    heapify(Bt, Heap),
    remove_head(Heap, S).

remove_head(bt(nil, X, nil), [X]).
remove_head(bt(L, X, R), [X|S1]):-
    reheap(L, R, Heap),
    remove_head(Heap, S1).

reheap(L, nil, L).
reheap(nil, R, R).
reheap(bt(LL, X1, RL), bt(LR, X2, RR), bt(LH, X1, bt(LR, X2, RR))):-
    X1 =< X2,!,
    reheap(LL, RL, LH).
reheap(bt(LL, X1, RL), bt(LR, X2, RR), bt(bt(LL, X1, RL), X2, RH)):-
    reheap(LR, RR, RH).