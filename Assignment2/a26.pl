%factorial(N, X)
factorial(0, 1).
factorial(N, X):-
    N1 is N-1,
    factorial(N1, X1),
    X is X1*N.

%using accumulator
fact(N, X):-
    factacc(N, 1, X).
factacc(0, A, A).
factacc(N, A, X):-
    N1 is N-1,
    A1 is A*N,
    factacc(N1, A1, X).
    
%reverselist(L, R)
reverselist([], []).
reverselist([X|L], R):-
    reverselist(L, R1),
    append(R1, [X], R).
    

%using acc
reversel(L, R):-
    reverselistacc(L, [], R).
reverselistacc([], A, A).
reverselistacc([X|L], L1, R):-
    append([X], L1, L2),
    reverselistacc(L, L2, R).

%removedup(L, L1)
removedup([], []).
removedup([X|L], L1):-
    member(X, L),!,
    removedup(L, L1).
removedup([X|L], [X|L1]):-
    removedup(L, L1).

%using acc
removedp(L, L1):-
    removedupacc(L, [], L1).
removedupacc([], A, A).
removedupacc([X|L], A, L1):-
    member(X, A), !,
    removedupacc(L, A, L1);
    removedupacc(L, [X|A], L1).

%quicksort(L, S)
quicksort([], []).
quicksort([X|L], S):-
    partiton(X, L, Left, Right),
    quicksort(Left, Leftsorted),
    quicksort(Right, Rightsorted),
    append(Leftsorted, [X], S1),
    append(S1, Rightsorted, S).
partiton(_, [], [], []).
partiton(X, [Y|L], [Y|L1], L2):-
    X >= Y,!,
    partiton(X, L, L1, L2).
partiton(X, [Y|L], L1, [Y|L2]):-
    partiton(X, L, L1, L2).
